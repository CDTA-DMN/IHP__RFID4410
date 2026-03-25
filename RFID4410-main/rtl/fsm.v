

`timescale 1ns / 1ps

module digital_block_11 (clk, en, rst_n, out_4bits_A, out_4bits_B, out_4bits_C, out_4bits_D, out_8bits_A, out_16bits_A, out_16bits_B, out_16bits_C, str, p_ok, load_done, out_8bits_B, out_16bits_D, out_16bits_E, d_len, valid, n_me, resp_out, resp_length, resp_valid, str_load, ac_01, ac_02, cp_01, cp_02, crc_check, crc_ok, crc_not_ok, crc_cal, state_dbg, A_MEN, A_WEN, A_REN, A_ADDR, A_DIN, A_DOUT, A_DOUT_V, force_state);

    input  wire clk;
    input  wire en;
    input  wire rst_n;    
    input wire [3:0]  out_4bits_A;
    input wire [3:0]  out_4bits_B;
    input wire [3:0]  out_4bits_C;
    input wire [3:0]  out_4bits_D;    
    input wire [7:0]  out_8bits_A;
    input wire [15:0] out_16bits_A;
    input wire [15:0] out_16bits_B;
    input wire [15:0] out_16bits_C;    
    input wire        str;
    input wire        p_ok;    
    input wire        load_done;
    input wire [15:0] out_16bits_D;
    input wire [15:0] out_16bits_E;
    input wire [7:0]  out_8bits_B;    
    input wire [5:0]  d_len;    
    input wire        valid;
    input wire        n_me;    
    input wire        crc_ok;
    input wire        crc_not_ok;   
    input wire [31:0] A_DOUT;
    input wire        A_DOUT_V; 
    input  wire [3:0]  force_state;
    
    output reg [71:0] resp_out;        
    output reg [6:0]  resp_length;     
    output reg        resp_valid;     
    output reg        str_load;      
    output reg        ac_01;    
    output reg        ac_02;        
    output reg        cp_01;      
    output reg        cp_02;       
    output reg        crc_check;        
    output reg        crc_cal; 
    output reg        A_MEN; 
    output reg        A_WEN; 
    output reg        A_REN; 
    output reg [7:0]  A_ADDR; 
    output reg [31:0] A_DIN;    
    output reg [3:0]  state_dbg;
    


    localparam STATE_IDLE            = 4'd0;
    localparam STATE_READY1          = 4'd1;
    localparam STATE_READY2          = 4'd2;
    localparam STATE_ACTIVE          = 4'd3;
    localparam STATE_HALT            = 4'd4;
    localparam STATE_WAIT_ANTICOLL   = 4'd5;
    localparam STATE_WAIT_COMPARATOR = 4'd6;
    localparam STATE_WAIT_CRC        = 4'd7;
    localparam STATE_WRITE_SRAM      = 4'd8;
    localparam STATE_READ_SRAM       = 4'd9;
    
    localparam RESP_LEN_8BIT         = 7'd8;
    localparam RESP_LEN_16BIT        = 7'd16;
    localparam RESP_LEN_24BIT        = 7'd24;
    localparam RESP_LEN_32BIT        = 7'd32;
    localparam RESP_LEN_64BIT        = 7'd64;
    localparam RESP_LEN_40BIT        = 7'd40;
    localparam RESP_LEN_48BIT        = 7'd48;
    localparam RESP_LEN_72BIT        = 7'd72;
    
    localparam RESP_OK_4C            = 8'h4C;
    localparam RESP_ERROR_00         = 8'hEE;
    localparam RESP_HALT_AA          = 8'hAA;
    localparam RESP_CRC_ERROR_CC     = 8'hCC;
    localparam RESP_READY1_04        = 8'h04;
    localparam RESP_READY2_00        = 8'h00;
    
    localparam [1:0]
        ANTICOLL_LEVEL_NONE   = 2'b00,
        ANTICOLL_LEVEL_1      = 2'b01,
        ANTICOLL_LEVEL_2      = 2'b10,
        SRAM_LEVEL            = 2'b11;
    
    reg [3:0] state, next_state;
    wire force_enable;
    assign force_enable = (force_state != 4'b0);
    reg [71:0] resp_fsm;
    reg [6:0]  resp_length_fsm;
    reg        resp_valid_fsm;
    reg        crc_cal_fsm;
    reg [1:0]  anticoll_level;

    always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                state <= STATE_IDLE;
            end else if (force_enable) begin
                case (force_state)
                    4'd0: state <= STATE_IDLE;
                    4'd1: state <= STATE_READY1;
                    4'd2: state <= STATE_READY2;
                    4'd3: state <= STATE_ACTIVE;
                    4'd4: state <= STATE_HALT;
                    4'd5: state <= STATE_WAIT_ANTICOLL;
                    4'd6: state <= STATE_WAIT_COMPARATOR;
                    4'd7: state <= STATE_WAIT_CRC;
                    4'd8: state <= STATE_WRITE_SRAM;
                    4'd9: state <= STATE_READ_SRAM;
                    default: state <= STATE_IDLE;
                endcase
            end else begin
                state <= next_state;
            end
    end

     always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                str_load  <= 1'b0;
                ac_01     <= 1'b0;
                ac_02     <= 1'b0;
                cp_01     <= 1'b0;
                cp_02     <= 1'b0;
                crc_check <= 1'b0;
                crc_cal   <= 1'b0;
                A_MEN     <= 1'b0;
                A_WEN     <= 1'b0; 
                A_REN     <= 1'b0;
                A_ADDR    <= 8'b0;
                A_DIN     <= 32'b0;
                anticoll_level <= ANTICOLL_LEVEL_NONE;
            end else begin
                str_load  <= 1'b0;
                ac_01     <= 1'b0;
                ac_02     <= 1'b0;
                cp_01     <= 1'b0;
                cp_02     <= 1'b0;
                crc_check <= 1'b0;
                crc_cal   <= 1'b0;
                A_MEN     <= 1'b0;
                A_WEN     <= 1'b0;
                A_REN     <= 1'b0;

                if (state == STATE_IDLE && str && p_ok && ((out_4bits_A == 4'h1 && out_4bits_C == 4'h0)||(out_4bits_A == 4'h0 && out_4bits_C == 4'h1))) begin
                    str_load <= 1'b1;
                end

                if (state == STATE_READY1 && str && ((out_4bits_A == 4'h0 && out_4bits_C == 4'h2) && 
                (out_4bits_B != 4'h3 || out_4bits_D != 4'h9)) && p_ok) begin
                    ac_01     <= 1'b1;
                    anticoll_level <= ANTICOLL_LEVEL_1;
                end

                if (state == STATE_READY2 && str && ((out_4bits_A == 4'h0 && out_4bits_C == 4'h7) && 
                (out_4bits_B != 4'h3 || out_4bits_D != 4'h9)) && p_ok) begin
                    ac_02     <= 1'b1;
                    anticoll_level <= ANTICOLL_LEVEL_2;
                end
 
                if (crc_cal_fsm) begin
                    crc_cal <= 1'b1;
                end

                if (state == STATE_READY1 && str && ((out_4bits_A == 4'h0 && out_4bits_C == 4'h2) && 
                (out_4bits_B == 4'h3 && out_4bits_D == 4'h9)) && p_ok) begin
                    crc_check      <= 1'b1;
                    anticoll_level <= ANTICOLL_LEVEL_1;
                end else if (state == STATE_READY2 && str && ((out_4bits_A == 4'h0 && out_4bits_C == 4'h7) && 
                (out_4bits_B == 4'h3 && out_4bits_D == 4'h9)) && p_ok) begin
                    crc_check      <= 1'b1;
                    anticoll_level <= ANTICOLL_LEVEL_2;
                end else if (state == STATE_ACTIVE && str  && (out_4bits_A == 4'h6 && out_4bits_C == 4'h6) && p_ok) begin
                    crc_check      <= 1'b1;              
                    anticoll_level <= SRAM_LEVEL;
                end else if (state == STATE_ACTIVE && str  && ((out_4bits_A == 4'h4 && out_4bits_C == 4'h4) && (out_4bits_B == 4'h0 && out_4bits_D == 4'h0)) && p_ok) begin
                    crc_check      <= 1'b1;
                    anticoll_level <= ANTICOLL_LEVEL_NONE;
                end else if (state == STATE_ACTIVE && str  && (out_4bits_A == 4'h7 && out_4bits_C == 4'h7) && p_ok) begin
                    A_MEN  <= 1'b1;
                    A_REN  <= 1'b1;
                    A_ADDR <= {out_4bits_D, out_4bits_B};
                end

                if (state == STATE_WAIT_CRC && (crc_ok || (out_4bits_A == 4'h1 && out_4bits_C == 4'h3))) begin
                    if (anticoll_level == ANTICOLL_LEVEL_1) begin
                        cp_01 <= 1'b1;
                    end else if (anticoll_level == ANTICOLL_LEVEL_2) begin
                        cp_02 <= 1'b1;
                    end else if (anticoll_level == SRAM_LEVEL) begin
                        A_MEN  <= 1'b1;
                        A_WEN  <= 1'b1;
                        A_ADDR <= {out_4bits_D, out_4bits_B};
                        A_DIN  <= {out_16bits_B, out_16bits_A}; 
                    end
                end 
            end
    end

    always @(*) begin
        next_state       = state;
        resp_fsm         = 72'd0;
        resp_length_fsm  = 7'd0;
        resp_valid_fsm   = 1'b0;
        crc_cal_fsm      = 1'b0;
        
        case (state)
            STATE_IDLE: begin
                if (str) begin
                    if ((out_4bits_A == 4'h0 && out_4bits_C == 4'h1)||(out_4bits_A == 4'h1 && out_4bits_C == 4'h0)) begin
                        if (p_ok) begin
                            next_state = STATE_WAIT_ANTICOLL;
                        end else begin
                        resp_fsm[7:0]   = RESP_ERROR_00;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                        end
                   end else begin 
                        resp_fsm         = 72'd0;
                        resp_length_fsm  = 7'd0;
                        resp_valid_fsm   = 1'b1;
                   end
                end
            end

            STATE_READY1: begin
                if (str) begin
                    if (!p_ok && (out_4bits_A == 4'h0 && out_4bits_C == 4'h2)) begin
                        resp_fsm[7:0]   = RESP_ERROR_00;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_READY1;
                    end else if (p_ok && (out_4bits_A == 4'h0 && out_4bits_C == 4'h2) && 
                                 (out_4bits_B == 4'h3 && out_4bits_D == 4'h9)) begin
                        resp_fsm[7:0]   = {out_4bits_C, out_4bits_A};
                        resp_fsm[15:8]  = {out_4bits_D, out_4bits_B};
                        resp_fsm[55:16] = {out_8bits_A, out_16bits_B, out_16bits_A};
                        resp_fsm[71:56] = out_16bits_C;
                        resp_length_fsm = RESP_LEN_72BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_WAIT_CRC;
                    end else begin
                        next_state = STATE_READY1;
                    end
                end else if (ac_01) begin
                    next_state = STATE_WAIT_ANTICOLL;
                end
            end
            
            STATE_READY2: begin
                if (str) begin
                    if (out_4bits_A != 4'h0 || out_4bits_C != 4'h7) begin
                        next_state = STATE_READY2;
                    end else if (!p_ok) begin
                        resp_fsm[7:0]   = RESP_ERROR_00;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_READY2;
                    end else if ((out_4bits_A == 4'h0 && out_4bits_C == 4'h7) && (out_4bits_B == 4'h3 && out_4bits_D == 4'h9)) begin
                        resp_fsm[7:0]   = {out_4bits_C, out_4bits_A};
                        resp_fsm[15:8]  = {out_4bits_D, out_4bits_B};
                        resp_fsm[55:16] = {out_8bits_A, out_16bits_B, out_16bits_A};
                        resp_fsm[71:56] = out_16bits_C;
                        resp_length_fsm = RESP_LEN_72BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_WAIT_CRC;
                    end else begin
                        next_state = STATE_READY2;
                    end
                end else if (ac_02) begin
                    next_state = STATE_WAIT_ANTICOLL;
                end
            end

            STATE_ACTIVE: begin
                if (str) begin
                    if (!p_ok && (((out_4bits_A == 4'h4 && out_4bits_C == 4'h4) && (out_4bits_B == 4'h0 && out_4bits_D == 4'h0)) || (out_4bits_A == 4'h6 && out_4bits_C == 4'h6) || (out_4bits_A == 4'h7 && out_4bits_C == 4'h7)) ) begin
                        resp_fsm[7:0]   = RESP_ERROR_00;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_ACTIVE;
                    end else if ((out_4bits_A == 4'h4 && out_4bits_C == 4'h4) && (out_4bits_B == 4'h0 && out_4bits_D == 4'h0)) begin
                        resp_fsm[7:0]   = {out_4bits_C, out_4bits_A};
                        resp_fsm[15:8]  = {out_4bits_D, out_4bits_B};
                        resp_fsm[55:16] = {out_8bits_A, out_16bits_B, out_16bits_A};
                        resp_fsm[71:56] = out_16bits_C;
                        resp_length_fsm = RESP_LEN_32BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_WAIT_CRC;
                    end else if (out_4bits_A == 4'h6 && out_4bits_C == 4'h6) begin
                        resp_fsm[7:0]   = {out_4bits_C, out_4bits_A};
                        resp_fsm[15:8]  = {out_4bits_D, out_4bits_B};
                        resp_fsm[55:16] = {out_8bits_A, out_16bits_B, out_16bits_A};
                        resp_fsm[71:56] = out_16bits_C;
                        resp_length_fsm = RESP_LEN_64BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_WAIT_CRC;
                    end else if (out_4bits_A == 4'h7 && out_4bits_C == 4'h7) begin
                        resp_fsm         = 72'd0;
                        resp_length_fsm  = 7'd0;
                        resp_valid_fsm   = 1'b1;
                        next_state       = STATE_READ_SRAM;
                    end else begin
                        next_state       = STATE_ACTIVE;
                    end
                end
            end

            STATE_HALT: begin
                if (str) begin
                    if (out_4bits_A != 4'h0 || out_4bits_C != 4'h1) begin
                        next_state = STATE_HALT;
                    end else if (!p_ok) begin
                        resp_fsm[7:0]   = RESP_ERROR_00;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                    end else if (out_4bits_A == 4'h0 && out_4bits_C == 4'h1) begin
                        resp_fsm[7:0]   = RESP_OK_4C;
                        resp_fsm[15:8]  = 8'h00;
                        resp_length_fsm = RESP_LEN_16BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_READY1;
                    end
                end
            end

            STATE_WAIT_ANTICOLL: begin
                if (load_done) begin
                    resp_fsm[7:0]    = RESP_OK_4C;
                    resp_fsm[15:8]   = 8'h00;
                    resp_length_fsm  = RESP_LEN_16BIT;
                    resp_valid_fsm   = 1'b1;
                    next_state       = STATE_READY1;
                end else if (n_me) begin
                    resp_fsm         = 72'd0;
                    resp_length_fsm  = 7'd0;
                    resp_valid_fsm   = 1'b1;
                    next_state       = (anticoll_level == ANTICOLL_LEVEL_1) ? 
                                       STATE_READY1 : STATE_READY2;
                end else if (valid) begin
                    resp_fsm[15:0]   = out_16bits_D;
                    resp_fsm[31:16]  = out_16bits_E;
                    resp_fsm[39:32]  = out_8bits_B;
                    resp_length_fsm  = {1'b0, d_len};
                    resp_valid_fsm   = 1'b1;
                    next_state       = (anticoll_level == ANTICOLL_LEVEL_1) ? 
                                       STATE_READY1 : STATE_READY2;
                end else if (str) begin
                    if (out_4bits_A == 4'h7 && out_4bits_C == 4'h0) begin
                        resp_fsm[7:0]    = RESP_OK_4C;
                        resp_fsm[15:8]   = 8'h00;
                        resp_length_fsm  = RESP_LEN_16BIT;
                        resp_valid_fsm   = 1'b1;
                        next_state       = STATE_READY1;
                    end else if ((out_4bits_A == 4'h6 && out_4bits_C == 4'h1) && anticoll_level == ANTICOLL_LEVEL_1) begin
                        resp_fsm[39:0]   = 40'h8833221188;
                        resp_length_fsm  = RESP_LEN_40BIT;
                        resp_valid_fsm   = 1'b1;
                        next_state       = STATE_READY1;
                    end else if ((out_4bits_A == 4'h6 && out_4bits_C == 4'h1) && anticoll_level == ANTICOLL_LEVEL_2) begin
                        resp_fsm[39:0]   = 40'h0077665544;
                        resp_length_fsm  = RESP_LEN_40BIT;
                        resp_valid_fsm   = 1'b1;
                        next_state       = STATE_READY2;
                    end else if (out_4bits_A == 4'h1 && out_4bits_C == 4'h2) begin
                        resp_fsm[15:0]   = out_16bits_D;
	                resp_fsm[31:16]  = out_16bits_E;
	                resp_fsm[39:32]  = out_8bits_B;
                        resp_length_fsm  = {1'b0, d_len};
                        resp_valid_fsm   = 1'b1;
                        next_state       = (anticoll_level == ANTICOLL_LEVEL_1) ? 
                                           STATE_READY1 : STATE_READY2;
                    end else begin
                        resp_fsm[7:0]   = RESP_ERROR_00;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_WAIT_ANTICOLL;
                    end
                end
            end

            STATE_WAIT_COMPARATOR: begin
                if (valid) begin
                    if ({out_8bits_A, out_16bits_B, out_16bits_A} == {out_8bits_B, out_16bits_E, out_16bits_D}) begin
                        if (anticoll_level == ANTICOLL_LEVEL_1) begin
                            resp_fsm[7:0]   = RESP_READY1_04;
                            resp_length_fsm = RESP_LEN_24BIT;
                            resp_valid_fsm  = 1'b1;
                            crc_cal_fsm     = 1'b1;
                            next_state      = STATE_READY2;
                        end else if (anticoll_level == ANTICOLL_LEVEL_2) begin
                            resp_fsm[7:0]   = RESP_READY2_00;
                            resp_length_fsm = RESP_LEN_24BIT;
                            resp_valid_fsm  = 1'b1;
                            crc_cal_fsm     = 1'b1;
                            next_state      = STATE_ACTIVE;
                        end
                    end else begin
                        resp_fsm         = 72'd0;
                        resp_length_fsm  = 7'd0;
                        resp_valid_fsm   = 1'b1;
                        next_state      = (anticoll_level == ANTICOLL_LEVEL_1) ? 
                                          STATE_READY1 : STATE_READY2;
                    end
                end else if (str && (out_4bits_A == 4'h3 && out_4bits_C == 4'h2)) begin
                    if (anticoll_level == ANTICOLL_LEVEL_1) begin
                        resp_fsm[7:0]   = RESP_READY1_04;
                        resp_length_fsm = RESP_LEN_24BIT;
                        resp_valid_fsm  = 1'b1;
                        crc_cal_fsm     = 1'b1;
                        next_state      = STATE_READY2;
                    end else if (anticoll_level == ANTICOLL_LEVEL_2) begin
                        resp_fsm[7:0]   = RESP_READY2_00;
                        resp_length_fsm = RESP_LEN_24BIT;
                        resp_valid_fsm  = 1'b1;
                        crc_cal_fsm     = 1'b1;
                        next_state      = STATE_ACTIVE;
                    end
                end
            end

            STATE_WAIT_CRC: begin
                if (crc_ok) begin
                    if (anticoll_level == ANTICOLL_LEVEL_1 || 
                        anticoll_level == ANTICOLL_LEVEL_2) begin
                        resp_fsm         = 72'd0;
                        resp_length_fsm  = 7'd0;
                        resp_valid_fsm   = 1'b1;
                        next_state       = STATE_WAIT_COMPARATOR;
                    end else if (anticoll_level == SRAM_LEVEL) begin
                        resp_fsm         = 72'd0;
                        resp_length_fsm  = 7'd0;
                        resp_valid_fsm   = 1'b1;
                        next_state       = STATE_WRITE_SRAM;
                    end else begin
                        resp_fsm[7:0]   = RESP_HALT_AA;
                        resp_length_fsm = RESP_LEN_8BIT;
                        resp_valid_fsm  = 1'b1;
                        next_state      = STATE_HALT;
                    end
                end else if (crc_not_ok) begin
                    resp_fsm[7:0]   = RESP_CRC_ERROR_CC;
                    resp_length_fsm = RESP_LEN_8BIT;
                    resp_valid_fsm  = 1'b1;
                    if (anticoll_level == ANTICOLL_LEVEL_1)
                        next_state = STATE_READY1;
                    else if (anticoll_level == ANTICOLL_LEVEL_2)
                        next_state = STATE_READY2;
                    else
                        next_state = STATE_ACTIVE;
                end else if (str) begin
                    if (out_4bits_A == 4'h1 && out_4bits_C == 4'h3) begin
                        if (anticoll_level == ANTICOLL_LEVEL_1 || 
                            anticoll_level == ANTICOLL_LEVEL_2) begin
                            resp_fsm         = 72'd0;
                            resp_length_fsm  = 7'd0;
                            resp_valid_fsm   = 1'b1;
                            next_state       = STATE_WAIT_COMPARATOR;
                        end else begin
                            resp_fsm[7:0]   = RESP_HALT_AA;
                            resp_length_fsm = RESP_LEN_8BIT;
                            resp_valid_fsm  = 1'b1;
                            next_state      = STATE_HALT;
                        end
                    end else if (out_4bits_A == 4'h9 && out_4bits_C == 4'h0) begin
                        if (anticoll_level == ANTICOLL_LEVEL_1) begin
                            resp_fsm[23:0]   = 24'h17DA04;
                            resp_length_fsm  = RESP_LEN_24BIT;
                            resp_valid_fsm   = 1'b1;
                            next_state       = STATE_READY2;
                        end else if (anticoll_level == ANTICOLL_LEVEL_2) begin
                            resp_fsm[23:0]   = 24'h51FE00;
                            resp_length_fsm  = RESP_LEN_24BIT;
                            resp_valid_fsm   = 1'b1;
                            crc_cal_fsm      = 1'b1;
                            next_state       = STATE_ACTIVE;
                        end
                    end
                end
            end
            
            STATE_WRITE_SRAM: begin
                if (A_DOUT_V) begin
                    resp_fsm[7:0]   = RESP_HALT_AA;
                    resp_length_fsm = RESP_LEN_8BIT;
                    resp_valid_fsm  = 1'b1;
                    next_state      = STATE_ACTIVE;   
                end else begin
                    next_state = STATE_WRITE_SRAM;
                end
            end
            
            STATE_READ_SRAM: begin
                if (A_DOUT_V) begin
                    resp_fsm[31:0]  = A_DOUT;
                    resp_length_fsm = RESP_LEN_48BIT;
                    resp_valid_fsm  = 1'b1;
                    crc_cal_fsm     = 1'b1;
                    next_state      = STATE_ACTIVE;   
                end else begin
                    next_state = STATE_READ_SRAM;
                end
            end

            default: begin
                next_state = STATE_IDLE;
            end
        endcase
    end


    always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                resp_out    <= 72'd0;
                resp_length <= 7'd0;
                resp_valid  <= 1'b0;
            end else if (resp_valid_fsm) begin
                resp_out    <= resp_fsm;
                resp_length <= resp_length_fsm;
                resp_valid  <= 1'b1;
            end else begin
                resp_valid <= 1'b0;
            end
    end

    always @(*) begin
        case (state)
            STATE_IDLE:            state_dbg = 4'd0;
            STATE_READY1:          state_dbg = 4'd1;
            STATE_READY2:          state_dbg = 4'd2;
            STATE_ACTIVE:          state_dbg = 4'd3;
            STATE_HALT:            state_dbg = 4'd4;
            STATE_WAIT_ANTICOLL:   state_dbg = 4'd5;
            STATE_WAIT_COMPARATOR: state_dbg = 4'd6;
            STATE_WAIT_CRC:        state_dbg = 4'd7;
            STATE_WRITE_SRAM:      state_dbg = 4'd8;
            STATE_READ_SRAM:       state_dbg = 4'd9;
            default:               state_dbg = 4'd0;
        endcase
    end

endmodule

