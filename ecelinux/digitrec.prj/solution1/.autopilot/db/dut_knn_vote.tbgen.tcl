set moduleName dut_knn_vote
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {dut_knn_vote}
set C_modelType { int 4 }
set C_modelArgList {
	{ knn_set_V int 6 regular {array 30 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "knn_set_V", "interface" : "memory", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 4} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ knn_set_V_address0 sc_out sc_lv 5 signal 0 } 
	{ knn_set_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ knn_set_V_q0 sc_in sc_lv 6 signal 0 } 
	{ ap_return sc_out sc_lv 4 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "knn_set_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "knn_set_V", "role": "address0" }} , 
 	{ "name": "knn_set_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "knn_set_V", "role": "ce0" }} , 
 	{ "name": "knn_set_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "knn_set_V", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"], "CDFG" : "dut_knn_vote", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "knn_set_V", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.votes_V_U", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.dut_mux_3to1_sel2_6_1_U5", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.dut_mux_3to1_sel2_4_1_U6", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.dut_mux_3to1_sel2_6_1_U7", "Parent" : "0", "Child" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "302", "Max" : "302"}
	, {"Name" : "Interval", "Min" : "302", "Max" : "302"}
]}

set Spec2ImplPortList { 
	knn_set_V { ap_memory {  { knn_set_V_address0 mem_address 1 5 }  { knn_set_V_ce0 mem_ce 1 1 }  { knn_set_V_q0 mem_dout 0 6 } } }
}
