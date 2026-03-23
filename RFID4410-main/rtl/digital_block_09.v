`timescale 1ns / 1ps

module digital_block_09 (
    input  wire        clk,
    input  wire        en, 
    input  wire        rst_n,
    input  wire [39:0] frame_in,
    input  wire [6:0]  frame_len,
    input  wire        frame_in_v,
    input  wire        crc_cal,
    input  wire [15:0] crc_frame,
    input  wire        crc_done,
    output reg  [47:0] frame_out,
    output reg  [5:0]  frame_out_len,
    output reg         frame_out_v
);

    //----------------------------------------------------------
    // State encoding (manual)
    //----------------------------------------------------------
    localparam [1:0]
        IDLE          = 2'b00,
        IMMEDIATE_OUT = 2'b01,
        CRC_PENDING   = 2'b10,
        CRC_OUT       = 2'b11;

    reg [1:0] current_state;
    reg [1:0] next_state;


    //----------------------------------------------------------
    // Sequential process: state register
    //----------------------------------------------------------
    always @(posedge clk) begin
        if (en)
            if (!rst_n)
                current_state <= IDLE;
            else
                current_state <= next_state;
    end

    //----------------------------------------------------------
    // Combinational process: next state logic
    //----------------------------------------------------------
    always @(*) begin
        next_state = current_state; // default

        case (current_state)
            IDLE: begin
                if (frame_in_v) begin
                    if (!crc_cal)
                        next_state = IMMEDIATE_OUT;
                    else
                        next_state = CRC_PENDING;
                end
            end

            IMMEDIATE_OUT: begin
                next_state = IDLE;
            end

            CRC_PENDING: begin
                if (frame_in_v) begin
                    if (!crc_cal)
                        next_state = IMMEDIATE_OUT;
                    else
                        next_state = CRC_PENDING;
                end
                else if (crc_done)
                    next_state = CRC_OUT;
            end

            CRC_OUT: begin
                next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    //----------------------------------------------------------
    // Sequential process: data/output logic
    //----------------------------------------------------------
    always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                frame_out     <= 48'b0;
                frame_out_len <= 6'b0;
                frame_out_v   <= 1'b0;
            end else begin
                // default
                frame_out_v <= 1'b0;
                // Output assignments
                case (current_state)
                    IMMEDIATE_OUT: begin
                        frame_out[39:0]   <= frame_in;
                        frame_out[47:40]  <= 8'b0;
                        frame_out_len <= frame_len[5:0];
                        frame_out_v <= 1'b1;
                    end

                    CRC_OUT: begin
                        if (frame_len == 7'd24) begin
                            frame_out[7:0]   <= frame_in[7:0];
                            frame_out[15:8]  <= crc_frame[15:8];
                            frame_out[23:16] <= crc_frame[7:0];
                            frame_out[47:24] <= 24'b0;
                            frame_out_len <= frame_len[5:0];
                            frame_out_v      <= 1'b1;
                        end else if (frame_len == 7'd48) begin
                            frame_out[31:0]   <= frame_in[31:0];
                            frame_out[39:32]  <= crc_frame[15:8];
                            frame_out[47:40] <= crc_frame[7:0];
                            frame_out_len    <= frame_len[5:0];
                            frame_out_v      <= 1'b1;
                        end else begin
                            frame_out   <= 48'b0;
                            frame_out_len <= 6'b0;
                            frame_out_v <= 1'b1;
                        end 
                    end
                    default: begin
                        frame_out     <= frame_out;
                        frame_out_len <= frame_out_len;
                        frame_out_v   <= 1'b0;
                    end
                endcase
            end
    end

endmodule

