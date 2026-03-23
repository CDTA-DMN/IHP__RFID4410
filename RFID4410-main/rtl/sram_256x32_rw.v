`timescale 1ns / 1ps

 module digital_block_14 (
    input              A_CLK,
    input              en,
    input              rst_n,

    input              A_MEN,      
    input              A_WEN,     
    input              A_REN,      
    input      [7:0]   A_ADDR,
    input      [31:0]  A_DIN,
    
    input              A_BIST_EN,      
    input              A_BIST_MEN,      
    input              A_BIST_WEN,    
    input              A_BIST_REN,  
    input      [7:0]   A_BIST_ADDR,
    input      [31:0]  A_BIST_DIN,

    output     [31:0]  dout,
    output             dout_valid
);

    reg op_pending;

    always @(posedge A_CLK) begin
        if (en)
            if (!rst_n)
                op_pending <= 1'b0;
            else
                op_pending <= (A_MEN && (A_REN || A_WEN)) || (A_BIST_MEN && (A_BIST_REN || A_BIST_WEN));
    end

    assign dout_valid = op_pending;

    RM_IHPSG13_1P_256x32_c2_bm_bist u_sram (
        .A_CLK   (A_CLK),
        .A_MEN   (A_MEN),
        .A_WEN   (A_WEN),
        .A_REN   (A_REN),
        .A_ADDR  (A_ADDR),
        .A_DIN   (A_DIN),
        .A_DLY   (1'b1),
        .A_DOUT  (dout),
        .A_BM    (32'hFFFFFFFF),

        .A_BIST_CLK  (A_CLK),
        .A_BIST_EN   (A_BIST_EN),
        .A_BIST_MEN  (A_BIST_MEN),
        .A_BIST_WEN  (A_BIST_WEN),
        .A_BIST_REN  (A_BIST_REN),
        .A_BIST_ADDR (A_BIST_ADDR),
        .A_BIST_DIN  (A_BIST_DIN),
        .A_BIST_BM   (32'hFFFFFFFF)
    );

endmodule

