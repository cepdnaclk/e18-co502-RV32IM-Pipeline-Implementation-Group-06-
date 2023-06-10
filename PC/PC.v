`timescale 1ns/100ps

// Define a module called "PC"
module PC(CLOCK, RESET, NEXTPC, PC, BUSYWAIT);

// Declare inputs and outputs of the module
    input CLOCK, RESET, BUSYWAIT;
    input [31:0] PC;
    output reg [31:0] NEXTPC;

// Initialize the PC to start at address 0 when the reset input is triggered
    always @(RESET) begin
        #1
        if(RESET)  
			NEXTPC = -32'd4;    
    end

 // Update the PC with the next program counter value on the positive edge of the clock signal
    always @(posedge CLOCK) begin
        #1
        if(!BUSYWAIT & !RESET)begin
            NEXTPC=PC; // Update the PC with the value of the next program counter
        end
        
    end

endmodule




