`timescale 1ns/1ns


module blowfish_encryption_tb;
/*
                            //outputs
                           output [63 : 0] chiphetText,
                            //inputs
                           input clk,
                           input rst,
                           input [63 : 0] plainText
                            
*/
    

wire [63:0] chiphetText;

reg clk;
reg rst;
reg [63:0] plainText;

//reg [63:0] in;

blowfish_encryption BL_ENCRYPTION(.clk(clk), .rst(rst), .plainText(plainText), .chiphetText(chiphetText));

initial begin
    forever #5 clk = ~clk;
end

initial begin
	$monitor("time=%3d , PlainText = %h , ChiphetText = %h \n" , $time ,plainText , chiphetText);
end

initial begin
    #10;
    rst = 1'b0;
    clk = 1'b0;

    #20;
    rst = 1'b1;
    clk = 1'b1;
    plainText = 64'hF0f0fA322C;
end

initial begin  // Dump waveform for debug 
$dumpvars;
end

endmodule