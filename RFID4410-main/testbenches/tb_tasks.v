

    //---------------------------------------------------------
    // Task to send a sequence (S, H, L, E)
    //---------------------------------------------------------
    task send_sequence(input [7:0] seq);
    begin
        if (seq == "S") begin
            rx_in = 0; #(CLK_PERIOD * t1_clks);
            rx_in = 1; #(CLK_PERIOD * (tx_clks - t1_clks));
            rx_in = 0; #(CLK_PERIOD * t1_clks);
            rx_in = 1; #(CLK_PERIOD * (tx_clks - t1_clks));
        end
        else if (seq == "H") begin
            rx_in = 0; #(CLK_PERIOD * t1_clks);
            rx_in = 1; #(CLK_PERIOD * (tb_clks - t1_clks));
        end
        else if (seq == "L") begin
            rx_in = 1; #(CLK_PERIOD * (tx_clks - t1_clks));
            rx_in = 0; #(CLK_PERIOD * t1_clks);
            rx_in = 1; #(CLK_PERIOD * tx_clks);
        end
        else if (seq == "E") begin
            rx_in = 1; #(CLK_PERIOD * tb_clks);
        end
    end
    endtask
    
    //---------------------------------------------------------
    // Task to run force state
    //---------------------------------------------------------
    
