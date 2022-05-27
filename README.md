# Accelerator-Based-Video-Display
Verilog Source code that draws a shape onto a VGA monitor using an accelerometer

## Files
#### top.v
The version of main.c in c program. Declaration of wires and regs that are used in the instantiation of modules. Implementation of drawing initials JG onto a VGA monitor using an accelerometer values.

#### BCDconvert.v :
A combinational logic block inputs a 10-bit 2’s complement number and outputs 3 BCD digits (7 segments for each).

#### mod4tb.v :
A copy of top.v without the instantiations of other modules except for the rom (ram.v) module. This module is used by the testbench.

#### ram.v :
A rom that stores the shape of my initials JG.

#### seg7.v :
Combinational 7-segment display driver module seg7.v in verilog that inputs a 4-bit signal and drives 7 outputs that correspond to 0–9, A–F.

#### smoothFilter.v :
Filter that stops the accelerometer's output to jump around in an unstable manner. 

#### spi_control.v :
Module that setsup SPI comunication. This module wa written by someone else.

#### spi_serdes.v :
Module that performs the read and write of data of the SPI protocal. This module wa written by someon else.

#### testbench.v :
Hardcoded values from the accelerometer and vga controllers that would test interesting features in the code. Tested when the box is in the center and at the top boundary. Simulation waveform in ModelSim is used to confirm correct operation. 
