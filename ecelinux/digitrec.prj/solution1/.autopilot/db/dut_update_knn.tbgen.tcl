set moduleName dut_update_knn
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {dut_update_knn}
set C_modelType { void 0 }
set C_modelArgList {
	{ test_inst_V int 49 regular  }
	{ train_inst_V int 48 regular  }
	{ min_distances_V int 6 regular {array 30 { 2 3 } 1 1 }  }
	{ tmp_34 int 4 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "test_inst_V", "interface" : "wire", "bitwidth" : 49, "direction" : "READONLY"} , 
 	{ "Name" : "train_inst_V", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "min_distances_V", "interface" : "memory", "bitwidth" : 6, "direction" : "READWRITE"} , 
 	{ "Name" : "tmp_34", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ test_inst_V sc_in sc_lv 49 signal 0 } 
	{ train_inst_V sc_in sc_lv 48 signal 1 } 
	{ min_distances_V_address0 sc_out sc_lv 5 signal 2 } 
	{ min_distances_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ min_distances_V_we0 sc_out sc_logic 1 signal 2 } 
	{ min_distances_V_d0 sc_out sc_lv 6 signal 2 } 
	{ min_distances_V_q0 sc_in sc_lv 6 signal 2 } 
	{ tmp_34 sc_in sc_lv 4 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "test_inst_V", "direction": "in", "datatype": "sc_lv", "bitwidth":49, "type": "signal", "bundle":{"name": "test_inst_V", "role": "default" }} , 
 	{ "name": "train_inst_V", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "train_inst_V", "role": "default" }} , 
 	{ "name": "min_distances_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "min_distances_V", "role": "address0" }} , 
 	{ "name": "min_distances_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_distances_V", "role": "ce0" }} , 
 	{ "name": "min_distances_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_distances_V", "role": "we0" }} , 
 	{ "name": "min_distances_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "min_distances_V", "role": "d0" }} , 
 	{ "name": "min_distances_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "min_distances_V", "role": "q0" }} , 
 	{ "name": "tmp_34", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tmp_34", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : [], "CDFG" : "dut_update_knn", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "test_inst_V", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "train_inst_V", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "min_distances_V", "Type" : "Memory", "Direction" : "IO", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "tmp_34", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "54", "Max" : "63"}
	, {"Name" : "Interval", "Min" : "54", "Max" : "63"}
]}

set Spec2ImplPortList { 
	test_inst_V { ap_none {  { test_inst_V in_data 0 49 } } }
	train_inst_V { ap_none {  { train_inst_V in_data 0 48 } } }
	min_distances_V { ap_memory {  { min_distances_V_address0 mem_address 1 5 }  { min_distances_V_ce0 mem_ce 1 1 }  { min_distances_V_we0 mem_we 1 1 }  { min_distances_V_d0 mem_din 1 6 }  { min_distances_V_q0 mem_dout 0 6 } } }
	tmp_34 { ap_none {  { tmp_34 in_data 0 4 } } }
}
