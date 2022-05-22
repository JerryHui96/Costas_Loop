// Jerry Xu
// `include "nco.v"
// `include "LPF.v"

module costas_loop(
    input clk, rst, pushADC,
    input signed [9:0] ADC,
    output pushByte,
    output signed [31:0] data_out
);
    
wire signed [25:0] cFilter, sFilter;
wire signed [31:0] cFilter_out, sFilter_out;
wire signed [15:0] cNCO, sNCO;
wire signed [31:0] NCO_in;
wire signed [63:0] temp;

reg [3:0] push;

assign cFilter = ( (cNCO) * (ADC) );    //Pre-filter Multiplier, Cosine, 2.14 x 1.9 = 3.23
assign sFilter = ( (sNCO) * (ADC) );    //Pre-filter Multiplier, Sine,   2.14 x 1.9 = 3.23

assign data_out = cFilter_out >>> 0;

//Filters 
LPF cosFilter ( .clk(clk), .rst(rst), .pushADC(pushADC), .data(cFilter), .out(cFilter_out)); // 3.23 x 9 = 12.23 = 12.20
LPF sinFilter ( .clk(clk), .rst(rst), .pushADC(pushADC), .data(sFilter), .out(sFilter_out)); // 3.23 x 9 = 12.23 = 12.20

assign temp = (cFilter_out) * (sFilter_out) ;  //Post-filter multiplier, 12.4 x 12.4 = 24.8
assign NCO_in = temp[63]? 0: {8'b0, temp[63:40]}; // 24.0
assign pushByte = push[3];

//NCO
nco n1 (    .clk(clk),
            .rst(rst),
            .phase(NCO_in),
            .out({sNCO, cNCO})
);

integer i;
always @(posedge clk) begin
    if(rst) begin
        for(i = 0; i < 4; i = i + 1) push[i] <= 0;
    end
    else begin
        push[0] <= pushADC;
        push[1] <= push[0];
        push[2] <= push[1];
        push[3] <= push[2];
    end
end

endmodule
