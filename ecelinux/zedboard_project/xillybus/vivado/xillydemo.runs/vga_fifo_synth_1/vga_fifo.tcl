# 
# Synthesis run script generated by Vivado
# 

set_msg_config  -ruleid {1}  -id {BD 41-968}  -string {{xillybus_S_AXI}}  -new_severity {INFO} 
set_msg_config  -ruleid {2}  -id {BD 41-967}  -string {{xillybus_ip_0/xillybus_M_AXI}}  -new_severity {INFO} 
set_msg_config  -ruleid {3}  -id {BD 41-967}  -string {{xillybus_ip_0/xillybus_S_AXI}}  -new_severity {INFO} 
set_msg_config  -ruleid {4}  -id {BD 41-678}  -string {{xillybus_S_AXI/Reg}}  -new_severity {INFO} 
set_msg_config  -ruleid {5}  -id {BD 41-1356}  -string {{xillybus_S_AXI/Reg}}  -new_severity {INFO} 
set_msg_config  -ruleid {7}  -id {BD 41-759}  -string {{xlconcat_0/In}}  -new_severity {INFO} 
set_msg_config  -ruleid {8}  -id {Netlist 29-160}  -string {{vivado_system_processing_system7}}  -new_severity {INFO} 
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.cache/wt [current_project]
set_property parent.project_path /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vivado-ip [current_project]
read_ip -quiet /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo.xci
set_property is_locked true [get_files /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top vga_fifo -part xc7z020clg484-1 -mode out_of_context

rename_ref -prefix_all vga_fifo_

write_checkpoint -force -noxdef vga_fifo.dcp

catch { report_utilization -file vga_fifo_utilization_synth.rpt -pb vga_fifo_utilization_synth.pb }

if { [catch {
  file copy -force /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.runs/vga_fifo_synth_1/vga_fifo.dcp /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.ip_user_files/ip/vga_fifo]} {
  catch { 
    file copy -force /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_stub.v /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.ip_user_files/ip/vga_fifo
  }
}

if {[file isdir /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.ip_user_files/ip/vga_fifo]} {
  catch { 
    file copy -force /home/yf92/ece5775/lab3/ecelinux/zedboard_project/vivado-essentials/vga_fifo/vga_fifo_stub.vhdl /home/yf92/ece5775/lab3/ecelinux/zedboard_project/xillybus/vivado/xillydemo.ip_user_files/ip/vga_fifo
  }
}
