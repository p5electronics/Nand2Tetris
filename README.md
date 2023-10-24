# VHDL Nand2Tetris
![Doesn't this logo look overkill?](https://github.com/takizala/VHDLNand2Tetris/blob/main/logo.png?raw=true)

A simple VHDL implementation of the Hack Computer architecture from in Noam Nisan's and Shimon Schocken's Nand2teris course.

## Overview
This small summer project was born from my inspiration after taking the Nand2Tetris course during my university's computer organization class. While the course introduced me to pseudo-HDL, I aspired to take things a step further by implementing the modules of the Hack architecture on actual hardware. I want to extend my appreciation to [Michael Schröder's Nand2Tetris FPGA project](https://gitlab.com/x653/nand2tetris-fpga "nand2tetris-fpga") and the [Nand2Tetris course](https://www.nand2tetris.org/ "Nand2Tetris") itself for providing references that guided me through this endeavor :)

## Content + Features
* `src` - contains HDL files for all Nand2Tetris building blocks
* `sim` - contains testbench modules (can turn your logic into .cmp files for verification!)

![Verifiable .cmp files!](https://github.com/takizala/VHDLNand2Tetris/blob/main/Cmp.png?raw=true)

## Future Goals 
Ultimately, my goal is to upload this design onto a Basys-3 FPGA development board and witness it in action on physical hardware. I have tailored this project to operate at a clock speed of 100MHz. Here's the current roadmap to get there:
- [x] Create a program for the Hack assembler to create compatible machine-code
- [ ] Write down some debugging programs to enable physical verification of the Hack CPU
- [ ] Construct entities to add any sort of peripheral access for loading this design on hardware (i.g UART, VGA Display setup)
