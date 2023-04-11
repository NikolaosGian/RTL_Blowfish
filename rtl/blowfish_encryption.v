`timescale 1ns/1ns


module blowfish_encryption(//outputs
                           output [63 : 0] chiphetText,
                            //inputs
                           input clk,
                           input rst,
                           input [63 : 0] plainText
                            );

    
reg [31:0] P[17:0];
reg[31 : 0] plainTextLeft, plainTextRight;
reg [31:0] inF;
wire [31:0] outF;

reg[63:0] finalOutput;

integer i;

// This reg hold 18 int numbers part of Pi
initial begin
 P[0] = 32'h243f6a88;
 P[1] = 32'h85a308d3;
 P[2] = 32'h13198a2e;
 P[3] = 32'h03707344;
 P[4] = 32'ha4093822;
 P[5] = 32'h299f31d0;
 P[6] = 32'h082efa98;
 P[7] = 32'hec4e6c89;
 P[8] = 32'h452821e6;
 P[9] = 32'h38d01377;
 P[10] = 32'hbe5466cf;
 P[11] = 32'h34e90c6c;
 P[12] = 32'hc0ac29b7;
 P[13] = 32'hc97c50dd;
 P[14] = 32'h3f84d5b5;
 P[15] = 32'hb5470917;
 P[16] = 32'h9216d5d9;
 P[17] = 32'h8979fb1b;
end




f_module F(.clk(clk), .rst(rst), .in(inF), .FxL(outF));

always @(posedge clk or negedge rst) begin // Do calculation
    if(!rst)
        begin
            plainTextLeft <= 32'h0;
            plainTextRight <= 32'h0;
            inF <= 32'h0;
            finalOutput <= 32'h0;
        end
    else
        begin
            plainTextLeft <= plainText[63:31];
            plainTextRight <= plainText[31:0];

            for( i = 0 ; i < 15; i = i +1)begin
                plainTextLeft <= plainTextLeft^P[i];
                inF <= plainTextLeft;
                plainTextRight <= outF^plainTextRight;
                //Swap
                plainTextLeft <= plainTextRight;
                plainTextRight <= plainTextLeft;
            end
            //Undo the last swap
            plainTextLeft <= plainTextRight;
            plainTextRight <= plainTextLeft;

            plainTextRight <= plainTextRight ^ P[17];
            plainTextLeft <= plainTextLeft ^ P[16];
            finalOutput <= {plainTextRight,plainTextLeft};
        end
end


assign chiphetText = finalOutput;

endmodule