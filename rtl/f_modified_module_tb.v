`timescale 1ns/1ns


module f_modified_module_tb;

wire [31 : 0] FxL;

reg clk;
reg rst;
reg [31:0] in;

f_module F_MODULE(.clk(clk), .rst(rst), .in(in), .FxL(FxL));

initial begin
    forever #5 clk = ~clk;
end

initial begin
	$monitor("time=%3d , In = %h , Reset = %b , FxL = %h \n" , $time ,in , rst, rst, FxL);
end

initial begin
    #10;
    rst = 1'b0;
    clk = 1'b0;

    #20;
    rst = 1'b1;
    clk = 1'b1;
    in = 32'hFFAA;
end
endmodule