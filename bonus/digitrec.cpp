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

int digitrec( digit input ) 
{
  #include "training_data.h"

  // This array stores K minimum distances per training set
  int knn_set[10][K_CONST];

  // Initialize the knn set
  for ( int i = 0; i < 10; ++i )
    for ( int k = 0; k < K_CONST; ++k )
      // Note that the max distance is 49
      knn_set[i][k] = 50; 

  L1800: for ( int i = 0; i < TRAINING_SIZE; ++i ) {
    L10: for ( int j = 0; j < 10; j++ ) {
      // Read a new instance from the training set
      digit training_instance = training_data[j][i];
      
      //----------------------------------------------------------
      // update_knn( input, training_instance, knn_set[j] );
      //----------------------------------------------------------
      
      digit difference = input ^ training_instance;

	  int dist = 0;
 
      // Count the number of set bits
      for ( int i = 0; i < 49; ++i ) { 
		dist += difference[i];
      }
  
	  // update the min distance array if this test_inst has less distance than 
      // any of the current distances stored. Keep the array sorted.  
	  for (int i = 0; i < K_CONST; i++) {
		  if (dist <  knn_set[j][i] && 
		  (dist >=  knn_set[j][i+1] ||  knn_set[j][i] == 50 || i == (K_CONST-1) ) ) {
			   knn_set[j][i] = dist;
			  break;
		  }
	  }
      
      //----------------------------------------------------------
  
      
    }
  } 


  //----------------------------------------------------------
  // Compute the final output
  // return knn_vote( knn_set ); 
  //----------------------------------------------------------
  
  
  // stores both distance and the digit represented
  int min_distances[K_CONST];
  int voters[K_CONST];
  
  for ( int k = 0; k < K_CONST; k++ ) {
         min_distances[k] = 50;  
  }
 
  // find K_CONST number of minimum distances
  for (int i = 0; i < 10; i++) {
	  for (int j = 0; j < K_CONST; j++) {
		  for (int k = 0; k <K_CONST; k++) {
				if (knn_set[i][j] < min_distances[k] && 
				   (knn_set[i][j] >= min_distances[k+1] || min_distances[k] == 50 || k == (K_CONST-1) ) ) {
               			min_distances[k] = knn_set[i][j];
						voters[k] = i;	
					}
		}
	  }
  }
 
  int votes[10] = {0};	// stores number of votes for each digit, last one stores result

  // put valid votes in 
  for (int i = 0; i < K_CONST; i++) {
  	votes[voters[i]]++;
  } 

  int result = 0;	// stores final result (number with the most votes)
  
  // find the digit with the most vote
  for (int i = 1; i < 10; i++) {
	result = votes[i] > votes[result]? i: result;
  }
  return result;
  
}




