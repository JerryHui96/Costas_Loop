// Jerry Xu
// Numerically Controlled Oscillator
module nco (    input clk, rst,
                input signed [31:0] phase,
                output signed [31:0] out 
);

`include "tables.v"

reg signed [31:0] waveform;
assign out = scTable(waveform[31:22]);

always @(posedge clk) begin
    if(rst) begin
        waveform <= 0;
    end
    else begin
        waveform <= waveform + 32'd429496729 / 4 + (phase << 2);
    end
end
endmodule
