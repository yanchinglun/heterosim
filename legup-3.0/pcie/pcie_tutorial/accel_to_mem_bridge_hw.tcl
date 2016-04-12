# TCL File Generated by Component Editor 12.0
# Sun Jan 20 14:58:14 EST 2013
# DO NOT MODIFY


# 
# accel_to_mem_bridge "accel_to_mem_bridge" v1.0
# null 2013.01.20.14:58:14
# 
# 

# 
# request TCL package from ACDS 12.0
# 
package require -exact qsys 12.0


# 
# module accel_to_mem_bridge
# 
set_module_property NAME accel_to_mem_bridge
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME accel_to_mem_bridge
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL accel_to_mem_bridge
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file accel_to_mem_bridge.v VERILOG PATH accel_to_mem_bridge.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point accel
# 
add_interface accel avalon end
set_interface_property accel addressAlignment DYNAMIC
set_interface_property accel addressUnits WORDS
set_interface_property accel associatedClock clock
set_interface_property accel associatedReset reset
set_interface_property accel burstOnBurstBoundariesOnly false
set_interface_property accel explicitAddressSpan 0
set_interface_property accel holdTime 0
set_interface_property accel isMemoryDevice false
set_interface_property accel isNonVolatileStorage false
set_interface_property accel linewrapBursts false
set_interface_property accel maximumPendingReadTransactions 0
set_interface_property accel printableDevice false
set_interface_property accel readLatency 1
set_interface_property accel readWaitStates 0
set_interface_property accel readWaitTime 0
set_interface_property accel setupTime 0
set_interface_property accel timingUnits Cycles
set_interface_property accel writeWaitTime 0
set_interface_property accel ENABLED true

add_interface_port accel writedata_from_accel writedata Input 128
add_interface_port accel address_from_accel address Input 1
add_interface_port accel write_from_accel write Input 1
add_interface_port accel read_from_accel read Input 1
add_interface_port accel readdata_to_accel readdata Output 128
add_interface_port accel waitrequest_to_accel waitrequest Output 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset reset Input 1


# 
# connection point memory
# 
add_interface memory avalon start
set_interface_property memory addressUnits SYMBOLS
set_interface_property memory associatedClock clock
set_interface_property memory associatedReset reset
set_interface_property memory burstOnBurstBoundariesOnly false
set_interface_property memory doStreamReads false
set_interface_property memory doStreamWrites false
set_interface_property memory linewrapBursts false
set_interface_property memory readLatency 0
set_interface_property memory readWaitTime 0
set_interface_property memory ENABLED true

add_interface_port memory address_to_mem address Output 31
add_interface_port memory readdata_from_mem readdata Input 64
add_interface_port memory write_to_mem write Output 1
add_interface_port memory writedata_to_mem writedata Output 64
add_interface_port memory byteenable_to_mem byteenable Output 8
add_interface_port memory read_to_mem read Output 1
add_interface_port memory waitrequest_from_mem waitrequest Input 1

