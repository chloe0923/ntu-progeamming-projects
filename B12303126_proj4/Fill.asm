// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// R0=SCREEN+8192
@SCREEN
D=A
@8191
D=D+A
@R0
M=D

(LOOP)
@KBD
D=M
@WHITE
D;JEQ
@BLACK
0;JMP

(WHITE)
// for R1=SCREEN to SCREEN+8192
@SCREEN
D=A
@R1
M=D //RAM[R1]=SCREEN
(WLOOP)
//RAM[RAM[R1]]=0
@R1
A=M
M=0
@R1
M=M+1
D=M
@R0
D=D-M // RAM[R1]-RAM[R0]
@WLOOP
D;JLE
@LOOP
0;JMP

(BLACK)
// for R1=SCREEN to SCREEN+8192
@SCREEN
D=A
@R1
M=D //RAM[R1]=SCREEN
(BLOOP)
//RAM[RAM[R1]]=-1
@R1
A=M
M=-1
@R1
M=M+1
D=M
@R0
D=D-M // RAM[R1]-RAM[R0]
@BLOOP
D;JLE
@LOOP
0;JMP
