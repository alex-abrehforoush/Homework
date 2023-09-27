onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestSixteenBitAddSub/a
add wave -noupdate /TestSixteenBitAddSub/b
add wave -noupdate /TestSixteenBitAddSub/add_sub
add wave -noupdate /TestSixteenBitAddSub/result
add wave -noupdate /TestSixteenBitAddSub/carry_sign
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 64
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
WaveRestoreZoom {0 ns} {228 ns}
