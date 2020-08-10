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

(START)
// reset screen offset
@offset
M=0

// monitor key event
@KBD
D=M
@PAINT
D;JGT

// if not key event; unpaint the screen
(UNPAINT)
@SCREEN
D=A
@offset
D=M+D
A=D
M=0
// increment offset
@offset
M=M+1
// check key event
@KBD
D=M
@UNPAINT
D;JEQ
// jmp to start if key event changed
@START
0;JMP

// if key event; paint the screen
(PAINT)
@SCREEN
D=A
@offset
D=M+D
A=D
M=1
// increment offset
@offset
M=M+1
// check key event
@KBD
D=M
@PAINT
D;JGT
// jmp to start if key event changed
@START
0;JMP
