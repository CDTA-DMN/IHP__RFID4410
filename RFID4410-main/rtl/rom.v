`timescale 1ns / 1ps

module digital_block_13 (
    input  wire             clk,
    input  wire             en,
    input  wire             rst_n,
    input  wire             ce,
    input  wire  [0:0]      blk_addr,    
    output wire [31:0]      dout,
    output wire             dout_valid
);

    digital_block_12 #(
        .DATA_WIDTH(32),
        .NUM_PAGES (2)
    ) u_digital_block_12 (
        .clk        (clk),
        .en         (en),
        .rst_n      (rst_n),
        .ce         (ce),
        .addr       (blk_addr),
        .dout       (dout),
        .dout_valid (dout_valid)
    );

endmodule

