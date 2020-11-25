onerror {quit -f}
vlib work
vlog -work work TrafficLightController.vo
vlog -work work TrafficLightController.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.TrafficLightController_vlg_vec_tst
vcd file -direction TrafficLightController.msim.vcd
vcd add -internal TrafficLightController_vlg_vec_tst/*
vcd add -internal TrafficLightController_vlg_vec_tst/i1/*
add wave /*
run -all
