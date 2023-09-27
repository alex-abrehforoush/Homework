onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestGame/N
add wave -noupdate -expand /TestGame/First_Num
add wave -noupdate -expand /TestGame/Second_Num
add wave -noupdate -expand /TestGame/Target_Num
add wave -noupdate /TestGame/Clock
add wave -noupdate /TestGame/Reset
add wave -noupdate -expand /TestGame/Result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 199
configure wave -valuecolwidth 88
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {214 ns}
