`timescale 1ns / 1ps

//=============================================================
// Quick Testbench: top_module_tb_quick
// Tests a full RFID cycle with ONE command per state
// IDLE → READY1 → READY2 → ACTIVE → HALT
//=============================================================
module top_module_tb_quick;

    //---------------------------------------------------------
    // DUT signals
    //---------------------------------------------------------
    reg clk = 0;
    reg rst_n = 0;
    reg rx_in = 1;
    reg [3:0] force_state = 4'b0;
    reg test_mode = 0;
    wire tx_out;
    wire clk_out;
    wire [3:0] state_dbg;

    reg [255:0] decoded;

    //---------------------------------------------------------
    // Instantiate UUT
    //---------------------------------------------------------
    top_module uut (
        .clk(clk),
        .rst_n(rst_n),
        .rx_in(rx_in),
        .force_state(force_state),
        .test_mode(test_mode),
        .tx_out(tx_out),
        .clk_out(clk_out),
        .state_dbg(state_dbg)
    );

    //---------------------------------------------------------
    // Clock generation
    //---------------------------------------------------------
    localparam real CLK_PERIOD = 73.7; // ns => 13.56 MHz
    always #(CLK_PERIOD/2) clk = ~clk;

    //---------------------------------------------------------
    // Timing parameters (212 kbps, bitrate_sel="01")
    //---------------------------------------------------------
    integer tb_clks = 128;
    integer tx_clks = 64;
    integer t1_clks = 32;

    `include "tb_tasks.v"  // Reuse shared tasks

/*
///////////////////////////////////////////////////////////////////////////////
                         Quick Cycle Stimulus
///////////////////////////////////////////////////////////////////////////////
*/

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_module_tb_quick);

        // =============================================
        // Reset
        // =============================================
        #(2000 * CLK_PERIOD);
        rst_n = 1;
        #(1236 * CLK_PERIOD);

/*
///////////////////////////////////////////////////////////////////////////////
                              IDLE STATE
///////////////////////////////////////////////////////////////////////////////
*/
        $display("======== [QUICK] IDLE: Send REQA (0x26 = 7'h10) ========");
        send_short_frame(7'h10);

        #(20000 * CLK_PERIOD);

/*
///////////////////////////////////////////////////////////////////////////////
                             READY1 STATE
///////////////////////////////////////////////////////////////////////////////
*/
        $display("======== [QUICK] READY1: Force to READY1 ========");
        force_state = 4'b0001;
        #(1236 * CLK_PERIOD);
        force_state = 4'b0;
        #(1236 * CLK_PERIOD);

        $display("======== [QUICK] READY1: ANTICOLLISION CL1 (full UID) ========");
        // Send ANTICOLLISION CL1 with NVB=0x20 (request all), partial UID
        send_standard_frame_manual_parity(16, 16'h0020, 2'b11);

        #(20000 * CLK_PERIOD);

        $display("======== [QUICK] READY1: SELECT CL1 ========");
        send_standard_frame_manual_parity(72, 72'h82AD88332211889320, 9'b101111110);

        #(20000 * CLK_PERIOD);

/*
///////////////////////////////////////////////////////////////////////////////
                             READY2 STATE
///////////////////////////////////////////////////////////////////////////////
*/
        $display("======== [QUICK] READY2: Force to READY2 ========");
        force_state = 4'b0010;
        #(1236 * CLK_PERIOD);
        force_state = 4'b0;
        #(1236 * CLK_PERIOD);

        $display("======== [QUICK] READY2: ANTICOLLISION CL2 ========");
        send_standard_frame_manual_parity(16, 16'h0070, 2'b00);

        #(20000 * CLK_PERIOD);

        $display("======== [QUICK] READY2: SELECT CL2 ========");
        send_standard_frame_auto_crc_parity(56, 56'h00776655449370);

        #(20000 * CLK_PERIOD);

/*
///////////////////////////////////////////////////////////////////////////////
                             ACTIVE STATE
///////////////////////////////////////////////////////////////////////////////
*/
        $display("======== [QUICK] ACTIVE: Force to ACTIVE ========");
        force_state = 4'b0011;
        #(1236 * CLK_PERIOD);
        force_state = 4'b0;
        #(1236 * CLK_PERIOD);

        $display("======== [QUICK] ACTIVE: WRITE addr=0x00 ========");
        send_custom_frame_auto_crc_parity(
            8'h66,        // WRITE command
            0,            // address = 0x00
            0,            // address = 0x00 (single address, not sweep)
            32,           // 32 data bits
            32'hDEADBEEF  // data value
        );

        #(20000 * CLK_PERIOD);

        $display("======== [QUICK] ACTIVE: READ addr=0x00 ========");
        send_standard_frame_auto_crc_parity(16, 16'h0077);

        #(20000 * CLK_PERIOD);

        $display("======== [QUICK] ACTIVE: HALT ========");
        send_standard_frame_manual_parity(32, 32'h3FA60044, 4'b1111);

        #(20000 * CLK_PERIOD);

/*
///////////////////////////////////////////////////////////////////////////////
                             HALT STATE
///////////////////////////////////////////////////////////////////////////////
*/
        $display("======== [QUICK] HALT: Force to HALT ========");
        force_state = 4'b0100;
        #(1236 * CLK_PERIOD);
        force_state = 4'b0;
        #(1236 * CLK_PERIOD);

        $display("======== [QUICK] HALT: Send REQA (should be ignored) ========");
        send_short_frame(7'h10);

        #(20000 * CLK_PERIOD);

        // =============================================
        // Done
        // =============================================
        $display("======== [QUICK] Simulation completed ========");
        #(2000 * CLK_PERIOD);
        $finish;
    end
endmodule
