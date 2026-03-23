`timescale 1ns/1ps

module digital_block_10 (
    input  wire clk,
    output wire en,
    output wire clk_out
);

    reg [3:0] counter = 4'b0;
    reg en_sig = 1'b0;
    reg clk_div;

    always @(posedge clk) begin
        counter <= 4'b0;
        en_sig  <= 1'b0; 
        clk_div <= 1'b0; 
        if (counter == 4'b0111) begin
            clk_div <= ~clk_div; 
            counter <= counter + 1'b1;
        end else if (counter == 4'b1110) begin
            en_sig <= ~en_sig;
            counter <= counter + 1'b1;
        end else if (counter == 4'b1111) begin  
            counter <= 4'b0;
            en_sig <= ~en_sig;  
            clk_div <= ~clk_div;    
        end else begin
            clk_div <= clk_div;
            counter <= counter + 1'b1;
        end
    end
    assign en = en_sig;
    assign clk_out = clk_div;

endmodule

