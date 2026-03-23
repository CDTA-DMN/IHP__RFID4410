
`timescale 1ns / 1ps

module digital_block_04 (clk, en, rst_n, rx_in, out_4bits_A, out_4bits_B, out_4bits_C, out_4bits_D, out_8bits_A, out_16bits_A, out_16bits_B, out_16bits_C, d_rdy, p_ok, l_b);  
     
    input  wire        clk;  
    input  wire        en;
    input  wire        rst_n;    
    input  wire        rx_in;         
    output wire [3:0]  out_4bits_A; 
    output wire [3:0]  out_4bits_B; 
    output wire [3:0]  out_4bits_C; 
    output wire [3:0]  out_4bits_D;  
    output wire [7:0]  out_8bits_A; 
    output wire [15:0] out_16bits_A;
    output wire [15:0] out_16bits_B;
    output wire [15:0] out_16bits_C;
    output wire        d_rdy; 
    output wire        p_ok; 
    output wire        l_b;  

   

  wire s_com_sig; 
  wire d_out_sig;  
  wire d_v_sig; 
  wire e_com_sig;  
  
  
  digital_block_05 u_digital_block_05 (
    .clk   (clk),
    .en    (en),     
    .rst_n (rst_n),
    .rx_in (rx_in),
    .d_out (d_out_sig),
    .d_v   (d_v_sig),
    .s_com (s_com_sig),
    .e_com (e_com_sig)
    );

  
  digital_block_06 u_digital_block_06 (
    .clk(clk),
    .en(en),
    .rst_n(rst_n),
    .s_com(s_com_sig),
    .d_v(d_v_sig),
    .d_out(d_out_sig),
    .e_com(e_com_sig),
    .out_4bits_A(out_4bits_A),
    .out_4bits_B(out_4bits_B),
    .out_4bits_C(out_4bits_C),
    .out_4bits_D(out_4bits_D),
    .out_8bits_A(out_8bits_A),
    .out_16bits_A(out_16bits_A),
    .out_16bits_B(out_16bits_B),
    .out_16bits_C(out_16bits_C),
    .d_rdy(d_rdy),
    .p_ok(p_ok),
    .l_b(l_b)
   );
  


endmodule

