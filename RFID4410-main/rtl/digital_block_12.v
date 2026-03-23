
`timescale 1ns / 1ps

module digital_block_12 #(
    parameter DATA_WIDTH = 32,
    parameter NUM_PAGES  = 2
)(
    input  wire                     clk,
    input  wire                     en,
    input  wire                     rst_n,
    input  wire                     ce,
    input  wire  [0:0]              addr,     
    output reg  [DATA_WIDTH-1:0]    dout,
    output reg                      dout_valid
);

    reg [DATA_WIDTH-1:0] mem [0:NUM_PAGES-1];

    initial begin
        mem[0] = 32'h33221188; 
        mem[1] = 32'h77665544; 
    end

    always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                dout       <= {DATA_WIDTH{1'b0}};
                dout_valid <= 1'b0;
            end else begin
                dout_valid <= 1'b0;
                if (ce) begin
                    dout       <= mem[addr];
                    dout_valid <= 1'b1;
                end
            end
    end

endmodule

