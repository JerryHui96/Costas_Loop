//Jerry Xu
//Filter Module
module LPF (    input clk, rst, pushADC,
                input signed [25:0] data,
                output signed [31:0] out
);

reg signed [25:0] in [0:42];
wire signed [8:0] coef [0:22];
wire signed [34:0] prod [0:42];
wire signed [34:0] p1 [0:5];
wire signed [34:0] p2;
reg signed [31:0] result;

assign out = result;


assign coef [0] = 2;
assign coef [1] = 4;
assign coef [2] = 4;
assign coef [3] = 2;
assign coef [4] = -3;
assign coef [5] = -10;
assign coef [6] = -14;
assign coef [7] = -14;
assign coef [8] = -6;
assign coef [9] = 7;
assign coef [10] = 19;
assign coef [11] = 22;
assign coef [12] = 12;
assign coef [13] = -11;
assign coef [14] = -36;
assign coef [15] = -48;
assign coef [16] = -35;
assign coef [17] = 11;
assign coef [18] = 83;
assign coef [19] = 161;
assign coef [20] = 221;
assign coef [21] = 244;

assign prod [0]  = coef[0]   *   in[0];
assign prod [1]  = coef[1]   *   in[1];
assign prod [2]  = coef[2]   *   in[2];
assign prod [3]  = coef[3]   *   in[3];
assign prod [4]  = coef[4]   *   in[4];
assign prod [5]  = coef[5]   *   in[5];
assign prod [6]  = coef[6]   *   in[6];
assign prod [7]  = coef[7]   *   in[7];
assign prod [8]  = coef[8]   *   in[8];
assign prod [9]  = coef[9]   *   in[9];
assign prod [10] = coef[10]  *   in[10];
assign prod [11] = coef[11]  *   in[11];
assign prod [12] = coef[12]  *   in[12];
assign prod [13] = coef[13]  *   in[13];
assign prod [14] = coef[14]  *   in[14];
assign prod [15] = coef[15]  *   in[15];
assign prod [16] = coef[16]  *   in[16];
assign prod [17] = coef[17]  *   in[17];
assign prod [18] = coef[18]  *   in[18];
assign prod [19] = coef[19]  *   in[19];
assign prod [20] = coef[20]  *   in[20];
assign prod [21] = coef[21]  *   in[21];
assign prod [22] = coef[20]  *   in[22];
assign prod [23] = coef[19]  *   in[23];
assign prod [24] = coef[18]  *   in[24];
assign prod [25] = coef[17]  *   in[25];
assign prod [26] = coef[16]  *   in[26];
assign prod [27] = coef[15]  *   in[27];
assign prod [28] = coef[14]  *   in[28];
assign prod [29] = coef[13]  *   in[29];
assign prod [30] = coef[12]  *   in[30];
assign prod [31] = coef[11]  *   in[31];
assign prod [32] = coef[10]  *   in[32];
assign prod [33] = coef[9]   *   in[33];
assign prod [34] = coef[8]   *   in[34];
assign prod [35] = coef[7]   *   in[35];
assign prod [36] = coef[6]   *   in[36];
assign prod [37] = coef[5]   *   in[37];
assign prod [38] = coef[4]   *   in[38];
assign prod [39] = coef[3]   *   in[39];
assign prod [40] = coef[2]   *   in[40];
assign prod [41] = coef[1]   *   in[41];
assign prod [42] = coef[0]   *   in[42];

assign p1 [0] = ((prod [0]  + prod [1] ) + (prod [2]  + prod [3] )) + ((prod [4]  + prod [5])  + (prod [6]  + prod [7]));
assign p1 [1] = ((prod [8]  + prod [9] ) + (prod [10] + prod [11])) + ((prod [12] + prod [13]) + (prod [14] + prod [15]));
assign p1 [2] = ((prod [16] + prod [17]) + (prod [18] + prod [19])) + ((prod [20] + prod [21]) + (prod [22] + prod [23]));
assign p1 [3] = ((prod [24] + prod [25]) + (prod [26] + prod [27])) + ((prod [28] + prod [29]) + (prod [30] + prod [31]));
assign p1 [4] = ((prod [32] + prod [33]) + (prod [34] + prod [35])) + ((prod [36] + prod [37]) + (prod [38] + prod [39]));    
assign p1 [5] = ( prod [40] + prod [41]) +  prod [42];

assign p2 = (p1 [0] + p1 [1]) + (p1 [2] + p1 [3]) + (p1 [4] + p1 [5]);

integer i, j, k;
always @ (posedge clk) begin
    if(rst) begin
        for (i = 0; i < 43; i = i + 1) begin
            in[i] <= 0;
        end
        result <= 0;
    end
    else begin
        if (pushADC) begin
            result <= p2[34:3];
            in [0]  <= data;
            in [1]  <= in [0];
            in [2]  <= in [1];
            in [3]  <= in [2];
            in [4]  <= in [3];
            in [5]  <= in [4];
            in [6]  <= in [5];
            in [7]  <= in [6];
            in [8]  <= in [7];
            in [9]  <= in [8];
            in [10] <= in [9];
            in [11] <= in [10];
            in [12] <= in [11];
            in [13] <= in [12];
            in [14] <= in [13];
            in [15] <= in [14];
            in [16] <= in [15];
            in [17] <= in [16];
            in [18] <= in [17];
            in [19] <= in [18];
            in [20] <= in [19];
            in [21] <= in [20];
            in [22] <= in [21];
            in [23] <= in [22];
            in [24] <= in [23];
            in [25] <= in [24];
            in [26] <= in [25];
            in [27] <= in [26];
            in [28] <= in [27];
            in [29] <= in [28];
            in [30] <= in [29];
            in [31] <= in [30];
            in [32] <= in [31];
            in [33] <= in [32];
            in [34] <= in [33];
            in [35] <= in [34];
            in [36] <= in [35];
            in [37] <= in [36];
            in [38] <= in [37];
            in [39] <= in [38];
            in [40] <= in [39];
            in [41] <= in [40];
            in [42] <= in [41];
        end
    end
end

endmodule