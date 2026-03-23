`timescale 1ns / 1ps

//=============================================================
// Testbench: top_module_tb
//=============================================================
module top_module_tb;

    //---------------------------------------------------------
    // Component Declaration (DUT)
    //---------------------------------------------------------
    reg clk = 0;
    reg rst_n = 0;
    reg rx_in = 1;
    reg [3:0] force_state = 4'b0;
    reg test_mode = 0;
    wire tx_out;
    wire clk_out;
    wire [3:0] state_dbg;
    
    //---------------------------------------------------------
    // Instantiate UUT
    //---------------------------------------------------------
    top_module uut (
        .clk(clk),
        .rst_n(rst_n),
        .rx_in(rx_in),
        .force_state(force_state),
        .test_mode(test_mode),
        .tx_out(tx_out),
        .clk_out(clk_out),
        .state_dbg(state_dbg)
    );

    //---------------------------------------------------------
    // Clock generation
    //---------------------------------------------------------
    localparam real CLK_PERIOD = 73.7; // ns => 13.56 MHz
    always #(CLK_PERIOD/2) clk = ~clk;

    //---------------------------------------------------------
    // Timing parameters (for 212 kbps when bitrate_sel="01")
    //---------------------------------------------------------
    integer tb_clks = 128;
    integer tx_clks = 64;
    integer t1_clks = 32;

    //---------------------------------------------------------
    // Task to send a sequence (Z, X, Y)
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
    // Stimulus
    //---------------------------------------------------------
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,top_module_tb);
        // Release reset
        #(2000 * CLK_PERIOD);
        rst_n = 1;
        #(50 * CLK_PERIOD);
      
        #(1236 * CLK_PERIOD);



//        ------------------------------------------------------
//        -- Stimulus process 01
//        ------------------------------------------------------
          send_sequence("S"); // bit 0 (start_comm)
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("E"); // (end_comm)
          
          #(4500 * CLK_PERIOD);

        
//        ------------------------------------------------------
//        -- reset 
//        ------------------------------------------------------          
          
          rst_n = 0;
          #(7 * CLK_PERIOD);
          rst_n = 1;
          
          #(1236 * CLK_PERIOD);
          
//        ------------------------------------------------------
//        -- Stimulus process 10
//        ------------------------------------------------------
          send_sequence("S"); // bit 0 (start_comm)
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("E"); // (end_comm)
          
          #(4500 * CLK_PERIOD);     
          
        
//        ------------------------------------------------------
//        -- Stimulus process 2040
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------93-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 1
          //---------------20-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(4500 * CLK_PERIOD);    


/*        
//        ------------------------------------------------------
//        -- Stimulus process 206088
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------93-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 1
          //---------------30-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------88-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(4500 * CLK_PERIOD);    

*/         
//        ------------------------------------------------------
//        -- Stimulus process 20938811223388AD82
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------20-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 1
          //---------------93-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 0
          //---------------88-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------11-----------------------
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------22-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------33-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------88-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------AD-----------------------
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //---------------82-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(4500 * CLK_PERIOD); 
        
//        ------------------------------------------------------
//        -- Stimulus process 7040
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------70-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //---------------40-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(4500 * CLK_PERIOD);   
 
/*       
//        ------------------------------------------------------
//        -- Stimulus process 70874455667700
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------93-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //---------------87-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 0
          //---------------44-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------55-----------------------
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------66-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------77-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------00-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(4500 * CLK_PERIOD); 
 
*/
//        ------------------------------------------------------
//        -- Stimulus process 7093445566772FE4
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------70-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //---------------93-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------44-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------55-----------------------
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------66-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------77-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------00-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------2F-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //---------------E4-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------   
          
          #(4500 * CLK_PERIOD);   

         
//        ------------------------------------------------------
//        -- Stimulus process 6640AABBCCDDCFDA
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------66-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------40-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //---------------AA-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------BB-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------CC-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------DD-----------------------
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------CF-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 1   
          //---------------DA-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("L"); // bit 0   
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------  
          
          #(8000 * CLK_PERIOD);   
 
          
//        ------------------------------------------------------
//        -- Stimulus process 7740
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------77-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------40-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("L"); // bit 0
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(4500 * CLK_PERIOD);   
         
//        ------------------------------------------------------
//        -- Stimulus process 4400A63F
//        ------------------------------------------------------
          //--------------SOF-----------------------
          send_sequence("S"); // bit 0 (start_comm)
          //---------------44-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------00-----------------------
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //---------------A6-----------------------
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          //-------------parity---------------------
          send_sequence("H"); // bit 0
          //---------------3F-----------------------
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          //-------------parity---------------------
          send_sequence("H"); // bit 1
          //--------------EOF-----------------------
          send_sequence("E"); // (end_comm)
          //----------------------------------------
          
          #(8000 * CLK_PERIOD);    
          
//        ------------------------------------------------------
//        -- Stimulus process 10
//        ------------------------------------------------------
          send_sequence("S"); // bit 0 (start_comm)
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("H"); // bit 1
          send_sequence("L"); // bit 0
          send_sequence("L"); // bit 0
          send_sequence("E"); // (end_comm)
          
          #(4500 * CLK_PERIOD); 
                        
        //-----------------------------------------------------
        // Simulation end
        //-----------------------------------------------------
        $display("Simulation completed");
        #(8000 * CLK_PERIOD);
        $finish;
    end
endmodule
