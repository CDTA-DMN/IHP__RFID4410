`timescale 1ns / 1ps

module digital_block_15 (clk , en, rst_n, test_mode, in_force_state, in_4bits_A, in_4bits_B, in_4bits_C, in_4bits_D, in_8bits_A, in_16bits_A, in_16bits_B, in_16bits_C, in_str, in_p_ok, in_l_b, out_4bits_A,
out_4bits_B, out_4bits_C, out_4bits_D, out_8bits_A, out_16bits_A, out_16bits_B, out_16bits_C, out_str, out_p_ok, out_l_b, out_force_state, A_BIST_DIN, A_BIST_ADDR, A_BIST_MEN, A_BIST_WEN, A_BIST_REN, 
sram_dout_len);

    input  wire        clk;
    input  wire        en;
    input  wire        rst_n;
    input  wire        test_mode;
    input  wire [3:0]  in_force_state;
    input  wire [3:0]  in_4bits_A;
    input  wire [3:0]  in_4bits_B;
    input  wire [3:0]  in_4bits_C;
    input  wire [3:0]  in_4bits_D;
    input  wire [7:0]  in_8bits_A;
    input  wire [15:0] in_16bits_A;
    input  wire [15:0] in_16bits_B;
    input  wire [15:0] in_16bits_C;
    input  wire        in_str;
    input  wire        in_p_ok;
    input  wire        in_l_b;
    
    output reg [3:0]  out_4bits_A;
    output reg [3:0]  out_4bits_B;
    output reg [3:0]  out_4bits_C;
    output reg [3:0]  out_4bits_D;
    output reg [7:0]  out_8bits_A;
    output reg [15:0] out_16bits_A;
    output reg [15:0] out_16bits_B;
    output reg [15:0] out_16bits_C;
    output reg        out_str;
    output reg        out_p_ok;
    output reg        out_l_b;
    output reg [3:0]  out_force_state;   
    output reg [31:0] A_BIST_DIN;
    output reg [7:0]  A_BIST_ADDR;
    output reg        A_BIST_MEN;
    output reg        A_BIST_WEN;
    output reg        A_BIST_REN;
    output reg [5:0]  sram_dout_len;
    

reg prev_test_mode;
reg [3:0] prev_in_force_state;
reg out_str_pulse_enable;


always @(posedge clk) begin
    if (en)
        if (!rst_n) begin
            prev_test_mode     <= 1'b0;
            prev_in_force_state       <= 4'b0;
            out_str_pulse_enable <= 1'b0;
            
            out_4bits_A  <= 4'h0;
            out_4bits_B  <= 4'h0;
            out_4bits_C  <= 4'h0;
            out_4bits_D  <= 4'h0;
            out_8bits_A  <= 8'h0;
            out_16bits_A <= 16'h0;
            out_16bits_B <= 16'h0;
            out_16bits_C <= 16'h0;
            out_str      <= 1'b0;
            out_p_ok     <= 1'b0;
            out_l_b      <= 1'b0;
            out_force_state <= 4'b0;
        
            A_BIST_DIN  <= 32'h0;
            A_BIST_ADDR <= 8'b0;
            A_BIST_MEN  <= 1'b0;
            A_BIST_WEN  <= 1'b0;
            A_BIST_REN  <= 1'b0;
            sram_dout_len <= 6'd0;
        end else begin
            prev_test_mode <= test_mode;
            prev_in_force_state   <= in_force_state;
            if (test_mode & ~prev_test_mode) begin
                out_str_pulse_enable <= 1'b1;
            end else if (test_mode & (in_force_state != prev_in_force_state)) begin
                out_str_pulse_enable <= 1'b1;
            end else begin
                out_str_pulse_enable <= 1'b0;
            end

            if (!test_mode) begin
                out_4bits_A  <= in_4bits_A;
                out_4bits_B  <= in_4bits_B;
                out_4bits_C  <= in_4bits_C;
                out_4bits_D  <= in_4bits_D;
                out_8bits_A  <= in_8bits_A;
                out_16bits_A <= in_16bits_A;
                out_16bits_B <= in_16bits_B;
                out_16bits_C <= in_16bits_C;
                out_str      <= in_str;
                out_p_ok     <= in_p_ok;
                out_l_b      <= in_l_b;
                out_force_state <= in_force_state;
            end else begin
                out_force_state <= in_force_state;
                out_str     <= 1'b0;
                out_p_ok <= 1'b0;
                out_l_b  <= 1'b0;
                if (out_str_pulse_enable) begin
                    out_str     <= 1'b1;  
                    out_p_ok <= 1'b1;  
                end
                case (in_force_state)   
                    4'b0000: begin
            	        if (in_str && (in_4bits_A == 4'h1 && in_4bits_C == 4'hB)) begin    
            	            A_BIST_DIN  <= {in_16bits_B, in_16bits_A};
			    A_BIST_ADDR <= {in_4bits_D, in_4bits_B};
			    A_BIST_MEN  <= 1'b1;
			    A_BIST_WEN  <= 1'b1;
			    A_BIST_REN  <= 1'b0; 
			    sram_dout_len <= 6'd0;  
		        end else if (in_str && (in_4bits_A == 4'h2 && in_4bits_C == 4'hB)) begin    
		            A_BIST_DIN  <= 32'h0;
			    A_BIST_ADDR <= {in_4bits_D, in_4bits_B};
		    	    A_BIST_MEN  <= 1'b1;
			    A_BIST_WEN  <= 1'b0;
			    A_BIST_REN  <= 1'b1;
			    sram_dout_len <= 6'd32; 		      	    
            	        end else begin 
            	            A_BIST_DIN  <= 32'h0;
		  	    A_BIST_ADDR <= 8'b0;
			    A_BIST_MEN  <= 1'b0;
			    A_BIST_WEN  <= 1'b0;
			    A_BIST_REN  <= 1'b0;
			    sram_dout_len <= sram_dout_len;
            	        end          	           	    
            	    end           
                4'b0001: begin
                    out_4bits_A  <= 4'h6;
		    out_4bits_B  <= 4'h0;
		    out_4bits_C  <= 4'h2;
		    out_4bits_D  <= 4'h0;
		    out_8bits_A  <= 8'h0;
		    out_16bits_A <= 16'h0;
		    out_16bits_B <= 16'h0;
		    out_16bits_C <= 16'h0;
                    out_l_b <= 1'b0;
                    out_force_state <= 4'b0;
                end
                4'b0010: begin
                    out_4bits_A  <= 4'h3;
		    out_4bits_B  <= 4'h0;
		    out_4bits_C  <= 4'h9;
		    out_4bits_D  <= 4'h2;
		    out_8bits_A  <= 8'h0;
		    out_16bits_A <= 16'h0;
		    out_16bits_B <= 16'h0;
		    out_16bits_C <= 16'h0;
                    out_l_b <= 1'b0;
                    out_force_state <= 4'b0;
                end
                4'b0011: begin
                    out_4bits_A  <= 4'h3;
		    out_4bits_B  <= 4'h0;
		    out_4bits_C  <= 4'h9;
		    out_4bits_D  <= 4'h3;
		    out_8bits_A  <= 8'h0;
		    out_16bits_A <= 16'h0088;
		    out_16bits_B <= 16'h0;
		    out_16bits_C <= 16'h0;
                    out_l_b <= out_str_pulse_enable;  
                    out_force_state <= 4'b0;
                end
                4'b0100: begin
                    out_4bits_A  <= 4'h3;
		    out_4bits_B  <= 4'h0;
		    out_4bits_C  <= 4'h9;
		    out_4bits_D  <= 4'h7;
		    out_8bits_A  <= 8'h88;
		    out_16bits_A <= 16'h1188;
		    out_16bits_B <= 16'h3322;
		    out_16bits_C <= 16'hFAF4;
                    out_force_state <= 4'b0;
                end
/*
                4'b0101: begin
                    cmd      <= 8'h95;
                    param    <= 8'h70;
                    uid_casc <= 40'h0077665544;
                    crc_out   <= 16'hB87A;
                    out_force_state <= 4'b0;
                end
                4'b0110: begin
                    cmd      <= 8'h16;
                    param    <= 8'h00;
                    uid_casc <= 40'h0;
                    crc_out   <= 16'h0;
                    out_force_state <= 4'b0;
                end
                4'b0111: begin
                    cmd      <= 8'h07;
                    param    <= 8'h00;
                    uid_casc <= 40'h0;
                    crc_out   <= 16'h0;
                    out_force_state <= 4'b0;
                end
*/                
                default: begin
                    out_4bits_A  <= 4'h0;
		    out_4bits_B  <= 4'h0;
		    out_4bits_C  <= 4'h0;
		    out_4bits_D  <= 4'h0;
		    out_8bits_A  <= 8'h0;
		    out_16bits_A <= 16'h0;
		    out_16bits_B <= 16'h0;
		    out_16bits_C <= 16'h0;
                    out_force_state <= 4'b0;
                end
            endcase
        end
    end
end

endmodule

