`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 07:30:18 PM
// Design Name: 
// Module Name: Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Memory(input clk, input MemRead, input MemWrite, 
input [2:0] fun3, input [5:0] addr, input [31:0] data_in, output reg [31:0] data_out);

 reg [7:0] mem [0:1023]; //each is 512 bytes
    
    always@(*) begin
        if(!(MemRead || MemWrite)) begin //fetching instruction
            data_out = {mem[(addr*4)+515],mem[(addr*4)+514],mem[(addr*4)+513],mem[(addr*4)+512]};
        end else begin
            if(MemRead)
                case(fun3) // reading  Data
                3'b000:data_out= {{24{mem[addr][7]}}, mem[addr]};      //LB
                3'b001:data_out={{16{mem[addr+1][7]}},mem[addr+1],mem[addr]};      //LH
                3'b010:data_out={mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};      //LW
                3'b100:data_out= {24'b0, mem[addr]};    //LBU
                3'b101:data_out={16'b0, mem[addr+1],mem[addr]};      //LHU
                default:data_out=0;
                endcase
            else data_out = 0; // dont read
        end
    end
    
    
    always@(posedge clk) begin
            if(MemWrite) begin
                case(fun3)
                        3'b000: mem[addr]<=data_in[7:0]; //SB
                        3'b001:   {mem[addr+1],mem[addr]}<=data_in[15:0]; //SH
                        3'b010:   {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]}<=data_in;   //SW
                        default: mem[addr]<=data_in[7:0]; 
                 endcase
              end
                           
           end
           
           
    initial begin 
     {mem[515],mem[514],mem[513],mem[512]} = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
     {mem[519],mem[518],mem[517],mem[516]} = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
     {mem[523],mem[522],mem[521],mem[520]} = 32'b000000000010_00000_000_00011_0000011; // lb x3, 2(x0)
     {mem[527],mem[526],mem[525],mem[524]} = 32'b00000000000111111000111110010011; //increment x31
     {mem[531],mem[530],mem[529],mem[528]} = 32'b00000000000111111000111110010011; //increment x31
     {mem[535],mem[534],mem[533],mem[532]} = 32'b0000000_01010_00011_000_00101_0010011; // addi x5, x3, 10  
     {mem[539],mem[538],mem[537],mem[536]} = 32'b0000000_00010_00001_110_00100_0110011; // or x4, x1, x2

    
//    {mem[515],mem[514],mem[513],mem[512]}=32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
//    {mem[519],mem[518],mem[517],mem[516]}=32'b000000000100_00000_010_00010_0000011; // lw x2, 4(x0)
//    {mem[523],mem[522],mem[521],mem[520]}=32'b000000001000_00000_010_00011_0000011; // lw x3, 8(x0)
//   {mem[527],mem[526],mem[525],mem[524]}=32'b0000000_00010_00011_000_00101_0110011; // add x5, x3, x2=25
//    {mem[531],mem[530],mem[529],mem[528]} = 32'b0000000_00101_00000_010_01100_0100011; // sw x5, 12(x0)
//    {mem[535],mem[534],mem[533],mem[532]}= 32'b000000001100_00000_010_00110_0000011; // lw x6, 12(x0)
//    {mem[539],mem[538],mem[537],mem[536]}= 32'b0000000_00001_00110_111_00111_0110011; // and x7, x6, x1
    
    end
    
    
    initial begin
//    {mem[3],mem[2],mem[1],mem[0]}=32'd11;
//    {mem[7],mem[6],mem[5],mem[4]}=32'd12;
//    {mem[11],mem[10],mem[9],mem[8]}=32'd13;
mem[0]=11;
mem[1]=12;
mem[2]=13;
    end
   
   
endmodule
