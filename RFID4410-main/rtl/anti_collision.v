
`timescale 1ns / 1ps

module digital_block_01 (clk, en, rst_n, ce, page_addr, din, din_valid, start, ac_01, ac_02, cp_01, cp_02, in_4bits_A,  in_4bits_B, in_16bits_A, in_16bits_B,  
load_done, out_8bits_A,  out_16bits_A, out_16bits_B, d_len, valid, n_me); 


    input  wire        clk; 
    input  wire        en;	
    input  wire        rst_n;       
    input  wire [31:0] din;        
    input  wire        din_valid;  
    input  wire        start;       
    input  wire        ac_01;   
    input  wire        ac_02;  
    input  wire        cp_01; 
    input  wire        cp_02; 
    input  wire [3:0]  in_4bits_A;   
    input  wire [3:0]  in_4bits_B; 	
    input  wire [15:0] in_16bits_A;    
    input  wire [15:0] in_16bits_B;
    
    output reg         ce;         
    output reg         page_addr;  
    output reg         load_done;   
    output reg [7:0]   out_8bits_A; 
    output reg [15:0]  out_16bits_A;   
    output reg [15:0]  out_16bits_B; 	
    output reg [5:0]   d_len; 
    output reg         valid;       
    output reg         n_me;       


    reg [39:0] cl1_part;             
    reg [39:0] cl2_part;             
    reg [5:0]  tvb;                  	
    reg [31:0] mask;             
    reg        match;                	
    reg [1:0] current_cl;           
    reg [2:0] state, next_state; 


    localparam IDLE      = 3'd0;    
    localparam WAIT_DATA = 3'd1;    
    localparam CAPTURE   = 3'd2;    
    localparam READY     = 3'd3;    
    localparam SENDING   = 3'd4;    



    always @(posedge clk) 
		if (en)
			if (!rst_n) 
				state <= IDLE;
			else 
				state <= next_state;

    always @*
		case (state)
			IDLE: begin
				if (start)                         
					next_state  = WAIT_DATA;
				else 
					next_state  = IDLE;
			end
			WAIT_DATA: begin
				if (din_valid)                         
					next_state  = CAPTURE;
				else 
					next_state  = WAIT_DATA;    
			end
			CAPTURE: begin 
				if (!page_addr)
					next_state = WAIT_DATA;
				else
					next_state = READY;              
			end			
			READY: begin
				if (ac_01 || ac_02 || cp_01 || cp_02)
					next_state = SENDING;
				else 
					next_state = READY;
			end	
			SENDING: begin
				next_state = READY;
			end
			default: begin
				next_state = IDLE;
			end
		endcase

    always @(posedge clk)      
		if (en)
			if (!rst_n) begin                                     
				page_addr  <= 1'b0;
				ce         <= 1'b0;
				load_done  <= 1'b0;
				cl1_part    <= 40'b0;				
				cl2_part    <= 40'b0;
			end else begin 
				if (state == WAIT_DATA) begin
					ce <= 1'b1; 
				end else if (state == CAPTURE) begin
					if (!page_addr) begin	
						cl1_part[31:0] <= din;				
						page_addr     <= page_addr + 1;										
					end else begin
						cl2_part[31:0] <= din;
						ce            <= 1'b0;
						load_done     <= 1'b1;     
					end 
				end else if (state == READY) begin
					cl1_part[39:32] <= cl1_part[7:0] ^ cl1_part[15:8] ^ cl1_part[23:16] ^ cl1_part[31:24]; 
					cl2_part[39:32] <= cl2_part[7:0] ^ cl2_part[15:8] ^ cl2_part[23:16] ^ cl2_part[31:24]; 
					if (start) 
						load_done <= 1'b1;
					else
						load_done <= 1'b0;
				end else begin
					page_addr  <= 1'b0;
					ce         <= 1'b0; 
					load_done  <= 1'b0;
					cl1_part    <= cl1_part;				
					cl2_part    <= cl2_part;
				end 
	end       
	    
    always @(posedge clk)   
		if (en)
			if (!rst_n) begin                                     
				tvb <= 6'b0;
			end else begin				
				if (state == READY && (ac_01 || ac_02)) 				
					if ((in_4bits_A <= 7)  && (in_4bits_B <= 8) && (in_4bits_B > 4))  
						tvb <= (in_4bits_B * 6'd8) + {2'b00, in_4bits_A} - 6'd40;
					else 
						tvb <= 6'b0;			
				else 
					tvb <= tvb;
	end

    always @(*) begin
		if (((current_cl == 2'b00) || (current_cl == 2'b01)) && tvb != 6'd0) begin
		    mask = 32'hFFFFFFFF >> (32 - tvb);
        end else begin
            mask = 32'b0;		
		end
	end

	always @(*) begin
        match = 1'b0;   
        if (tvb != 6'd0) 
            if (current_cl == 2'b00)
                match = (((cl1_part [31:0]^ {in_16bits_B, in_16bits_A}) & mask) == 32'd0);
            else if (current_cl == 2'b01)
                match = (((cl2_part [31:0]^ {in_16bits_B, in_16bits_A}) & mask) == 32'd0);
            else 
                match = 1'b0;
    end

	always @(posedge clk)  
		if (en)
			if (!rst_n) begin                                     
				current_cl <= 2'b00;
			end else begin 
				if ((state == READY) && ac_01) 
					current_cl <= 2'b00;
				else if ((state == READY) && ac_02) 
					current_cl <= 2'b01;
				else if ((state == READY) && cp_01) 
					current_cl <= 2'b10;
				else if ((state == READY) && cp_02)
					current_cl <= 2'b11;
				else 
					current_cl <= current_cl;
		   end

    always @(posedge clk)   
		if (en)
			if (!rst_n) begin                                     
				out_16bits_A <= 16'b0;
				out_16bits_B <= 16'b0;
				out_8bits_A  <= 8'b0;
				d_len  <= 6'b0;
				valid        <= 1'b0;
				n_me       <= 1'b0;
			end else begin 
				if ((state == SENDING) && (current_cl == 2'b00) && ({in_4bits_B, in_4bits_A} == 8'h40)) begin
					out_16bits_A <= cl1_part [15:0];
					out_16bits_B <= cl1_part [31:16];
					out_8bits_A  <= cl1_part [39:32];
					d_len <= 6'd40;
					valid       <= 1'b1;
				end else if ((state == SENDING) && (current_cl == 2'b00) && ({in_4bits_B, in_4bits_A} != 8'h40)) begin
					if (tvb == 6'd0) begin
						out_16bits_A <= 16'b0;
						out_16bits_B <= 16'b0;
						out_8bits_A  <= 8'b0; 
						d_len <= 6'd0;
						n_me      <= 1'b1;
					end else begin
						if (match) begin
							{out_8bits_A, out_16bits_B, out_16bits_A} <= cl1_part >> tvb;
							d_len <= 6'd40 - tvb;
							valid       <= 1'b1;
						end else begin
							out_16bits_A <= 16'b0;
							out_16bits_B <= 16'b0;
							out_8bits_A  <= 8'b0;  
							d_len <= 6'd0;
							n_me      <= 1'b1;
						end
					end	
				end else if ((state == SENDING) && (current_cl == 2'b01) && ({in_4bits_B, in_4bits_A} == 8'h40)) begin
					out_16bits_A <= cl2_part [15:0];
					out_16bits_B <= cl2_part [31:16];
					out_8bits_A  <= cl2_part [39:32];
					d_len <= 6'd40;
					valid       <= 1'b1;
				end else if ((state == SENDING) && (current_cl == 2'b01) && ({in_4bits_B, in_4bits_A} != 8'h40)) begin
					if (tvb == 6'd0) begin
						out_16bits_A <= 16'b0;
						out_16bits_B <= 16'b0;
						out_8bits_A  <= 8'b0; 
						d_len <= 6'd0;
						n_me      <= 1'b1;
					end else begin
						if (match) begin
							{out_8bits_A, out_16bits_B, out_16bits_A} <= cl2_part >> tvb;
							d_len <= 6'd40 - tvb;
							valid       <= 1'b1;
						end else begin
							out_16bits_A <= 16'b0;
							out_16bits_B <= 16'b0;
							out_8bits_A  <= 8'b0; 
							d_len <= 6'd0;
							n_me      <= 1'b1;
						end
					end	
				end else if ((state == SENDING) && (current_cl == 2'b10)) begin
					out_16bits_A <= cl1_part [15:0];
					out_16bits_B <= cl1_part [31:16];
					out_8bits_A  <= cl1_part [39:32];
					d_len <= 6'd40;
					valid       <= 1'b1;
				end else if ((state == SENDING) && (current_cl == 2'b11)) begin
					out_16bits_A <= cl2_part [15:0];
					out_16bits_B <= cl2_part [31:16];
					out_8bits_A  <= cl2_part [39:32];
					d_len <= 6'd40;
					valid       <= 1'b1;
				end else begin
					out_16bits_A <= out_16bits_A;
					out_16bits_B <= out_16bits_B;
					out_8bits_A  <= out_8bits_A;
					d_len <= d_len;
					valid       <= 1'b0;
					n_me      <= 1'b0;
				end
			end

endmodule


