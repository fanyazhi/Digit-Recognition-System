//==========================================================================
//digitrec.cpp
//==========================================================================
// @brief: A k-nearest-neighbor implementation for digit recognition (k=1)

#include "digitrec.h"

//----------------------------------------------------------
// Top function
//----------------------------------------------------------

void dut(
    hls::stream<bit32_t> &strm_in,
    hls::stream<bit32_t> &strm_out
)
{
  digit input;
  bit4_t output;

  // ------------------------------------------------------
  // Input processing
  // ------------------------------------------------------
  // Read the two input 32-bit words (low word first)
  bit32_t input_lo = strm_in.read();
  bit32_t input_hi = strm_in.read();

  // Convert input raw bits to fixed-point representation via bit slicing
  input(31, 0) = input_lo;
  input(input.length()-1, 32) = input_hi;

  // ------------------------------------------------------
  // Call DIGITREC 
  // ------------------------------------------------------
  output = digitrec( input );

  // ------------------------------------------------------
  // Output processing
  // ------------------------------------------------------
  // Write out the output digits
  strm_out.write( output(output.length()-1, 0) );

}

//----------------------------------------------------------
// Digitrec
//----------------------------------------------------------
// @param[in] : input - the testing instance
// @return : the recognized digit (0~9)

bit4_t digitrec( digit input ) 
{
  #include "training_data.h"

  // This array stores K minimum distances per training set
  bit6_t knn_set[10][K_CONST];

  // Initialize the knn set
  for ( int i = 0; i < 10; ++i )
    for ( int k = 0; k < K_CONST; ++k )
      // Note that the max distance is 49
      knn_set[i][k] = 50; 

  L1800: for ( int i = 0; i < TRAINING_SIZE; ++i ) {
    L10: for ( int j = 0; j < 10; j++ ) {
      // Read a new instance from the training set
      digit training_instance = training_data[j][i];
      // Update the KNN set
      update_knn( input, training_instance, knn_set[j] );
    }
  } 

  // Compute the final output
  return knn_vote( knn_set ); 
}



//-----------------------------------------------------------------------
// update_knn function
//-----------------------------------------------------------------------
// Given the test instance and a (new) training instance, this
// function maintains/updates an array of K minimum
// distances per training set.

// @param[in] : test_inst - the testing instance
// @param[in] : train_inst - the training instance
// @param[in/out] : min_distances[K_CONST] - the array that stores the current
//                  K_CONST minimum distance values per training set

void update_knn( digit test_inst, digit train_inst, bit6_t min_distances[K_CONST] )
{

  // -----------------------------
  // YOUR CODE GOES HERE
  // -----------------------------
  
  // find the distance between the test_inst and the train_inst
  int dist = 0;
  digit difference = test_inst ^ train_inst;

  for (int i = 0; i < 49; i++){
	  if (difference%2 != 0) {
		  dist++;
	  }
	  difference = difference >> 1;
  }
  // update the min distance array if this test_inst has less distance than 
  // any of the current distances stored. Keep the array sorted.  
for (int i = 0; i < K_CONST; i++) {
	  if ((dist < min_distances[i] && dist >= min_distances[i+1]) ||
	      (dist < min_distances[i] && min_distances[i] == 50) ||
	      (dist < min_distances[i] && i == (K_CONST-1) ) ) {
		  min_distances[i] = dist;
		  break;
	  }
  }
}


//-----------------------------------------------------------------------
// knn_vote function
//-----------------------------------------------------------------------
// Given 10xK minimum distance values, this function 
// finds the actual K nearest neighbors and determines the
// final output based on the most common digit represented by 
// these nearest neighbors (i.e., a vote among KNNs). 
//
// @param[in] : knn_set - 10xK_CONST min distance values
// @return : the recognized digit
// 

bit4_t knn_vote( bit6_t knn_set[10][K_CONST] )
{
  // stores both distance and the digit represented
  bit6_t min_distances[K_CONST];
  bit4_t voters[K_CONST];
  
  for ( int k = 0; k < K_CONST; k++ ) {
         min_distances[k] = 50;  
  }
 
 
  // find K_CONST number of minimum distances
  for (int i = 0; i < 10; i++) {
	  for (int j = 0; j < K_CONST; j++) {
		  for (int k = 0; k <K_CONST; k++) {
			  if ((knn_set[i][j] < min_distances[k] && knn_set[i][j] >= min_distances[k+1]) ||
              		(knn_set[i][j] < min_distances[k] && min_distances[k] == 50) ||
              		(knn_set[i][j] < min_distances[k] && k == (K_CONST-1)) ) {
               			min_distances[k] = knn_set[i][j];
				voters[k] = i;	
			}
		}
	  }
  }
 
  bit4_t votes[10];	// stores number of votes for each digit
  bit4_t result = 0;	// stores final result (number with the most votes)
  bit6_t min_voter = 0;	// tie breaker: digit with the min distance
  bit6_t min_dist = 50;	// distance of the tie breaker

  // initialize all digit's votes to 0
  for (int i = 0; i < 10; i++) {
  	votes[i] = 0;
  }

  // put valid votes in 
  for (int i = 0; i < K_CONST; i++) {
  	votes[voters[i]]++;
	// find the tie breaker
	if (min_distances[i] < min_dist) {
		 min_dist = min_distances[i];
		 min_voter = voters[i];
  	}
  } 

  // find the digit with the most vote
  // if two digits have the same amount of vote, check if it is tie breaker
  for (bit4_t i = 1; i < 10; i++) {
	if (votes[i] > votes[result]){
		result = i;
	}   else if (votes[i] == votes[result] && i == min_voter){
		result = i;
	}
  }
  return result;
}
