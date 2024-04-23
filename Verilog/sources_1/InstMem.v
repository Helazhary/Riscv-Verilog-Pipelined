`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:50:45 PM
// Design Name: 
// Module Name: InstMem
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

module InstMem (input [5:0] addr, output [31:0] data_out);
    reg [31:0] mem [0:63];

    initial begin

// # Load operations
mem[0] = 32'b00000000000000000010111000110111; // LUI x28, 2
mem[1] = 32'b00000000000000000010111000010111; // AUIPC x28, 2
mem[2] = 32'b00000000000000000010000010000011; // LW x1, 0(x0)
mem[3] = 32'b00000000000000000001000100000011; // LH x2, 4(x0)
mem[4] = 32'b00000000000000000000000110000011; // LB x3, 0(x0)
mem[5] = 32'b00000000000000000100001000000011; // LBU x4, 0(x0)
mem[6] = 32'b00000000000000000101001010000011; // LHU x5, 0(x0)

//Arithmetic operations
mem[7] = 32'b00000000001000001000001100110011; // ADD x6, x1, x2
mem[8] = 32'b01000000001000001000001110110011; // SUB x7, x1, x2
mem[9] = 32'b00000000001000001100010000110011; // XOR x8, x1, x2
mem[10] = 32'b00000000001000001110010010110011; // OR x9, x1, x2
mem[11] = 32'b00000000001000001111010100110011; // AND x10, x1, x2

// # Immediate operations
mem[12] = 32'b00000000010000001000010110010011; // ADDI x11, x1, 4
mem[13] = 32'b00000000010000001100011000010011; // XORI x12, x1, 4
mem[14] = 32'b00000000010000001110011010010011; // ORI x13, x1, 4
mem[15] = 32'b00000000010000001111011100010011; // ANDI x14, x1, 4
mem[16] = 32'b00000000010000001010011110010011; // SLTI x15, x1, 4
mem[17] = 32'b00000000010000001011100000010011; // SLTIU x16, x1, 4

// Shift operations
mem[18] = 32'b00000000001000001101100010110011; // SRL x17, x1, x2
mem[19] = 32'b01000000001000001101100100110011; // SRA x18, x1, x2
mem[20] = 32'b01000000000100001101100110010011; // SRAI x19, x1, 1
mem[21] = 32'b00000000001000001001101000110011; // SLL x20, x1, x2
mem[22] = 32'b00000000000100001001101010010011; // SLLI x21, x1, 1
mem[23] = 32'b00000000000100001101101100010011; // SRLI x22, x1, 1

// # Set less than operations
mem[24] = 32'b00000000001000001010101110110011; // SLT x23, x1, x2
mem[25] = 32'b00000000001000001011110000110011; // SLTU x24, x1, x2

// # Store operations
mem[26] = 32'b00000000000100000010000000100011; // SW x1, 0(x0)
mem[27] = 32'b00000000000100000000000000100011; // SB x1, 0(x0)
mem[28] = 32'b00000000000100000001000000100011; // SH x1, 0(x0)

// # Branch operations
mem[29] = 32'b00000000000000000000001001100011; // BEQ x0, x0, 4
mem[30] = 32'b00000000000111111000111110010011; //increment x31
mem[31] = 32'b00000000001000001001001001100011; // BNE x1, x2, 4
mem[32] = 32'b00000000000111111000111110010011; //increment x31
mem[33] = 32'b00000000010000011100001001100011; // BLT x3, x4, 4
mem[34] = 32'b00000000000111111000111110010011; //increment x31
mem[35] = 32'b00000000011000101101001001100011; // BGE x5, x6, 4
mem[36] = 32'b00000000000111111000111110010011; //increment x31
mem[37] = 32'b00000000100000111110001001100011; // BLTU x7, x8, 4
mem[38] = 32'b00000000000111111000111110010011; //increment x31
mem[39] = 32'b00000000101001001111001001100011; // BGEU x9, x10, 4
mem[40] = 32'b00000000000111111000111110010011; //increment x31

// # Jump operations
mem[41] = 32'b00000000010000000000111011101111; // JAL x29, 4
mem[42] = 32'b00000000000000000000111101100111; // JALR x30, 0(x0)

// # Fence operation,Environment call and break
mem[43] = 32'b00001111111100000000000000001111; // FENCE
mem[44] = 32'b00000000000100000000000001110011; // EBREAK
mem[45] = 32'b00000000000000000000000001110011; // ECALL



































// mem[0] = 32'b00000000000100000000111110010011; 
// mem[1] = 32'b00000000001000000000111100010011; 
// mem[2] = 32'b00000000000100000000000001110011; 
// mem[3] = 32'b00001111111100000000000000001111; 
// mem[4] = 32'b00000000000000000010000010000011; 
// mem[5] = 32'b00000000010000000001000100000011; 
// mem[6] = 32'b00000000100000000000000100000011; 
// mem[7] = 32'b00000000110000000100001000000011; 
// mem[8] = 32'b00000001000000000101001010000011; 
// mem[9] = 32'b00000000000000000010111000110111;
// mem[10] = 32'b00000000000000000010111000010111;
// mem[11] = 32'b00000000001000001000001100110011;
// mem[12] = 32'b01000000001000001000001110110011;
// mem[13] = 32'b00000000001000001100010000110011;
// mem[14] = 32'b00000000001000001110010010110011;
// mem[15] = 32'b00000000001000001111010100110011;
// mem[16] = 32'b00000000010000001000010110010011;
// mem[17] = 32'b00000000010000001100011000010011;
// mem[18] = 32'b00000000010000001110011010010011;
// mem[19] = 32'b00000000010000001111011100010011;
// mem[20] = 32'b00000001111100001101000010110011;
// mem[21] = 32'b01000001111100001101000010110011;
// mem[22] = 32'b01000000000100001101000010010011;
// mem[23] = 32'b00000001111100001001000010110011;
// mem[24] = 32'b00000000000100001001000010010011;
// mem[25] = 32'b00000000000100001101000010010011;
// mem[26] = 32'b00000000010000001010000010010011;
// mem[27] = 32'b00000000010000001011000100010011;
// mem[28] = 32'b00000000000000000000001001100011;
// mem[29] = 32'b11111111111100001000000010010011;
// mem[30] = 32'b00000000000100001000000010010011;
// mem[31] = 32'b00000000000100000010000000100011;
// mem[32] = 32'b00000000000100000000001000100011;
// mem[33] = 32'b00000000000100000001010000100011;
// mem[34] = 32'b00000001111011111001001001100011;
// mem[35] = 32'b11111111111100001000000010010011;
// mem[36] = 32'b00000000000100001000000010010011;
// mem[37] = 32'b00000001111011111100001001100011;
// mem[38] = 32'b11111111111100001000000010010011;
// mem[39] = 32'b00000000000100001000000010010011;
// mem[40] = 32'b00000001111011111101001001100011;
// mem[41] = 32'b11111111111100001000000010010011;
// mem[42] = 32'b00000000000100001000000010010011;
// mem[43] = 32'b00000001111011111110001001100011;
// mem[44] = 32'b11111111111100001000000010010011;
// mem[45] = 32'b00000000000100001000000010010011;
// mem[46] = 32'b00000001111011111111001001100011;
// mem[47] = 32'b11111111111100001000000010010011;
// mem[48] = 32'b00000000000100001000000010010011;
// mem[49] = 32'b00000001111011111111001001100011;
// mem[50] = 32'b00000000010000000000111011101111;
// mem[51] = 32'b11111111111100001000000010010011;
// mem[52] = 32'b00000000000100001000000010010011;
// mem[53] = 32'b00000000000000000000111011100111;

/*
ADDI x31 x0 1 
ADDI x30 x0 2
//for incrementing or shifting by 1 or comparing
//ECALL
EBREAK
FENCE

LW x1 0(x0)
LH x2 4(x0)
LB x3 8(x0)
LBU x4 12(x0)
LHU x5 16(x0)
LUI x28 2
AUIPC x28 2



ADD x6 x1 x2
SUB x7 x1 x2
XOR x8 x1 x2
OR x9 x1 x2
AND x10 x1 x2


ADDI x11 x1 4
XORI x12 x1 4
ORI x13 x1 4
ANDI x14 x1 4

SRL x1 x1 x31
SRA x1 x1 x31
SRAI x1 x1 1
SLL x1 x1 x31

SLLI x1 x1 1
SRLI x1 x1 1

SLTI x1 x1 4
SLTIU x2 x1 4




BEQ x0 x0 4
ADDI x1 x1 -1
ADDI x1 x1 1

SW x1 0(x0)
SB x1 4(x0)
SH x1 8(x0)

BNE x31 x30 4
ADDI x1 x1 -1
ADDI x1 x1 1

BLT x31 x30 4
ADDI x1 x1 -1
ADDI x1 x1 1

BGE x31 x30 4
ADDI x1 x1 -1
ADDI x1 x1 1


BLTU x31 x30 4
ADDI x1 x1 -1
ADDI x1 x1 1


BGEU x31 x30 4
ADDI x1 x1 -1
ADDI x1 x1 1

JAL x29 4
ADDI x1 x1 -1
ADDI x1 x1 1

JALR X29 0(x0)

*/
























// //simple no hazards  test
// mem[0] = 32'b00000000000111111000111110010011; //increment x31
// mem[1] = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
// mem[2] = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
// mem[3] = 32'b000000000010_00000_000_00011_0000011; // lb x3, 2(x0)
// mem[4] = 32'b00000000000111111000111110010011; //increment x31
// mem[5] = 32'b00000000000111111000111110010011; //increment x31
// mem[6] = 32'b0000000_01010_00011_000_00101_0010011; // addi x5, x3, 10  
// mem[7] = 32'b0000000_00010_00001_110_00100_0110011; // or x4, x1, x2

// //simple hazard and forwarding test
// mem[0] = 32'b00000000000111111000111110010011; //increment x31
// mem[1] = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
// mem[2] = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
// mem[3] = 32'b000000000010_00000_000_00011_0000011; // lb x3, 2(x0)
// mem[4] = 32'b00000000001100010000001000110011; // add x4, x2, x3
// mem[5] = 32'b00000000001100100000001010110011; // add x5, x4, x3

//mem[0]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0//added to be skipped since PC starts with 4 after reset 
//mem[1] = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
//mem[2] = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
//mem[3] = 32'b000000000010_00000_000_00011_0000011; // lb x3, 2(x0)
//mem[4]=32'b0000000_00010_00001_110_00100_0110011 ; //or x4, x1, x2 
//mem[5]=32'b0000000_00010_00001_000_00011_0110011 ; //add x3, x1, x2 
//mem[6]=32'b0000000_00010_00011_000_00101_0110011 ; //add x5, x3, x2 
//mem[7]=32'b0000000_00101_00000_010_01100_0100011; //sw x5, 12(x0) 
//mem[8]=32'b000000001100_00000_010_00110_0000011 ; //lw x6, 12(x0)
//mem[9]=32'b0000000_00001_00110_111_00111_0110011 ; //and x7, x6, x1 
//mem[10]=32'b0100000_00010_00001_000_01000_0110011 ; //sub x8, x1, x2 
//mem[11]=32'b0000000_00010_00001_000_00000_0110011 ; //add x0, x1, x2 
//mem[12]=32'b0000000_00001_00000_000_01001_0110011 ; //add x9, x0, x1



//              mem[0] = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
//              mem[1] = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
//              mem[2] = 32'b000000000010_00000_000_00011_0000011; // lb x3, 2(x0)
        
//        mem[3]=32'b0000000_01010_00011_000_00101_0010011; // addi x5, x3, 10     //test addi
////        mem[3] = 32'b0000000_00010_00001_110_00100_0110011; // or x4, x1, x2        
//        mem[4] = 32'b0_000000_00011_00100_000_0100_0_1100011; // beq x4, x3, 4
//        mem[5] = 32'b0000000_00010_00001_000_00011_0110011; // add x3, x1, x2
//        mem[6] = 32'b0000000_00010_00011_000_00101_0110011; // add x5, x3, x2
//        mem[7] = 32'b0000000_00101_00000_010_01100_0100011; // sw x5, 12(x0)
//        mem[8] = 32'b000000001100_00000_010_00110_0000011; // lw x6, 12(x0)
//        mem[9] = 32'b0000000_00001_00110_111_00111_0110011; // and x7, x6, x1
//        mem[10] = 32'b0100000_00010_00001_000_01000_0110011; // sub x8, x1, x2
//        mem[11] = 32'b0000000_00010_00001_000_00000_0110011; // add x0, x1, x2
//        mem[12] = 32'b0000000_00001_00000_000_01001_0110011; // add x9, x0, x1












// mem[0]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0//added to be skipped since PC starts with 4 after reset 
// mem[1]=32'b000000000000_00000_010_00001_0000011 ; //lw x1, 0(x0) 
// mem[2]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[3]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[4]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[5]=32'b000000000100_00000_010_00010_0000011 ; //lw x2, 4(x0) 
// mem[6]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[7]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[8]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[9]=32'b000000001000_00000_010_00011_0000011 ; //lw x3, 8(x0) 
// mem[10]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[11]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[12]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[13]=32'b0000000_00010_00001_110_00100_0110011 ; //or x4, x1, x2 
// mem[14]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[15]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[16]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[17]=32'b0_000001_00011_00100_000_0000_0_1100011; //beq x4, x3, 16 
// mem[18]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[19]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[20]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[21]=32'b0000000_00010_00001_000_00011_0110011 ; //add x3, x1, x2 
// mem[22]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[23]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[24]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[25]=32'b0000000_00010_00011_000_00101_0110011 ; //add x5, x3, x2 
// mem[26]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[27]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[28]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0
// mem[29]=32'b0000000_00101_00000_010_01100_0100011; //sw x5, 12(x0) 
// mem[30]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[31]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[32]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[33]=32'b000000001100_00000_010_00110_0000011 ; //lw x6, 12(x0)
// mem[34]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[35]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[36]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[37]=32'b0000000_00001_00110_111_00111_0110011 ; //and x7, x6, x1 
// mem[38]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[39]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[40]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[41]=32'b0100000_00010_00001_000_01000_0110011 ; //sub x8, x1, x2 
// mem[42]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[43]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[44]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[45]=32'b0000000_00010_00001_000_00000_0110011 ; //add x0, x1, x2 
// mem[46]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[47]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[48]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[49]=32'b0000000_00001_00000_000_01001_0110011 ; //add x9, x0, x1





    //    mem[0] = 32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
    //    mem[1] = 32'b000000000100_00000_010_00010_0000011; // lw x2, 4(x0)
    //    mem[2] = 32'b000000001000_00000_010_00011_0000011; // lw x3, 8(x0)
        
    //          mem[0] = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
    //          mem[1] = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
    //          mem[2] = 32'b000000000010_00000_000_00011_0000011; // lb x3, 2(x0)
        
    //    mem[3]=32'b0000000_01010_00011_000_00101_0010011; // addi x5, x3, 10     //test addi
    //    mem[3] = 32'b0000000_00010_00001_110_00100_0110011; // or x4, x1, x2        
    //    mem[4] = 32'b0_000000_00011_00100_000_0100_0_1100011; // beq x4, x3, 4
    //    mem[5] = 32'b0000000_00010_00001_000_00011_0110011; // add x3, x1, x2
    //    mem[6] = 32'b0000000_00010_00011_000_00101_0110011; // add x5, x3, x2
    //    mem[7] = 32'b0000000_00101_00000_010_01100_0100011; // sw x5, 12(x0)
    //    mem[8] = 32'b000000001100_00000_010_00110_0000011; // lw x6, 12(x0)
    //    mem[9] = 32'b0000000_00001_00110_111_00111_0110011; // and x7, x6, x1
    //    mem[10] = 32'b0100000_00010_00001_000_01000_0110011; // sub x8, x1, x2
    //    mem[11] = 32'b0000000_00010_00001_000_00000_0110011; // add x0, x1, x2
    //    mem[12] = 32'b0000000_00001_00000_000_01001_0110011; // add x9, x0, x1


//////mem[0] = 32'b000000000000_00000_000_00001_0000011; // lb x1, 0(x0)
//////mem[1] = 32'b000000000001_00000_000_00010_0000011; // lb x2, 1(x0)
//mem[2]=32'b00000000001000001000000110110011;   //    add x3, x1, x2       # x3 = x1 + x2
//////mem[2]=32'b00000000100000000000000111101111;// jal x3,8
//////mem[3]=32'b01000000001000001000001000110011;   //    sub x4, x1, x2       # x4 = x1 - x2
//////mem[4]=32'b00000000001000001001001010110011;    //    sll x5, x1, x2       # x5 = x1 << x2
//////mem[5]=32'b00000000001000001101001100110011;     //    srl x6, x1, x2       # x6 = x1 >> x2
//mem[6]=32'b01000000001000001101001110110011;  //    sra x7, x1, x2       # x7 = x1 >> x2 (arithmetic)
//////mem[6]=32'b00000001011000001000011011100111; //jalr x13, 22(x1)
//////mem[7]=32'b00000000001000001111010000110011;   //    and x8, x1, x2       # x8 = x1 & x2
//////mem[8]=32'b00000000001000001110010010110011;   //    or x9, x1, x2        # x9 = x1 | x2
//////mem[9]=32'b00000000001000001100010100110011 ;  //    xor x10, x1, x2      # x10 = x1 ^ x2
//////mem[10]=32'b00000000001000001010010110110011;  //    slt x11, x1, x2      # x11 = (x1 < x2)
//////mem[11]=32'b00000000001000001011011000110011;  //    sltu x12, x1, x2     # x12 = (x1 < x2) (unsigned)

//mem[2] = 32'b00000000101100001000000110010011; // addi x3, x1, 11       # x3 = x1 + 11
//mem[3] = 32'b01000000001000001000001000110011; // subi x4, x1, 11       # x4 = x1 - 11
//mem[4] = 32'b00000000001000001001001010010011; // slli x5, x1, 2        # x5 = x1 << 2
//mem[5] = 32'b00000000001000001101001100010011; // srli x6, x1, 2        # x6 = x1 >> 2
//mem[6] = 32'b01000000001000001101001110010011; // srai x7, x1, 2        # x7 = x1 >> 2 (arithmetic)
//mem[7] = 32'b00000000101100001111010000010011; // andi x8, x1, 11       # x8 = x1 & 11
//mem[8] = 32'b00000000101100001110010010010011; // ori x9, x1, 11        # x9 = x1 | 11
//mem[9] = 32'b00000000101100001100010100010011; // xori x10, x1, 11      # x10 = x1 ^ 11
//mem[10] = 32'b00000000101100001010010110010011; // slti x11, x1, 11      # x11 = (x1 < 11)
//mem[11] = 32'b00000000101100001011011000010011; // sltiu x12, x1, 11     # x12 = (x1 < 11) (unsigned)

//testing lUI and AUIPC
//mem[0] = 32'b00000000000000000010111000110111; //LUI
//mem[1] = 32'b00000000000000000010111000010111; //AUIPC

// //testing system calls
// mem[0] = 32'b00000000000111111000111110010011; //increment x31
// mem[1]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[2]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[3]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[4] = 32'b00000000000111111000111110010011; //increment x31
// mem[5]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[6]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[7]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[8] = 32'b00001111111100000000000000001111; //fence
// mem[9]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[10]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[11]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[12] = 32'b00000000000111111000111110010011; //increment x31
// mem[13]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[14]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[15]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[16] = 32'b00000000000100000000000001110011;//ebreak
// mem[17]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[18]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[19]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[20] = 32'b00000000000111111000111110010011; //increment x31
// mem[21]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[22]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[23]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[24] = 32'b00000000000000000000000001110011; //ecall
// mem[25]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[26]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[27]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
// mem[28] = 32'b00000000000111111000111110010011; //increment x31 (should not be executed)


// //testing branch control unit
// mem[0] = 32'b00000000000111111000111110010011; //increment x31
// mem[1] = 32'b00000001111111110000111100110011; //add x31 to x30 (expect both to == 1)

// // all below branches should skip the inc by 5
// //mem[2] = 32'b00000001111011111000010001100011; //beq x31, x31, 8
// // mem[2] = 32'b00000001110111111001010001100011; ///bne x31, x29, 8 
// // mem[2] = 32'b00000001111111101100010001100011; //blt x29, x31, 8 
// //mem[2] = 32'b00000001110111111101010001100011; //bge x31, x29, 8
// // mem[2] = 32'b00000001111111101110010001100011; //bltu x29, x31, 8
//  mem[2] = 32'b00000001110111111111010001100011; //bgeu x31, x29, 8

// mem[3] = 32'b00000000010111111000111110010011; //increment x31 by 5
// mem[4] = 32'b00000000101011111000111110010011; //increment x31 by 10





    end

    assign data_out = mem[addr];
endmodule
