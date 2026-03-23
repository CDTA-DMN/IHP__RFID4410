
`timescale 1ns / 1ps

module digital_block_05 (clk, en, rst_n, rx_in, d_out, d_v, s_com, e_com);
 
    input  wire clk;  
    input  wire en;      
    input  wire rst_n;          
    input  wire rx_in;          
    output reg  s_com; 
    output reg  d_out;   
    output reg  d_v; 
    output reg  e_com;   

    reg [2:0] pos_cnt;                
    reg pause_seen;      
    reg [2:0] pause_pos; 
    reg rx_last; 
    reg last_bit;
    reg [1:0] state, next_state; 

    parameter IDLE      = 2'b00;
    parameter WAIT_SOF  = 2'b01;
    parameter RECEIVE   = 2'b10;  

     always @(posedge clk) 
        if (en) 
            if (!rst_n) 
                 state      <= IDLE;
            else 
	         state      <= next_state;
	         
     always @*
        case (state)
           IDLE: begin
              if ((rx_in == 1'b0) && (rx_last == 1'b1))                      
                 next_state  = WAIT_SOF;
              else 
                 next_state  = IDLE;
            end
            WAIT_SOF: begin
               if (pos_cnt == 3'b111) 
                  if ((pause_seen && (pause_pos == 3'b100)) || (pause_seen && (pause_pos == 3'b101)))                      
                     next_state = RECEIVE; 
                  else                  
                     next_state = IDLE; 
               else  
                  next_state = WAIT_SOF;    
           end
           RECEIVE: begin 
              if ((pos_cnt == 3'b111) && (!pause_seen))
                 next_state = IDLE;
              else
                 next_state = RECEIVE;              
           end
           default: begin
              next_state = IDLE;
           end
        endcase
	
    always @(posedge clk) 
        if (en)
            if (!rst_n) 
                rx_last <= 1'b1;
            else 
	        rx_last <= rx_in;
	    
    always @(posedge clk)  
        if (en)                    
            if (!rst_n) begin                                     
                pos_cnt <= 3'b000;
            end else begin 
                if (state == IDLE) 
                    pos_cnt <= 3'b000; 
                else if ((state == WAIT_SOF) || (state == RECEIVE)) 
                    pos_cnt <= pos_cnt + 1'b1; 
                else
                    pos_cnt <= 3'b000; 
            end        
	    
    always @(posedge clk)    
        if (en)           
            if (!rst_n) begin                                     
                pause_seen <= 1'b0;
                pause_pos  <= 3'b000;
            end else begin 
                if ((rx_in == 1'b1) && (rx_last == 1'b0)) begin 
                    pause_seen <= 1'b1;                                                                                                                                                              
                    pause_pos  <= pos_cnt; 
                end else if ((rx_in == 1'b0) && (rx_last == 1'b1)) begin  
                    pause_seen <= 1'b0;
                    pause_pos  <= 3'b000;                                                                                                                                                
                end else if (pos_cnt == 3'b111) begin   
                    pause_seen <= 1'b0;
                    pause_pos  <= 3'b000;
                end else begin 
                    pause_seen <= pause_seen;
                    pause_pos  <= pause_pos;
                end 
            end
		  
     always @(posedge clk)   
        if (en)           
            if (!rst_n) begin                                     
                s_com <= 1'b0;
                d_out    <= 1'b0;
                d_v  <= 1'b0;
                e_com   <= 1'b0;
            end else begin 
                if ((pos_cnt == 3'b111) && (state == WAIT_SOF) && (pause_seen)) begin
                    if ((pause_pos == 3'b100) || (pause_pos == 3'b101)) begin
                        s_com <= 1'b1;             
                    end else begin
                        s_com <= 1'b0;
                    end         
                end else if ((pos_cnt == 3'b111) && (state == RECEIVE)) begin
                    if (pause_seen) begin
                        if ((pause_pos == 3'b000) || (pause_pos == 3'b001)) begin                
                            d_out   <= 1'b1;
                            d_v <= 1'b1;  
                        end else if ((pause_pos == 3'b010) || (pause_pos == 3'b011)) begin            
                            d_out   <= 1'b0;
                            d_v <= 1'b1;
                        end else begin
                            d_out   <= 1'b0;
                            d_v <= 1'b0;
                        end
                    end else begin                                        
                        e_com <= 1'b1;                                                      
                    end            
                end else begin  
                    s_com <= 1'b0;
                    d_out    <= 1'b0;
                    d_v  <= 1'b0;
                    e_com   <= 1'b0;
                end
            end

    always @(posedge clk)  
        if (en)            
            if (!rst_n) begin                                    
                last_bit <= 1'b0;
            end else begin 
                if (pos_cnt == 3'b000)
                    last_bit <= d_out;   
                else
                    last_bit <= last_bit;
            end

endmodule
