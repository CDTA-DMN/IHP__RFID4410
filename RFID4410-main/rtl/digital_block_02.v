`timescale 1ns / 1ps


module digital_block_02 #(
    parameter         [15:0] POLY       = 16'h1021,  // CRC polynomial
    parameter integer        CRC_SIZE   = 16,        // CRC width
    parameter integer        DATA_WIDTH = 8,         // Input data width
    parameter         [15:0] INIT       = 16'h6363   // Initial CRC value
) (
    input  wire                  clk,
    input  wire                  en,
    input  wire                  rst_n,
    input  wire                  valid_i,
    input  wire [DATA_WIDTH-1:0] data_i,
    input  wire                  crc_init,
    output reg  [  CRC_SIZE-1:0] crc_o
);

  // Internal registers
  reg [CRC_SIZE-1:0] crc;
  reg [CRC_SIZE-1:0] crc_next;

  // Loop variables
  integer i, j;
  reg [CRC_SIZE-1:0] v_crc_next;
  reg [CRC_SIZE-1:0] v_crc_prev;

  //----------------------------------------------
  // Sequential logic (reset + update)
  //----------------------------------------------
  always @(posedge clk) begin
    if (en)
        if (!rst_n) begin
            crc <= INIT[CRC_SIZE-1:0];
        end else begin
            if (crc_init) begin
                crc <= INIT[CRC_SIZE-1:0];
            end else if (valid_i) begin
                crc <= crc_next;
            end
        end
  end

  //----------------------------------------------
  // CRC combinational logic (bitwise processing)
  //----------------------------------------------
  always @(*) begin
    v_crc_prev = crc;  // Load current CRC state

    for (i = 0; i < DATA_WIDTH; i = i + 1) begin
      // Reflect input bit and update MSB
      v_crc_next[CRC_SIZE-1] = v_crc_prev[0] ^ data_i[i];

      // Shift and apply polynomial
      for (j = 1; j < CRC_SIZE; j = j + 1) begin
        if (POLY[j]) v_crc_next[CRC_SIZE-1-j] = v_crc_prev[CRC_SIZE-j] ^ v_crc_prev[0] ^ data_i[i];
        else v_crc_next[CRC_SIZE-1-j] = v_crc_prev[CRC_SIZE-j];
      end

      // Update CRC for next bit iteration
      v_crc_prev = v_crc_next;
    end

    // Final result of the chain becomes the next state
    crc_next = v_crc_next;
  end

  //----------------------------------------------
  // Output byte-swapped CRC
  //----------------------------------------------
  always @(*) begin
    // Note: This specific swapping is for 16-bit CRCs only
    crc_o = {crc[7:0], crc[15:8]};
  end

endmodule

