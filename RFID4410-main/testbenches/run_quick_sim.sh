#!/bin/bash
# ============================================================
# Quick simulation script — full RFID cycle, single pass
# Runs in seconds instead of minutes
# ============================================================

RTL_DIR="../rtl"
SIM_DIR="."
TOP_TB="top_module_tb_quick.v"
OUT="quick_sim"

# Clean
echo "[INFO] Cleaning previous quick sim files..."
rm -f $OUT.vvp wave.vcd wave.fst

# Compile
echo "[INFO] Compiling RTL + quick testbench..."
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

# Run
echo "[INFO] Running quick simulation..."
vvp $OUT.vvp
if [ $? -ne 0 ]; then
    echo "[ERROR] Simulation failed!"
    exit 1
fi

# Convert VCD → FST and open
if [ -f "wave.vcd" ]; then
    echo "[INFO] Converting VCD to FST..."
    vcd2fst wave.vcd wave.fst
    if [ $? -eq 0 ]; then
        echo "[INFO] FST created: wave.fst"
        if [ "$1" == "--wave" ]; then
            echo "[INFO] Opening GTKWave..."
            (gtkwave wave.fst >/dev/null 2>&1 & disown)
        fi
    fi
else
    echo "[WARN] No VCD file generated!"
fi

echo "[INFO] Quick simulation complete."
