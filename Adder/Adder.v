`timescale 1ns/100ps

module adder(IN1, IN2, OUT);
    input[31:0] IN1;
    input[31:0] IN2;
    output reg[31:0] OUT;

    always@(*) begin
        #2
        OUT = IN1+IN2;
    end
endmodule

module adder_4(IN1,OUT);
    input [31:0] IN1;
    //input[31:0] IN2;
    output [31:0] OUT;

    assign #1 OUT = IN1 + 32'd4;
    
endmodule


module adder_4_tb;

reg [31:0] IN1;
wire [31:0] OUT;

adder_4   adder(IN1, OUT);

initial begin
    IN1 = 32'd10;
	#10;
	$display("IN1 : %d\tOUT : %d",IN1, OUT);
	IN1 = 32'd128;
	#10;
	$display("IN1 : %d\tOUT : %d",IN1, OUT);
	
end

endmodule