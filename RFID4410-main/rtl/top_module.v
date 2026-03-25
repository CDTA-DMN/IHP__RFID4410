
`timescale 1ns / 1ps

module top_module (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        rx_in,
    input  wire [3:0]  force_state,
    input  wire        test_mode,
    output wire        tx_out,
    output wire [3:0]  state_dbg,
    output wire        clk_out
);

    //--------------------------------------------------------------------
    // digital_block_10 signals
    //--------------------------------------------------------------------
    wire en_div;
    wire clk_out_div;
    
    //--------------------------------------------------------------------
    // digital_block_15 signals
    //--------------------------------------------------------------------
    
    wire [3:0]  out_4bits_A_test;
    wire [3:0]  out_4bits_B_test;
    wire [3:0]  out_4bits_C_test;
    wire [3:0]  out_4bits_D_test;
    wire [7:0]  out_8bits_A_test;
    wire [15:0] out_16bits_A_test;
    wire [15:0] out_16bits_B_test;
    wire [15:0] out_16bits_C_test;
    wire        out_str_test;
    wire        out_p_ok_test;
    wire        out_l_b_test;
    wire [3:0]  out_force_state_test;   
    wire [31:0] A_BIST_DIN_test;
    wire [7:0]  A_BIST_ADDR_test;
    wire        A_BIST_MEN_test;
    wire        A_BIST_WEN_test;
    wire        A_BIST_REN_test;
    wire [5:0]  sram_dout_len_test;
    
   

    //--------------------------------------------------------------------
    // digital_block_04 signals
    //--------------------------------------------------------------------
    
    wire [3:0]  out_4bits_A_dec; 
    wire [3:0]  out_4bits_B_dec; 
    wire [3:0]  out_4bits_C_dec; 
    wire [3:0]  out_4bits_D_dec;  
    wire [7:0]  out_8bits_A_dec; 
    wire [15:0] out_16bits_A_dec;
    wire [15:0] out_16bits_B_dec;
    wire [15:0] out_16bits_C_dec;
    wire        d_rdy_dec; 
    wire        p_ok_dec; 
    wire        l_b_dec;  
    

    //--------------------------------------------------------------------
    // digital_block_11 signals
    //--------------------------------------------------------------------
    
    wire [71:0] resp_out_fsm;        
    wire [6:0]  resp_length_fsm;     
    wire        resp_valid_fsm;     
    wire        str_load_fsm;      
    wire        ac_01_fsm;    
    wire        ac_02_fsm;        
    wire        cp_01_fsm;      
    wire        cp_02_fsm;       
    wire        crc_check_fsm;        
    wire        crc_cal_fsm; 
    wire        A_MEN_fsm; 
    wire        A_WEN_fsm; 
    wire        A_REN_fsm; 
    wire [7:0]  A_ADDR_fsm; 
    wire [31:0] A_DIN_fsm;    
    wire [3:0]  state_dbg_fsm;
    
    
    //--------------------------------------------------------------------
    // digital_block_14 signals
    //--------------------------------------------------------------------
    
    wire [31:0] dout_sram;
    wire        dout_valid_sram;

    //--------------------------------------------------------------------
    // digital_block_01 signals
    //--------------------------------------------------------------------
    
    wire         ce_ac;         
    wire         page_addr_ac;  
    wire         load_done_ac;   
    wire [7:0]   out_8bits_A_ac; 
    wire [15:0]  out_16bits_A_ac;   
    wire [15:0]  out_16bits_B_ac; 	
    wire [5:0]   d_len_ac; 
    wire         valid_ac;       
    wire         n_me_ac;   
    

    //--------------------------------------------------------------------
    // digital_block_13 signals
    //--------------------------------------------------------------------
    wire [31:0] dout_rom;
    wire        dout_valid_rom;

    //--------------------------------------------------------------------
    // digital_block_03 signals
    //--------------------------------------------------------------------
    
    wire [15:0] frame_out_crc;
    wire        crc_ok_crc;
    wire        crc_not_ok_crc;
    wire        crc_done_crc;

    //--------------------------------------------------------------------
    // digital_block_16 signals
    //--------------------------------------------------------------------
    wire timer_done_timer;

    //--------------------------------------------------------------------
    // digital_block_08 signals
    //--------------------------------------------------------------------
    wire enc_done_enc;
    
    
    
    //--------------------------------------------------------------------
    // digital_block_15 instance
    //--------------------------------------------------------------------
    
    
    digital_block_15 u_digital_block_15 (
        .clk(clk),
        .en(en_div),
        .rst_n(rst_n),
        .test_mode(test_mode),
        .in_force_state(force_state),
        .in_4bits_A(out_4bits_A_dec),
        .in_4bits_B(out_4bits_B_dec),
        .in_4bits_C(out_4bits_C_dec),
        .in_4bits_D(out_4bits_D_dec),
        .in_8bits_A(out_8bits_A_dec),
        .in_16bits_A(out_16bits_A_dec),
        .in_16bits_B(out_16bits_B_dec),
        .in_16bits_C(out_16bits_C_dec),
        .in_str(d_rdy_dec),
        .in_p_ok(p_ok_dec),
        .in_l_b(l_b_dec),
        .out_4bits_A(out_4bits_A_test),
        .out_4bits_B(out_4bits_B_test),
        .out_4bits_C(out_4bits_C_test),
        .out_4bits_D(out_4bits_D_test),
        .out_8bits_A(out_8bits_A_test),
        .out_16bits_A(out_16bits_A_test),
        .out_16bits_B(out_16bits_B_test),
        .out_16bits_C(out_16bits_C_test),
        .out_str(out_str_test),
        .out_p_ok(out_p_ok_test),
        .out_l_b(out_l_b_test),     
        .out_force_state(out_force_state_test),
        .A_BIST_DIN(A_BIST_DIN_test),
        .A_BIST_ADDR(A_BIST_ADDR_test),
        .A_BIST_MEN(A_BIST_MEN_test),
        .A_BIST_WEN(A_BIST_WEN_test),
        .A_BIST_REN(A_BIST_REN_test),        
        .sram_dout_len(sram_dout_len_test)

    );
    
    
    //--------------------------------------------------------------------
    // digital_block_04 instance
    //--------------------------------------------------------------------
    
    digital_block_04 u_digital_block_04 (
      .clk(clk),
      .en(en_div),
      .rst_n(rst_n),
      .rx_in(rx_in),
      .out_4bits_A(out_4bits_A_dec),
      .out_4bits_B(out_4bits_B_dec),
      .out_4bits_C(out_4bits_C_dec),
      .out_4bits_D(out_4bits_D_dec),
      .out_8bits_A(out_8bits_A_dec),
      .out_16bits_A(out_16bits_A_dec),
      .out_16bits_B(out_16bits_B_dec),
      .out_16bits_C(out_16bits_C_dec),
      .d_rdy(d_rdy_dec),
      .p_ok(p_ok_dec),
      .l_b(l_b_dec)
    );
    
    
    //--------------------------------------------------------------------
    // digital_block_08 instance
    //--------------------------------------------------------------------
    
    digital_block_08 u_digital_block_08 (
        .clk(clk),
        .en(en_div),
        .rst_n(rst_n),
        .frame_in(resp_out_fsm[39:0]),        
        .frame_len(resp_length_fsm),
        .frame_in_v(resp_valid_fsm),        
        .crc_cal(crc_cal_fsm),
        .crc_frame(frame_out_crc),
        .crc_done(crc_done_crc),        
        .start_tran(timer_done_timer),        
	.sram_dout(dout_sram),
	.sram_dout_len(sram_dout_len_test),
	.sram_dout_valid(dout_valid_sram),	
	.test_mode(test_mode),	
	.forcing(force_state),
        .state_fsm(state_dbg_fsm),        
        .tx_out(tx_out),
        .enc_done(enc_done_enc)
    );
    
    
    //--------------------------------------------------------------------
    // digital_block_10 instance
    //--------------------------------------------------------------------
    
    digital_block_10 u_digital_block_10 (
        .clk(clk),
        .clk_out(clk_out_div),
        .en(en_div)
    );
    
    
    //--------------------------------------------------------------------
    // digital_block_11 instance
    //--------------------------------------------------------------------
    
    digital_block_11 u_digital_block_11 (
    .clk(clk),
    .en(en_div),
    .rst_n(rst_n),  
    .out_4bits_A(out_4bits_A_test),
    .out_4bits_B(out_4bits_B_test),
    .out_4bits_C(out_4bits_C_test),
    .out_4bits_D(out_4bits_D_test),
    .out_8bits_A(out_8bits_A_test),
    .out_16bits_A(out_16bits_A_test),
    .out_16bits_B(out_16bits_B_test),
    .out_16bits_C(out_16bits_C_test),  
    .str(out_str_test),
    .p_ok(out_p_ok_test), 
    .out_16bits_D(out_16bits_A_ac),
    .out_16bits_E(out_16bits_B_ac),
    .out_8bits_B(out_8bits_A_ac),
    .d_len(d_len_ac),
    .valid(valid_ac),
    .n_me(n_me_ac),
    .load_done(load_done_ac),    
    .resp_out(resp_out_fsm),
    .resp_length(resp_length_fsm),
    .resp_valid(resp_valid_fsm),   
    .state_dbg(state_dbg_fsm),   
    .str_load(str_load_fsm),
    .ac_01(ac_01_fsm),
    .ac_02(ac_02_fsm),
    .cp_01(cp_01_fsm),
    .cp_02(cp_02_fsm),    
    .crc_ok(crc_ok_crc),
    .crc_not_ok(crc_not_ok_crc),
    .crc_check(crc_check_fsm),
    .crc_cal(crc_cal_fsm),   
    .A_MEN(A_MEN_fsm),
    .A_WEN(A_WEN_fsm),
    .A_REN(A_REN_fsm),
    .A_DIN(A_DIN_fsm),
    .A_ADDR(A_ADDR_fsm),
    .A_DOUT(dout_sram),
    .A_DOUT_V(dout_valid_sram),    
    .force_state(out_force_state_test)
  );
    
    
    //--------------------------------------------------------------------
    // digital_block_14 instance
    //--------------------------------------------------------------------
    
    digital_block_14 u_digital_block_14 (
        .A_CLK  (clk),
        .en     (en_div),
        .rst_n  (rst_n),       
        .A_MEN  (A_MEN_fsm),
        .A_WEN  (A_WEN_fsm),
        .A_REN  (A_REN_fsm),
        .A_ADDR (A_ADDR_fsm),
        .A_DIN  (A_DIN_fsm),        
        .A_BIST_EN(test_mode),        
        .A_BIST_MEN(A_BIST_MEN_test),
        .A_BIST_WEN(A_BIST_WEN_test),
        .A_BIST_REN(A_BIST_REN_test),
        .A_BIST_ADDR(A_BIST_ADDR_test),
        .A_BIST_DIN(A_BIST_DIN_test),        
        .dout (dout_sram),
        .dout_valid(dout_valid_sram)
    );
    
    
    //--------------------------------------------------------------------
    // digital_block_01 instance
    //--------------------------------------------------------------------
    
    digital_block_01 u_digital_block_01 (
        .clk(clk),
        .en(en_div),
        .rst_n(rst_n),       
        .ce(ce_ac),
        .page_addr(page_addr_ac),        
        .din(dout_rom),
        .din_valid(dout_valid_rom),       
        .start(str_load_fsm),
        .ac_01(ac_01_fsm),
        .ac_02(ac_02_fsm),
        .cp_01(cp_01_fsm),
        .cp_02(cp_02_fsm),        
        .in_4bits_A(out_4bits_B_test),
        .in_4bits_B(out_4bits_D_test),
        .in_16bits_A(out_16bits_A_test),
        .in_16bits_B(out_16bits_B_test),        
        .load_done(load_done_ac),        
        .out_8bits_A(out_8bits_A_ac),
        .out_16bits_A(out_16bits_A_ac),
        .out_16bits_B(out_16bits_B_ac),
        .d_len(d_len_ac),
        .valid(valid_ac),
        .n_me(n_me_ac)
    );
    
    //--------------------------------------------------------------------
    // digital_block_13 instance
    //--------------------------------------------------------------------
    
    digital_block_13 u_digital_block_13 (
        .clk        (clk),
        .en         (en_div),
        .rst_n      (rst_n),        
        .ce         (ce_ac),
        .blk_addr   (page_addr_ac),
        .dout       (dout_rom),
        .dout_valid (dout_valid_rom)
    );
    
    
    //--------------------------------------------------------------------
    // digital_block_16 instance
    //--------------------------------------------------------------------
    
    digital_block_16 u_digital_block_16 (
        .clk(clk),
        .en(en_div),
        .rst_n(rst_n),
        .start(out_str_test),
        .last_bit(out_l_b_test),
        .enc_done(enc_done_enc),
        .timer_done(timer_done_timer)
    );
    
    //--------------------------------------------------------------------
    // digital_block_03 instance
    //--------------------------------------------------------------------
    
    digital_block_03 u_digital_block_03 (
        .clk(clk),
        .en(en_div),
        .rst_n(rst_n),
        .start(resp_valid_fsm),
        .calc(crc_cal_fsm),
        .check(crc_check_fsm),
        .frame_in(resp_out_fsm),
        .data_len(resp_length_fsm[6:3]),       
        .frame_out(frame_out_crc),
        .crc_ok(crc_ok_crc),
        .crc_not_ok(crc_not_ok_crc),
        .crc_done(crc_done_crc)
    );
    
    assign state_dbg = state_dbg_fsm;
    assign clk_out = clk_out_div;

endmodule

