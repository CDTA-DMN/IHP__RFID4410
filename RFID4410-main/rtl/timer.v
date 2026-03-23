
`timescale 1ns / 1ps

module digital_block_16 (clk, en, rst_n, start, last_bit, enc_done, timer_done);

    input  wire clk;   
    input  wire en;
    input  wire rst_n;    
    input  wire start;
    input  wire last_bit;
    input  wire enc_done;
    output reg  timer_done;

    reg [6:0] count;
    reg [6:0] target_count;
    reg       counting;

    always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                count        <= 7'd0;
                counting     <= 1'b0;
                timer_done   <= 1'b0;
                target_count <= 7'd0;
            end else begin
                timer_done <= 1'b0;
                if (enc_done) begin 
                    count        <= 7'd0;
                    counting     <= 1'b0;
                    timer_done   <= 1'b0;
                    target_count <= 7'd0;           
                end else if (start && last_bit) begin 
                    counting     <= 1'b1;
                    timer_done   <= 1'b0;
                    target_count <= 7'd78; 
                    count        <= 7'd0;
                end else if (start && !last_bit) begin
                    counting     <= 1'b1;
                    timer_done   <= 1'b0;
                    target_count <= 7'd74;   
                    count        <= 7'd0;
                end else if (counting) begin 
                    if (count == target_count - 1) begin
                        counting   <= 1'b0;
                        timer_done <= 1'b1;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
            end
    end

endmodule

