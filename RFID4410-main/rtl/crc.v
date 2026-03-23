`timescale 1ns / 1ps

module digital_block_03 (
    input  wire        clk,
    input  wire        en,
    input  wire        rst_n,
    input  wire        start,
    input  wire        calc,
    input  wire        check,
    input  wire [71:0] frame_in,
    input  wire [3:0]  data_len,
    
    output reg  [15:0] frame_out,
    output reg         crc_ok,
    output reg         crc_not_ok,
    output reg         crc_done
);

    //------------------------------------------------------------
    // Internal signals
    //------------------------------------------------------------
    reg         valid_i;
    reg  [ 7:0] data_byte;
    reg  [ 4:0] byte_cnt;
    reg  [ 4:0] byte_len;
    wire [15:0] crc_out;

    reg  [ 1:0] check_or_calc;  // 00 idle, 01 calc, 10 check

    //------------------------------------------------------------
    // FSM state encoding
    //------------------------------------------------------------
    localparam S_IDLE = 2'b00;
    localparam S_FEED = 2'b01;
    localparam S_DONE = 2'b10;

    reg  [1:0] current_state;
    reg  [1:0] next_state;

    wire [4:0] calc_byte_len = {1'b0, data_len} - 5'd2; 
    wire [4:0] check_byte_len = {1'b0, data_len};  

    //------------------------------------------------------------
    // CRC Calculator Instance
    //------------------------------------------------------------
    digital_block_02 #(
        .POLY(16'h1021),
        .CRC_SIZE(16),
        .DATA_WIDTH(8),
        .INIT(16'h6363)
    ) u_digital_block_02 (
        .clk     (clk),
        .en      (en),
        .rst_n   (rst_n),
        .valid_i (valid_i),
        .data_i  (data_byte),
        .crc_o   (crc_out),
        .crc_init(start)
    );

    //------------------------------------------------------------
    // Sequential Process: State Register
    //------------------------------------------------------------
    always @(posedge clk) begin
        if (en)
            if (!rst_n) 
                current_state <= S_IDLE;
            else 
                current_state <= next_state;
    end

    //------------------------------------------------------------
    // Combinational Process: Next State Logic
    //------------------------------------------------------------
    always @(*) begin
        next_state = current_state;  // default: stay in current state

        case (current_state)
            S_IDLE: begin
                if (start && (calc || check)) begin
                    next_state = S_FEED;
                end
                else begin
                    next_state = S_IDLE;
                end
            end

            S_FEED: begin
                if (byte_cnt >= byte_len) 
                    next_state = S_DONE;
                else 
                    next_state = S_FEED;
            end

            S_DONE: begin
                next_state = S_IDLE;
            end

            default: begin
                next_state = S_IDLE;
            end
        endcase
    end

    //------------------------------------------------------------
    // Sequential Process: Output and Data Logic
    //------------------------------------------------------------
    always @(posedge clk) begin
        if (en)
            if (!rst_n) begin
                byte_cnt      <= 5'd0;
                data_byte     <= 8'd0;
                valid_i       <= 1'b0;
                frame_out     <= 16'd0;
                crc_done      <= 1'b0;
                crc_ok        <= 1'b0;
                crc_not_ok    <= 1'b0;
                byte_len      <= 5'd0;
                check_or_calc <= 2'b00;
            end
            else begin
                // Default assignments to prevent latches
                crc_done   <= 1'b0;
                crc_ok     <= 1'b0;
                crc_not_ok <= 1'b0;
                valid_i    <= 1'b0;

                case (current_state)
                    //------------------------------------------------
                    S_IDLE: begin
                        data_byte <= 8'd0;
                        byte_cnt  <= 5'd0;

                        if (start && calc) begin
                            byte_len      <= calc_byte_len;
                            check_or_calc <= 2'b01;  // calc mode
                        end
                        else if (start && check) begin
                            byte_len      <= check_byte_len;
                            check_or_calc <= 2'b10;  // check mode
                        end
                        else begin
                            // Hold current values when not starting
                            byte_len      <= byte_len;
                            check_or_calc <= check_or_calc;
                        end
                    end

                    //------------------------------------------------
                    S_FEED: begin
                        if (byte_cnt < byte_len) begin
                            // Extract byte from frame_in (byte_cnt * 8 +: 8)
                            data_byte <= frame_in[(byte_cnt * 8) +: 8];
                            valid_i   <= 1'b1;
                            byte_cnt  <= byte_cnt + 1'b1;
                       end
                       else begin
                             // Stay at current byte_cnt when done feeding
                           data_byte <= data_byte;
                           byte_cnt  <= byte_cnt;
                       end
                   end

                     //------------------------------------------------
                   S_DONE: begin
                       data_byte <= 8'd0;
                    
                       if (check_or_calc == 2'b01) begin
                           // Calc mode: output CRC
                           frame_out <= crc_out;
                           crc_done  <= 1'b1;
                       end
                       else if (check_or_calc == 2'b10) begin
                           // Check mode: verify CRC
                           frame_out <= frame_out;  // Hold previous value
                           if (crc_out == 16'h0000) 
                               crc_ok <= 1'b1;
                           else 
                               crc_not_ok <= 1'b1;
                           crc_done <= 1'b1;
                      end
                      else begin
                          // Idle mode (shouldn't happen, but cover it)
                          frame_out <= frame_out;
                      end
                  end

                  //------------------------------------------------
                  default: begin
                      data_byte <= 8'd0;
                      byte_cnt  <= byte_cnt;
                      byte_len  <= byte_len;
                      frame_out <= frame_out;
                 end
             endcase
         end
    end

endmodule

