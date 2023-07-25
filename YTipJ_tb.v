// Structural Function: 2x4 positive output, negative enable decoder
// Boolean Function: F = (AB' + A'B)(C + D')
// Dataflow Modeling (Structural)

`timescale 1ns/1ps

module dec2x4 (EN, in, out);
      input [1:0] in;
      input EN;
      output [3:0] out;

      always@(W or EN)
            case({EN, w})
                  3'b100: out = 4'b1000;
                  3'b010: out = 4'b0100;
                  3'b001: out = 4'b0010;
                  3'b000: out = 4'b0001;
                  default: out = 4'b0000;
            endcase

endmodule