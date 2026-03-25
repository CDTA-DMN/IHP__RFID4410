
`timescale 1ns / 1ps

module digital_block_08 (clk, en, rst_n, frame_in, frame_len, frame_in_v, crc_cal, crc_frame, crc_done, start_tran, state_fsm, sram_dout, sram_dout_len, sram_dout_valid, test_mode, forcing, tx_out, enc_done);  
     
    input  wire        clk;  
    input  wire        en;
    input  wire        rst_n;    
    input  wire [39:0] frame_in;
    input  wire [6:0]  frame_len;
    input  wire        frame_in_v;
    input  wire        crc_cal;
    input  wire [15:0] crc_frame;
    input  wire        crc_done;
    input  wire        start_tran;   
    input  wire [3:0]  state_fsm;
    input  wire [31:0] sram_dout;
    input  wire [5:0]  sram_dout_len;
    input wire         sram_dout_valid;
    input wire         test_mode;
    input  wire [3:0]  forcing;
    output wire         tx_out;
    output wire         enc_done;

   

  wire [47:0] frame_out_sig; 
  wire [5:0]  frame_out_len_sig;  
  wire frame_out_v_sig; 
  
  
  digital_block_07 u_digital_block_07 (
    .clk(clk),
    .en(en),
    .rst_n(rst_n),
    .frame_in(frame_out_sig),
    .frame_in_v(frame_out_v_sig),
    .start_tran(start_tran),
    .frame_length(frame_out_len_sig),
    .sram_dout(sram_dout),
    .sram_dout_len(sram_dout_len),
    .sram_dout_valid(sram_dout_valid),
    .test_mode(test_mode),
    .forcing(forcing),
    .state_fsm(state_fsm),
    .tx_out(tx_out),
    .enc_done(enc_done)
  );
  
  
  digital_block_09 u_digital_block_09 (
    .clk(clk),
    .en(en),
    .rst_n(rst_n),
    .frame_in(frame_in),
    .frame_len(frame_len),
    .crc_frame(crc_frame),
    .frame_in_v(frame_in_v),
    .crc_cal(crc_cal),
    .crc_done(crc_done),
    .frame_out(frame_out_sig),
    .frame_out_len(frame_out_len_sig),
    .frame_out_v(frame_out_v_sig)
  );
  


endmodule

