set projDir "/home/tianlerk/mojo/YeetingCheckers/work/planAhead"
set projName "YeetingCheckers"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/tianlerk/mojo/YeetingCheckers/work/verilog/mojo_top_0.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/reset_conditioner_1.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/led_multiplexer_2.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/button_multiplex_3.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/fake_button_conditioner_4.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/button_sensing2_5.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/button_checker_6.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/matrix_former_7.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/shifter_8.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/multiplier_9.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/multi_dec_ctr_10.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/multi_seven_seg_11.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/score_adder_12.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/init_get_hole_13.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/level_selector_14.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/alu_15.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/edge_detector_16.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/edge_detector_16.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/edge_detector_16.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/button_conditioner_19.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/button_conditioner_19.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/edge_detector_16.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/edge_detector_16.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/decimal_counter_23.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/counter_24.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/seven_seg_25.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/decoder_26.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/edge_detector_27.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/alu_shifter_28.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/boolean_29.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/comparator_30.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/adder_31.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/mul_32.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/div_33.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/pipeline_34.v" "/home/tianlerk/mojo/YeetingCheckers/work/verilog/pipeline_34.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/tianlerk/mojo/YeetingCheckers/constraint/buttons.ucf" "/home/tianlerk/mojo/YeetingCheckers/constraint/led.ucf" "/opt/mojo-ide-B1.3.6/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
