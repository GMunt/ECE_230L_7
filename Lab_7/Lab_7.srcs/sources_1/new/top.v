module top(
    input[15:0] sw,
    input btnL,
    input btnU, 
    input btnD, 
    input btnR,
    input btnC,
    output[15:0] led
    );
    
    wire [4:0] muxSel;
    wire [3:0] sendOut; 
    
    assign muxSel[0] = btnL;
    assign muxSel[1] = btnU;
    assign muxSel[2] = btnD;
    assign muxSel[3] = btnR;
    assign muxSel[4] = btnC;
    
    simple_4_mux send (
        .Sel(muxSel[1:0]),
        .A(sw[3:0]),
        .B(sw[7:4]),
        .C(sw[11:8]),
        .D(sw[15:12]),
        .Enable(muxSel[4]),
        .Y(sendOut) 
    );
    
    demux receive (
        .In(sendOut),
        .Sel(muxSel[3:2]),
        .Enable(muxSel[4]),
        .Y0(led[3:0]),   // Library
        .Y1(led[7:4]),   // Firedepo
        .Y2(led[11:8]),  // School
        .Y3(led[15:12]) // Rib shack
    );
    
endmodule
