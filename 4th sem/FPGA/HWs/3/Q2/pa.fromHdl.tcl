
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Q2 -dir "C:/Users/Alireza/Desktop/Programming/Verilog-Digital-System-Design/HWs/Hw3_9816603/Q2/planAhead_run_4" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "m_counter.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Q2_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top m_counter $srcset
add_files [list {m_counter.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
