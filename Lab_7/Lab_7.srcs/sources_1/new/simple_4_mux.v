module simple_4_mux(
    input [1:0] Sel,
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input Enable,
    output [3:0] Y
);
    assign Y = Enable == 1'b1 && Sel == 2'b00 ? A: 
               Enable == 1'b1 && Sel == 2'b01 ? B: 
               Enable == 1'b1 && Sel == 2'b10 ? C: 
               Enable == 1'b1 && Sel == 2'b11 ? D : 0; 

endmodule