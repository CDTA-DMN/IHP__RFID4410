
`timescale 1ns / 1ps

module digital_block_07 (clk, en, rst_n, frame_in, frame_in_v, start_tran, frame_length, sram_dout, sram_dout_len, sram_dout_valid, test_mode, forcing, state_fsm, tx_out, enc_done);  
 
    input  wire        clk; 
    input  wire        en; 	
    input  wire        rst_n; 
    input  wire [47:0] frame_in;
    input  wire [5:0]  frame_length;
    input  wire        frame_in_v;
    input  wire        start_tran;   
    input  wire [3:0]  state_fsm;
    input  wire [31:0] sram_dout;
    input  wire [5:0]  sram_dout_len;
    input wire         sram_dout_valid;
    input wire         test_mode;
	input  wire [3:0]  forcing;
    output reg         tx_out;
    output reg         enc_done;
    
    reg [2:0] clk_count;
    reg [2:0] bit_in_byte_count;
    reg [5:0] bit_count;
    reg [2:0] remaining_bits;
    reg [5:0] frame_length_signal;
    reg bit_to_send;
    reg parity_bit;   
    reg [2:0] state, next_state; 

    parameter IDLE        = 3'd0;
    parameter READY       = 3'd1;
    parameter SEND_SOF    = 3'd2;
    parameter SEND_DATA   = 3'd3;
    parameter SEND_PARITY = 3'd4;
    parameter SEND_EOF    = 3'd5;  

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
				
					if ((frame_in_v) || (test_mode && sram_dout_valid))
						next_state = READY;
					else
						next_state = IDLE;
			end
            READY: begin	                                            
				    if (frame_length_signal != 6'd0) 
						if (start_tran && ((state_fsm != 4'b0111) || (test_mode &&  forcing != 4'b0)) || (test_mode && forcing == 4'b0))
							next_state = SEND_SOF;
						else 
							next_state = READY;
					else           
						next_state = IDLE;
            end
            SEND_SOF: begin
               if (clk_count == 3'b000)  
                  next_state = SEND_DATA;
               else
                  next_state = SEND_SOF;
            end
            SEND_DATA: begin
               if (clk_count == 3'b000 && bit_in_byte_count == 3'b000) 
                  next_state = SEND_PARITY;
               else          
                  next_state = SEND_DATA;
            end
            SEND_PARITY: begin
				if ((clk_count == 3'b000) && (bit_in_byte_count == 3'b111) && (bit_count != frame_length_signal)) 
					next_state = SEND_DATA;
				else if ((clk_count == 3'b000) && (bit_in_byte_count == 3'b111) && (bit_count == frame_length_signal))           
					next_state = SEND_EOF;
				else
					next_state = SEND_PARITY;
            end
            SEND_EOF: begin
               if (clk_count == 3'b000) 
                  next_state = IDLE;
               else          
                  next_state = SEND_EOF;
            end
            default: begin
               next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk) 
        if (en)	
			if (!rst_n) begin                                     
				clk_count <= 3'b111;
				bit_in_byte_count <= 3'b111;
				bit_count <= 6'b0;
				frame_length_signal <= 6'b0;
			end else begin 	
				case (state)
					IDLE: begin
						clk_count <= 3'b111;
						bit_in_byte_count <= 3'b111;
						bit_count <= 6'b0;
						if (frame_in_v)
							frame_length_signal <= frame_length;
						else if (test_mode && sram_dout_valid)
							frame_length_signal <= sram_dout_len;
						else
							frame_length_signal <= frame_length_signal;
					end
					READY: begin
						clk_count <= 3'b111;
						bit_in_byte_count <= 3'b111;
						bit_count <= 6'b0;	
                        if (frame_in_v)
							frame_length_signal <= frame_length;
					    else
							frame_length_signal <= frame_length_signal;
					end
					SEND_SOF: begin
						clk_count <= clk_count - 1'b1;
						if (remaining_bits != 0) 
							bit_in_byte_count <= remaining_bits - 1'b1;
						else
							bit_in_byte_count <= bit_in_byte_count;
						if (clk_count == 3'b000) 
							bit_count <= bit_count + 1'b1;
						else
							bit_count <= bit_count;			
					end
					SEND_DATA: begin
						clk_count <= clk_count - 1'b1;
						if (clk_count == 3'b000) begin
							bit_in_byte_count <= bit_in_byte_count - 1'b1;
							if (bit_in_byte_count != 3'b0)
								bit_count <= bit_count + 1'b1;	
							else 
								bit_count <= bit_count;
						end else begin
							bit_in_byte_count <= bit_in_byte_count;
							bit_count         <= bit_count;
						end
					end
					SEND_PARITY: begin
						clk_count <= clk_count - 1'b1;
						bit_in_byte_count <= bit_in_byte_count;
						if (clk_count == 3'b000)
							bit_count <= bit_count + 1'b1;
						else 
							bit_count <= bit_count;				
					end
					SEND_EOF: begin
						clk_count <= clk_count - 1'b1; 
						bit_in_byte_count <= bit_in_byte_count;
						bit_count         <= bit_count;
					end
					default: begin
						clk_count <= 3'b111;
						bit_in_byte_count <= 3'b111;
						bit_count <= 6'b0;
						frame_length_signal <= frame_length_signal;
					end
				endcase
			end

    always @(posedge clk) 
        if (en)	
			if (!rst_n) begin                                     
				remaining_bits <= 3'b0;
			end else begin 
				if (state == IDLE && frame_in_v)  
					remaining_bits <= frame_length[2:0];
				else if (state == SEND_SOF && remaining_bits != 0)
					remaining_bits <= 3'b0;
				else
					remaining_bits <= remaining_bits;
			end        

	always @(posedge clk)   
        if (en)	
			if (!rst_n) begin                                     
				bit_to_send <= 1'b0;
			end else begin 
				if (((state == SEND_SOF) || (state == SEND_PARITY)) && (clk_count == 3'b000))
					if (!test_mode || (test_mode && forcing != 4'b0))
						bit_to_send <= frame_in[bit_count];
					else
						bit_to_send <= sram_dout[bit_count[4:0]];
				else if ((state == SEND_DATA) && (clk_count == 3'b000))	
					if (bit_in_byte_count != 3'b0)
						if (!test_mode  || (test_mode && forcing != 4'b0))
							bit_to_send <= frame_in[bit_count];
						else
							bit_to_send <= sram_dout[bit_count[4:0]];
					else 
						bit_to_send <= 1'b0;	
				else if ((state == SEND_EOF) && (clk_count == 3'b000))
					bit_to_send <= 1'b0;
				else 
					bit_to_send <= bit_to_send;
			end   

	always @(posedge clk)  
        if (en)	
			if (!rst_n) begin                                     
				parity_bit <= 1'b1;
			end else begin 
				if ((state == SEND_DATA) && (clk_count == 3'b000)) 
					parity_bit <= parity_bit ^ bit_to_send;
				else if ((state == IDLE) || ((state == SEND_PARITY) && (clk_count == 3'b000)))
					parity_bit <= 1'b1;
				else 
					parity_bit <= parity_bit;

			end 

	always @(posedge clk)  
        if (en)	
			if (!rst_n) begin                                     
				tx_out <= 1'b0;
			end else begin 		
				if (state == SEND_SOF)
					if (clk_count > 3)
						tx_out <= 1'b0;
					else
						tx_out <= 1'b1;	
				else if ((state == SEND_DATA && bit_to_send == 1'b1) || (state == SEND_PARITY && parity_bit == 1'b1)) 
					if (clk_count > 3)
						tx_out <= 1'b0;
					else
						tx_out <= 1'b1;		
				else if ((state == SEND_DATA && bit_to_send == 1'b0) || (state == SEND_PARITY && parity_bit == 1'b0)) 	
					if (clk_count > 3)
						tx_out <= 1'b1;
					else
						tx_out <= 1'b0;	
				else if (state == SEND_EOF)
					tx_out <= 1'b1;
				else
					tx_out <= 1'b0;
			end    

	always @(posedge clk)    
        if (en)	
			if (!rst_n) begin                                     
				enc_done <= 1'b0;
			end else begin 		
				if ((state == IDLE) && (bit_count == (frame_length_signal + 1'b1)))
					enc_done <= 1'b1;
				else
					enc_done <= 1'b0;				
			end    

endmodule