task run_force_state;
    input [3:0] value;   // exactly 7 bits
    integer i;
    begin
        for (i = 1; i < 16; i = i + 1) begin
            
            // Apply force_state
            force_state = i[3:0];
            #(1236 * CLK_PERIOD);
            
            // Clear force_state
            force_state = 4'b0;
            #(1236 * CLK_PERIOD);
            
            
            // Apply reset
            if (value == 4'b0) begin
                rst_n = 0;
                #(32 * CLK_PERIOD);
                rst_n = 1;
            end else begin
                rst_n = 1;
                force_state = value;
            end
            #(1236 * CLK_PERIOD);
            force_state = 4'b0;
        end
    end
endtask
    
    //---------------------------------------------------------
    // Task to send random frame
    //---------------------------------------------------------
            
task send_random_frame;
    input integer length;   // number of random bits between S and E
    integer i;
    reg rand_bit;
    begin
        // Start
        send_sequence("S");
        // Random body
        for (i = 0; i < length; i = i + 1) begin
            rand_bit = $urandom_range(0,1);
        
            if (rand_bit == 1)
                send_sequence("H");
            else
                send_sequence("L");
        end
        // End
        send_sequence("E");
    end
endtask
            

task generate_50_random_frames;

    integer frame_idx;
    integer bit_idx;
    integer length;

    integer MIN_LEN;     // minimum bits between S and E
    integer MAX_LEN;    // maximum bits between S and E

    begin
        MIN_LEN = 4;
        MAX_LEN = 32;
        
        for (frame_idx = 0; frame_idx < 50; frame_idx = frame_idx + 1) begin        
            // Random frame size
            length = $urandom_range(MIN_LEN, MAX_LEN);
            $display("Frame %0d - Length = %0d", frame_idx, length);
            // Start
            send_sequence("S");
            // Random payload
            for (bit_idx = 0; bit_idx < length; bit_idx = bit_idx + 1) begin
                if ($urandom_range(0,1))
                    send_sequence("H");
                else
                    send_sequence("L");
            end
            // End
            send_sequence("E");
            // Optional gap between frames
            #(2000 * CLK_PERIOD);
         end
    end
endtask  


task send_short_frame;
    input [6:0] value;   // exactly 7 bits
    integer i;
    begin
        send_sequence("S");
        // Send MSB first (bit 6 down to 0)
        for (i = 0; i <= 6; i = i + 1) begin
            if (value[i] == 1'b1)
                send_sequence("H");
            else
                send_sequence("L");
        end
        send_sequence("E");
    end
endtask  

task send_standard_frame_manual_parity;

    input integer size;            // total data bits
    input [255:0] data;            // data value
    input [31:0] parity_bits;      // one parity bit per byte

    integer i;
    integer bit_count;
    integer byte_index;

    begin
        send_sequence("S");
        bit_count  = 0;
        byte_index = 0;
        // Send MSB first
        for (i = 0; i <= size-1; i = i + 1) begin
            // Send data bit
            if (data[i])
                send_sequence("H");
            else
                send_sequence("L");
            bit_count = bit_count + 1;
            // After every 8 bits → send manual parity
            if (bit_count == 8) begin
                if (parity_bits[byte_index])
                    send_sequence("H");
                else
                    send_sequence("L");
                bit_count = 0;
                byte_index = byte_index + 1;
            end
        end
        send_sequence("E");
    end
endtask     

task generate_frames_param_0_to_255;

    integer tvb;
    integer A;
    integer B;

    integer i;
    integer bit_counter;
    integer uid_bits_sent;

    reg [7:0] byte1;
    reg [7:0] current_byte;
    reg parity;
    
    input [7:0] code;
    input [39:0] uid;

begin


    for (tvb = 0; tvb <= 255; tvb = tvb + 1) begin

        B = tvb / 16;
        A = tvb % 16;

        byte1 = {B[3:0], A[3:0]};

        $display("Sending frame for PARAM = %0d", tvb);

        send_sequence("S");

        //---------------------------------
        // Send Byte0 = 0x20
        //---------------------------------
        current_byte = code;
        parity = 0;

        for (i = 0; i <= 7; i = i + 1) begin
            if (current_byte[i])
                send_sequence("H");
            else
                send_sequence("L");

            parity = parity ^ current_byte[i];
        end

        send_sequence(!parity ? "H" : "L");

        //---------------------------------
        // Send Byte1
        //---------------------------------
        current_byte = byte1;
        parity = 0;

        for (i = 0; i <= 7; i = i + 1) begin
            if (current_byte[i])
                send_sequence("H");
            else
                send_sequence("L");

            parity = parity ^ current_byte[i];
        end

        send_sequence(!parity ? "H" : "L");

        //---------------------------------
        // Send ONLY tvb bits of UID
        //---------------------------------
        parity = 0;
        bit_counter = 0;
        uid_bits_sent = 0;

        for (i = 0; i <= 31; i = i + 1) begin

            if (uid_bits_sent < tvb) begin

                if (uid[i])
                    send_sequence("H");
                else
                    send_sequence("L");

                parity = parity ^ uid[i];
                bit_counter = bit_counter + 1;
                uid_bits_sent = uid_bits_sent + 1;

                // Insert parity every 8 bits
                if (bit_counter == 8) begin
                    send_sequence(!parity ? "H" : "L");
                    parity = 0;
                    bit_counter = 0;
                end

            end
        end

        // No parity for incomplete last byte

        send_sequence("E");

        #(8000 * CLK_PERIOD);

    end
end
endtask


function [15:0] compute_crc16;
    input [255:0] data;      // Input data (max 256 bits)
    input integer size;      // Number of bits (must be multiple of 8)

    reg [15:0] crc;
    reg [15:0] v_crc_next;
    reg [15:0] v_crc_prev;

    integer i, j, k;
    integer total_bytes;
    reg [7:0] byte;
    reg [15:0] POLY;

begin
    // ----------------------------
    // Initialize CRC and polynomial
    // ----------------------------
    crc  = 16'h6363;   // same as RTL INIT
    POLY = 16'h1021;   // same as RTL POLY

    total_bytes = size / 8;

    // ----------------------------
    // Process each byte (LSB first)
    // ----------------------------
    for (i = 0; i < total_bytes; i = i + 1) begin
        byte = data[(i*8) +: 8];  // LSB-first byte order
        v_crc_prev = crc;

        // ----------------------------
        // Process each bit (LSB first)
        // ----------------------------
        for (j = 0; j < 8; j = j + 1) begin
            // Update MSB
            v_crc_next[15] = v_crc_prev[0] ^ byte[j];

            // Apply polynomial to the remaining bits
            for (k = 1; k < 16; k = k + 1) begin
                if (POLY[k])
                    v_crc_next[15-k] = v_crc_prev[16-k] ^ (v_crc_prev[0] ^ byte[j]);
                else
                    v_crc_next[15-k] = v_crc_prev[16-k];
            end

            // Prepare for next bit
            v_crc_prev = v_crc_next;
        end

        // Update CRC after full byte
        crc = v_crc_next;
    end

    // ----------------------------
    // Output byte swap (same as RTL)
    // ----------------------------
    compute_crc16 = crc;
end
endfunction

task send_standard_frame_auto_crc_parity;

    input integer size;        // data bits (multiple of 8)
    input [255:0] data;

    integer i, j;
    integer total_bytes;

    reg [15:0] crc;
    reg [7:0]  byte;
    reg        parity;

begin
    // -------------------------
    // 1. Compute CRC
    // -------------------------
    crc = compute_crc16(data, size);

    send_sequence("S");

    // -------------------------
    // 2. Send DATA + parity
    // -------------------------
    total_bytes = size / 8;

    for (i = 0; i < total_bytes; i = i + 1) begin

        byte = data[(i*8) +: 8];

        // send 8 bits
        for (j = 0; j < 8; j = j + 1) begin
            if (byte[j])
                send_sequence("H");
            else
                send_sequence("L");
        end

        // compute parity (EVEN parity here)
        parity = ^byte;   // XOR of all bits

        // send parity bit
        if (!parity)
            send_sequence("H");
        else
            send_sequence("L");
    end

    // -------------------------
    // 3. Send CRC + parity
    // -------------------------
    for (i = 0; i < 2; i = i + 1) begin

        byte = crc[(i*8) +: 8];

        for (j = 0; j < 8; j = j + 1) begin
            if (byte[j])
                send_sequence("H");
            else
                send_sequence("L");
        end

        parity = ^byte;

        if (!parity)
            send_sequence("H");
        else
            send_sequence("L");
    end

    send_sequence("E");

end
endtask

task send_custom_frame_auto_crc_parity;
    input [7:0] first_byte;        // manually chosen first byte
    input [7:0] second_byte_start; // start value for second byte
    input [7:0] second_byte_end;   // end value for second byte
    input integer data_size_bits;  // remaining bits to send (max 256)
    input [255:0] data_value;      // remaining data, right-aligned

    integer i, j, second_byte;
    integer bit_idx;
    reg [7:0] byte;
    reg parity;
    reg [15:0] crc;
    reg [255:0] crc_data;          // full frame for CRC
    integer total_bits;

begin
    for (second_byte = second_byte_start; second_byte <= second_byte_end; second_byte = second_byte + 1) begin
        $display("Sending frame for PARAM = %0d", second_byte);
        // -----------------------------
        // Start frame
        // -----------------------------
        send_sequence("S");

        // -----------------------------
        // 1️⃣ Send first byte + parity
        // -----------------------------
        byte = first_byte;
        for (j = 0; j < 8; j = j + 1)
            send_sequence(byte[j] ? "H" : "L");
        parity = ^byte;
        send_sequence(!parity ? "H" : "L"); // EVEN parity

        // -----------------------------
        // 2️⃣ Send second byte + parity
        // -----------------------------
        byte = second_byte;
        for (j = 0; j < 8; j = j + 1)
            send_sequence(byte[j] ? "H" : "L");
        parity = ^byte;
        send_sequence(!parity ? "H" : "L");

        // -----------------------------
        // 3️⃣ Send remaining data bytes + parity each byte
        // -----------------------------
        for (bit_idx = 0; bit_idx < data_size_bits; bit_idx = bit_idx + 8) begin
            byte = 0;
            for (j = 0; j < 8; j = j + 1) begin
                if (bit_idx + j < data_size_bits)
                    byte[j] = data_value[bit_idx + j];
            end
            // Send bits LSB first
            for (j = 0; j < 8; j = j + 1)
                send_sequence(byte[j] ? "H" : "L");
            // Parity
            parity = ^byte;
            send_sequence(!parity ? "H" : "L");
        end

        // -----------------------------
        // 4️⃣ Build CRC input manually (bit by bit)
        // -----------------------------
        total_bits = 16 + data_size_bits; // first + second + remaining
        crc_data = 0;

        // first byte
        for (i = 0; i < 8; i = i + 1)
            crc_data[i] = first_byte[i];

        // second byte
        for (i = 0; i < 8; i = i + 1)
            crc_data[8 + i] = second_byte[i];

        // remaining data
        for (i = 0; i < data_size_bits; i = i + 1)
            crc_data[16 + i] = data_value[i];

        // -----------------------------
        // 5️⃣ Compute CRC
        // -----------------------------
        crc = compute_crc16(crc_data, total_bits);

        // -----------------------------
        // 6️⃣ Send CRC (16 bits) with parity
        // -----------------------------
        for (i = 1; i >= 0; i = i - 1) begin
            byte = crc[(1-i)*8 +: 8]; // MSB first
            for (j = 0; j < 8; j = j + 1)
                send_sequence(byte[j] ? "H" : "L");
            parity = ^byte;
            send_sequence(!parity ? "H" : "L");
        end

        // -----------------------------
        // 7️⃣ End frame
        // -----------------------------
        send_sequence("E");
        #(8000 * CLK_PERIOD);
    end
end
endtask

task run_test_mode_force_state;
    integer i;
    reg [3:0] gray;
    begin
        for (i = 0; i < 16; i = i + 1) begin
            
            // Generate Gray code
            gray = i ^ (i >> 1);

            // Apply force_state
            force_state = gray;
            #(10000 * CLK_PERIOD);           


        end
    end
endtask
