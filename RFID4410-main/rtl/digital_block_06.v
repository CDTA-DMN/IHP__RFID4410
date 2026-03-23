
`timescale 1ns / 1ps

module digital_block_06 (clk, en, rst_n, s_com, d_v, d_out, e_com, out_4bits_A, out_4bits_B, out_4bits_C, out_4bits_D, out_8bits_A, out_16bits_A, out_16bits_B, out_16bits_C, d_rdy, p_ok, l_b);     

    input  wire        clk;    
    input  wire        en;   
    input  wire        rst_n;        
    input  wire        s_com;
    input  wire        d_v;
    input  wire        d_out;  
    input  wire        e_com; 
    output wire [3:0]  out_4bits_A; 
    output wire [3:0]  out_4bits_B; 
    output wire [3:0]  out_4bits_C; 
    output wire [3:0]  out_4bits_D;  
    output wire [7:0]  out_8bits_A; 
    output wire [15:0] out_16bits_A;
    output wire [15:0] out_16bits_B;
    output wire [15:0] out_16bits_C;
    output reg         d_rdy; 
    output reg         p_ok; 
    output reg         l_b;       

    reg [71:0] frame_reg; 
    reg [3:0] bit_in_byte; 
    reg [6:0] data_bit_count;          
    reg computed_parity;
    reg all_p_ok;
    reg en_outputs;     
    reg [1:0] state, next_state; 
    

    parameter IDLE         = 2'b00;
    parameter R_BYTE = 2'b01;
    parameter P_BIT   = 2'b10;
    

    always @(posedge clk) begin
        if (en)
            if (!rst_n)
                state <= IDLE;
            else
                state <= next_state;
        end

    always @(*) begin
        case (state)
            IDLE: begin
               if (s_com) 
                  next_state = R_BYTE;
               else           
                  next_state = IDLE;
            end
            R_BYTE: begin
               if (e_com)  
                  next_state = IDLE;
               else if (d_v && bit_in_byte == 4'b1000)
                   next_state = P_BIT;
               else
                   next_state = R_BYTE;
            end
            P_BIT: begin
               if (e_com) 
                  next_state = IDLE;
               else          
                  next_state = R_BYTE;
            end
            default: begin
               next_state = IDLE;
            end
        endcase
    end

   always @(posedge clk)
      if (en)
          if (!rst_n) begin
              frame_reg       <= 72'b0;
              bit_in_byte     <= 4'b0000;
              data_bit_count  <= 7'b0000000; 
              computed_parity <= 1'b0;
              all_p_ok   <= 1'b1;
          end else begin
              if ((state == IDLE) && (s_com)) begin  
                  frame_reg    <= 0;
                  bit_in_byte     <= 4'b0000;
                  data_bit_count  <= 7'b0000000;
                  computed_parity <= 1'b0;
                  all_p_ok   <= 1'b1;
              end else if ((state == R_BYTE) && (d_v)) begin 
                  if (bit_in_byte != 4'b1000) begin
                      frame_reg[data_bit_count] <= d_out;
                      data_bit_count  <= data_bit_count + 1;
                      computed_parity <= computed_parity ^ d_out;
                      all_p_ok   <= all_p_ok;
                  end else begin
                      frame_reg    <= frame_reg; 
                      data_bit_count  <= data_bit_count;
                      computed_parity <= computed_parity;
                      if (computed_parity != d_out)
                          all_p_ok <= all_p_ok;
                      else
                          all_p_ok <= 1'b0;   
                  end  
                  bit_in_byte <= bit_in_byte + 1;       
              end else if ((state == P_BIT) && (bit_in_byte == 4'b1001)) begin
                  frame_reg    <= frame_reg;
                  bit_in_byte     <= 4'b0000;
                  data_bit_count  <= data_bit_count;
                  computed_parity <= 1'b0;
                  all_p_ok   <= all_p_ok;
              end else begin
                  frame_reg    <= frame_reg;
                  bit_in_byte     <= bit_in_byte;
                  data_bit_count  <= data_bit_count;
                  computed_parity <= computed_parity;
                  all_p_ok   <= all_p_ok;
              end
          end

   always @(posedge clk)
      if (en)
          if (!rst_n) begin
	      en_outputs <= 1'b0; 
          end else begin
	      if ((state == IDLE) && (s_com))   
	          en_outputs <= 1'b0;
	      else if (e_com)  
	          en_outputs <= 1'b1;
	      else 
	          en_outputs <= en_outputs;         
          end

   always @(posedge clk)
      if (en)
          if (!rst_n) begin
             d_rdy <= 1'b0; 
             p_ok  <= 1'b0;
             l_b   <= 1'b0;
         end else begin
             if (e_com) begin 
                 d_rdy <= 1'b1;
                 p_ok  <= all_p_ok;
                 l_b   <= frame_reg[data_bit_count - 2];
             end else begin
                 d_rdy <= 1'b0;  
                 p_ok  <= 1'b0;  
                 l_b   <= 1'b0; 
             end    
         end

assign out_4bits_A  = en_outputs ? frame_reg[3:0]   : 4'b0;
assign out_4bits_B  = en_outputs ? frame_reg[11:8]  : 4'b0;
assign out_4bits_C  = en_outputs ? frame_reg[7:4]   : 4'b0;
assign out_4bits_D  = en_outputs ? frame_reg[15:12] : 4'b0;
assign out_8bits_A  = en_outputs ? frame_reg[55:48] : 8'b0;
assign out_16bits_A = en_outputs ? frame_reg[31:16] : 16'b0;
assign out_16bits_B = en_outputs ? frame_reg[47:32] : 16'b0;
assign out_16bits_C = en_outputs ? frame_reg[71:56] : 16'b0;

endmodule 

