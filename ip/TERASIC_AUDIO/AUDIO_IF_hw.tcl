# TCL File Generated by Component Editor 12.0sp2
# Fri Nov 23 16:49:45 CST 2012
# DO NOT MODIFY


# 
# AUDIO_IF "AUDIO_IF" v1.0
# null 2012.11.23.16:49:45
# 
# 

# 
# request TCL package from ACDS 12.0
# 
package require -exact qsys 12.0


# 
# module AUDIO_IF
# 
set_module_property DESCRIPTION ""
set_module_property NAME AUDIO_IF
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Terasic Technologies Inc./DE2_115"
set_module_property DISPLAY_NAME AUDIO_IF
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL AUDIO_IF
set_fileset_property quartus_synth ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file AUDIO_IF.v VERILOG PATH AUDIO_IF.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_slave
# 
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressAlignment NATIVE
set_interface_property avalon_slave addressUnits WORDS
set_interface_property avalon_slave associatedClock clock_sink
set_interface_property avalon_slave associatedReset clock_sink_reset
set_interface_property avalon_slave bitsPerSymbol 8
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave burstcountUnits WORDS
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave readLatency 0
set_interface_property avalon_slave readWaitStates 0
set_interface_property avalon_slave readWaitTime 0
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitTime 0
set_interface_property avalon_slave ENABLED true

add_interface_port avalon_slave avs_s1_address address Input 3
add_interface_port avalon_slave avs_s1_read read Input 1
add_interface_port avalon_slave avs_s1_readdata readdata Output 16
add_interface_port avalon_slave avs_s1_write write Input 1
add_interface_port avalon_slave avs_s1_writedata writedata Input 16
set_interface_assignment avalon_slave embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true

add_interface_port clock_sink avs_s1_clk clk Input 1


# 
# connection point clock_sink_reset
# 
add_interface clock_sink_reset reset end
set_interface_property clock_sink_reset associatedClock clock_sink
set_interface_property clock_sink_reset synchronousEdges DEASSERT
set_interface_property clock_sink_reset ENABLED true

add_interface_port clock_sink_reset avs_s1_reset reset Input 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock ""
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true

add_interface_port conduit_end avs_s1_export_XCK export Output 1
add_interface_port conduit_end avs_s1_export_ADCDAT export Input 1
add_interface_port conduit_end avs_s1_export_ADCLRC export Input 1
add_interface_port conduit_end avs_s1_export_DACDAT export Output 1
add_interface_port conduit_end avs_s1_export_DACLRC export Input 1
add_interface_port conduit_end avs_s1_export_BCLK export Input 1

