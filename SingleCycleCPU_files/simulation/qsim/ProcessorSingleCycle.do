onerror {quit -f}
vlib work
vlog -work work ProcessorSingleCycle.vo
vlog -work work ProcessorSingleCycle.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CPU_vlg_vec_tst
vcd file -direction ProcessorSingleCycle.msim.vcd
vcd add -internal CPU_vlg_vec_tst/*
vcd add -internal CPU_vlg_vec_tst/i1/*
add wave /*
run -all
