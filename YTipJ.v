// Structural Function: 2x4 positive output, negative enable decoder
// Boolean Function: F = (AB' + A'B)(C + D')
// Simplified SOP: Σm(5,6,7,8,10,11)
// Dataflow Modeling (Structural)

`timescale 1ns/1ps

// 2x4 positive output, negative enable decoder
module dec2x4 (EN, in, out);
      input [1:0] in;
      input EN;
      output reg [3:0] out;

      always@(in or EN)
            case({EN, in})
                  3'b000: out = 4'b1000;
                  3'b001: out = 4'b0100;
                  3'b010: out = 4'b0010;
                  3'b011: out = 4'b0001;
                  default: out = 4'b0000;
            endcase

endmodule

module main(F, A, B, C, D);
      input A, B, C, D;
      output F;
      assign en = 1'b0; // if en = 0, then the main decoder is enabled; if 1, disabled

      // main decoder
      wire [3:0] w;
      dec2x4 G1(en, {A, B}, w); // (EN, in, out)

      // decoder 1
      wire [3:0] d1;
      dec2x4 G2(w[0], {C, D}, d1); // (EN, in, out)

      // decoder 2
      wire [3:0] d2;
      dec2x4 G3(w[1], {C, D}, d2); // (EN, in, out)

      // decoder 3
      wire [3:0] d3;
      dec2x4 G4(w[2], {C, D}, d3); // (EN, in, out)

      // decoder 4
      wire [3:0] d4;
      dec2x4 G5(w[3], {C, D}, d4); // (EN, in, out)

      // Simplified SOP: Σm(5,6,7,8,10,11)
      assign F = d2[1] | d2[2] | d2[3] | d3[0] | d3[2] | d3[3];


endmodule