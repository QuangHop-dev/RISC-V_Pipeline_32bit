transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+RISCV_Top_tb  -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.RISCV_Top_tb xil_defaultlib.glbl

do {RISCV_Top_tb.udo}

run 1000ns

endsim

quit -force
