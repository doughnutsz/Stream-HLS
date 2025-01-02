
# Project name
set hls_prj 2mm.prj

# Open/reset the project
open_project ${hls_prj}

open_solution  solution1 -flow_target vivado

# Top function of the design is "top"
set_top test_2mm

# Add design and testbench files
add_files 2mm.cpp
add_files -tb 2mm_tb.cpp

open_solution "solution1"
# Use Zynq device
set_part {xcu280-fsvh2892-2L-e}

config_compile -unsafe_math_optimizations

# Target clock period is 3.33ns
create_clock -period 3.33

############################################
csynth_design
exit
