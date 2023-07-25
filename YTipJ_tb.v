// Structural Function: 2x4 positive output, negative enable decoder
// Boolean Function: F = (AB' + A'B)(C + D')
// Dataflow Modeling (Structural)

`timescale 1ns/1ps

module struct_tb();
    wire t_F;
    reg [3:0] t_input;
    integer i;

    main dut (t_F,t_input[3],t_input[2],t_input[1],t_input[0]);
    
    initial
        begin
            t_input = 4'b0000;
            for (i = 1; i < 16; i++)
                #50 t_input = i;
        end

    initial
        begin
            $display("Structural Function: 2x4 positive output, negative enable decoder");
            $display("Boolean Function: F = (AB' + A'B)(C + D')");
            $display("Dataflow Modeling (Structural)");
            $monitor("Time = %03d, ABCD = %b, F = %b", $time, t_input, t_F);
            $dumpfile("YTipJ.vcd");
            $dumpvars();
        end
endmodule