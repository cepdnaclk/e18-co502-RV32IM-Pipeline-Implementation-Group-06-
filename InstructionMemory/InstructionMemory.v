//timescale directive sets the base time unit and precision for the simulation. In this example, it sets the base time unit to 
//1 nanosecond and the precision to 100 picoseconds. 
`timescale 1ns/100ps

module INSTRUCTION_MEMORY(CLOCK, READ, BLOCK_ADDRESS, READ_INST, BUSYWAIT);

input CLOCK, READ;
input [27:0] ADDRESS;
output reg[127:0] READDATA;
//output reg BUSYWAIT;

reg READACCESS;

// declare memory array of 1024x32 bits
reg [31:0] MEM_ARRAY [1023:0];

//Initialize instruction memory
initial
begin
    //BUSYWAIT = 0;
    READACCESS = 0;

    {MEM_ARRAY[32'd03], MEM_ARRAY[32'd02], MEM_ARRAY[32'd01], MEM_ARRAY[32'd00]} <= 32'b10001111000100001000000010010011;           
    {MEM_ARRAY[32'd07], MEM_ARRAY[32'd06], MEM_ARRAY[32'd05], MEM_ARRAY[32'd04]} <= 32'b00000000000000000000000000000000;           
    {MEM_ARRAY[32'd11], MEM_ARRAY[32'd10], MEM_ARRAY[32'd09], MEM_ARRAY[32'd08]} <= 32'b00000000000000000000000000000000;         
    {MEM_ARRAY[32'd15], MEM_ARRAY[32'd14], MEM_ARRAY[32'd13], MEM_ARRAY[32'd12]} <= 32'b00000000000000001111011000010011;       
    {MEM_ARRAY[32'd19], MEM_ARRAY[32'd18], MEM_ARRAY[32'd17], MEM_ARRAY[32'd16]} <= 32'b00000000000000000000000000000000;       
end 

// DETECTING AN INCOMING MEMORY ACCESS
always @(posedge CLOCK) begin
    if(READACCESS)
    begin
         READDATA[7:0] = #40 MEM_ARRAY[{ADDRESS,4'b0000}];
         READDATA[15:8] = #40 MEM_ARRAY[{ADDRESS,4'b0001}];
         READDATA[23:16] = #40 MEM_ARRAY[{ADDRESS,4'b0010}];
         READDATA[31:24] = #40 MEM_ARRAY[{ADDRESS,4'b0011}];
         READDATA[39:32] = #40 MEM_ARRAY[{ADDRESS,4'b0100}];
         READDATA[47:40] = #40 MEM_ARRAY[{ADDRESS,4'b0101}];
         READDATA[55:48] = #40 MEM_ARRAY[{ADDRESS,4'b0110}];
         READDATA[63:56] = #40 MEM_ARRAY[{ADDRESS,4'b0111}];
         READDATA[71:64] = #40 MEM_ARRAY[{ADDRESS,4'b1000}];
         READDATA[79:72] = #40 MEM_ARRAY[{ADDRESS,4'b1001}];
         READDATA[87:80] = #40 MEM_ARRAY[{ADDRESS,4'b1010}];
         READDATA[95:88] = #40 MEM_ARRAY[{ADDRESS,4'b1011}];
         READDATA[103:96] = #40 MEM_ARRAY[{ADDRESS,4'b1100}];
         READDATA[111:104] = #40 MEM_ARRAY[{ADDRESS,4'b1101}];
         READDATA[119:112] = #40 MEM_ARRAY[{ADDRESS,4'b1110}];
         READDATA[127:120] = #40 MEM_ARRAY[{ADDRESS,4'b1111}];
         //BUSYWAIT = 0;
         READACCESS = 0;
    end
end

endmodule