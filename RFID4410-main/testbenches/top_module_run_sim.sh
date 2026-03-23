#!/bin/bash
# ============================================================
# Simulation script for top_module project using Icarus + GTKWave
# To be placed inside the /sim folder
# ============================================================

# Paths (relative to sim/)
RTL_DIR="../rtl"
SIM_DIR="."
TOP_TB="top_module_tb.v"
OUT="top_module_sim"

# Step 1: Clean previous build files
echo "[INFO] Cleaning previous build files..."
rm -f $OUT.vvp wave.vcd wave.fst

# Step 2: Compile design and testbench
echo "[INFO] Compiling RTL and Testbench..."
iverilog -o $OUT.vvp \
    $RTL_DIR/digital_block_05.v \
    $RTL_DIR/digital_block_06.v \
    $RTL_DIR/decoder.v \
    $RTL_DIR/anti_collision.v \
    $RTL_DIR/digital_block_02.v \
    $RTL_DIR/crc.v \
    $RTL_DIR/encoder.v \
    $RTL_DIR/digital_block_07.v \
    $RTL_DIR/digital_block_09.v \
    $RTL_DIR/freq_div.v \
    $RTL_DIR/fsm.v \
    $RTL_DIR/digital_block_12.v \
    $RTL_DIR/rom.v \
    $RTL_DIR/timer.v \
    $RTL_DIR/test_block.v \
    $RTL_DIR/sram_256x32_rw.v \
    $RTL_DIR/RM_IHPSG13_1P_256x32_c2_bm_bist.v \
    $RTL_DIR/SRAM_1P_behavioral_bm_bist.v \
    $RTL_DIR/top_module.v \
    $SIM_DIR/$TOP_TB

if [ $? -ne 0 ]; then
    echo "[ERROR] Compilation failed!"
    exit 1
fi

# Step 3: Run simulation
echo "[INFO] Running simulation..."
vvp $OUT.vvp
if [ $? -ne 0 ]; then
    echo "[ERROR] Simulation failed!"
    exit 1
fi

# Step 4: Convert VCD → FST (smaller and faster)
if [ -f "wave.vcd" ]; then
    echo "[INFO] Converting VCD to FST format..."
    vcd2fst wave.vcd wave.fst
    if [ $? -eq 0 ]; then
        echo "[INFO] Conversion successful. FST file created: wave.fst"
        echo "[INFO] Opening GTKWave..."
        (gtkwave REQA_sim.gtkw >/dev/null 2>&1 & disown)
    else
        echo "[WARN] Conversion failed! Opening original VCD instead..."
        (gtkwave wave.vcd >/dev/null 2>&1 & disown)
    fi
else
    echo "[WARN] No VCD file found! Make sure your testbench includes:"
    echo '       $dumpfile("wave.vcd");'
    echo '       $dumpvars(0, top_module_tb);'
fi

echo "[INFO] Simulation complete."

