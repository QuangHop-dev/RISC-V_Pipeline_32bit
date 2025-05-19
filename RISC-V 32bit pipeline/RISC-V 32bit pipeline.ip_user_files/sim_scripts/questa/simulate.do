onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib RISCV_Top_tb_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {RISCV_Top_tb.udo}

run 1000ns

quit -force
