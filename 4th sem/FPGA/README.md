<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> FPGAHW </h1>
<h3 align="center"> COMP 1718449 - FPGA</h3>
<h5 align="center"> Course Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Winter & Spring  2021) </h5>

<p align="center"> 
  <img src="images/fpga.jpg" alt="OS Lab." height="444px" width="666px">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="list-of-problems"> 📖 List of Homeworks</h2>

<details open="open">
  <summary>List of Homeworks</summary>
  <ol>
    <li><a href="#modules"> ➤ Modules</a></li>
    <li><a href="#hw1"> ➤ Homework 1</a></li>
    <li><a href="#hw2"> ➤ Homework 2</a></li>
    <li><a href="#hw3"> ➤ Homework 3</a></li>
    <li><a href="#hw4"> ➤ Homework 4</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- MODULES -->
<h2 id="modules"> 🧱 Modules</h2>

<p align="justify">

Here are some basic modules I designed.

  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/ALU8">ALU8</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Counter">Counter</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Detector110">Detector110</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Flip-Flop">Flip-Flop</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Flip-Flop2">Flip-Flop2</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Full Adder">Full Adder</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Latch">Latch</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Multiplexer">Multiplexer</a>
  - <a href="https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/Exercises/Shift Register">Shift Register</a>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW1_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 1 -->
<h2 id="hw1"> 🧱 HOMEWORK 1</h2>

<p align="justify">

## Task 1: Designing Digital Circuits - Binary Adders and Counters

In this assignment, the goal is to design digital circuits using different design approaches (Data flow, Gate, or Behavioral). Each module should be accompanied by a corresponding test bench to simulate and validate its functionality. The test benches must cover at least three different input combinations for each module.

### Task 1.1: Design a 1-bit Half Adder

  - Create a 1-bit half adder circuit.

### Task 1.2: Design a 1-bit Full Adder

  - Utilize the 1-bit half adder designed in Task 1.1 to create a 1-bit full adder circuit.

### Task 1.3: Implement a 7-bit Binary Ones Counter

  - Design a 7-bit binary counter that counts the number of '1's in a 7-bit binary number. For example, for the binary number 1010101, the count should be 4.
  - Ports for this module include:
      - A 7-bit input, Data_In, representing the binary number to be counted.
      - A 3-bit output, Data_Out, indicating the count of '1's.

### Task 1.4: Create a 4-bit Adder

  - Build a 4-bit adder using the 1-bit full adder designed in Task 1.2.

### Task 1.5: Develop a 16-bit Adder-Subtractor

  - Using the 1-bit full adder from Task 1.2, design a 16-bit adder-subtractor module.
  - This module should have two 16-bit inputs for numbers to be added or subtracted and a 1-bit control input for specifying addition (1) or subtraction (0).
  - The module performs addition when the control input is set to 1 and subtraction when set to 0.

## Task 2: Designing Decoders - Implementing Various Decoder Sizes

In this assignment, the objective is to design decoders of different sizes using a 2-to-1 decoder as the base component.

### Task 2.1: Design a 1-to-2 Decoder

  - Create a 1-to-2 decoder, which takes one input and produces two outputs based on the input value. When the input is 0, one of the outputs is set to 1, and when the input is 1, the other output is set to 1.

### Task 2.2: Design a 2-to-4 Decoder

  - Design a 2-to-4 decoder using only the module from Task 2.1. This decoder takes two inputs and generates four outputs, with one output active (set to 1) depending on the input combination.

### Task 2.3: Design a 3-to-8 Decoder

  - Create a 3-to-8 decoder by utilizing the modules designed in Tasks 2.1 and 2.2. This decoder takes three inputs and provides eight outputs, with one output being active based on the input configuration.

All decoder modules in these tasks should include an "Enable" input and follow specific input and output port configurations, ensuring proper functionality.

## Task 3: Designing a 32-to-1 Multiplexer

In this assignment, the goal is to design a 32-to-1 multiplexer with a 16-bit input width.

### Task 3.1: Design a 4-to-1 Multiplexer with a 1-bit Input

  - Create a 4-to-1 multiplexer at the gate level with a 1-bit input. This multiplexer should select one of the four inputs based on a control signal.

### Task 3.2: Design a 4-to-1 Multiplexer with a 16-bit Input

  - Build a 4-to-1 multiplexer using the module designed in Task 3.1. This multiplexer should take a 16-bit input and select one of the four 16-bit inputs based on the control signal.

### Task 3.3: Design a 32-to-1 Multiplexer with a 16-bit Input

  -Utilize multiple 4-to-1 multiplexers from Task 3.2 to design a 32-to-1 multiplexer with a 16-bit input width. This multiplexer should select one of the 32 inputs of 16 bits each based on the control signal.

## Task 4: Designing a Rail Switching Circuit

In this task, imagine designing a switching circuit for railway lines that connect two source stations to two destination stations. The configuration is determined by a selection signal labeled "sel," controlled by 8-bit input and output ports.

If the selection signal "sel" is set to 0, the circuit should connect station C to station A and station D to station B. Conversely, if "sel" is set to 1, the circuit should connect station C to station B and station D to station A.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/1)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 2 -->
<h2 id="hw2"> 🧱 HOMEWORK 2</h2>

<p align="justify">

## Task 1: Designing an 8-Bit Register with Shift and Load Functionality

In this task, we are required to design an 8-bit register with both left and right shift modes and the ability to parallel load data. The control inputs are active high, and the register operates on the rising edge of the clock signal. If multiple control inputs are active simultaneously on the rising edge of the clock, they should be prioritized as follows: shift_left (3), shift_right (3), load (2), reset (1).

## Task 2: Designing a 64x32-Bit Register Bank

In this task, we need to design a register bank consisting of 64 registers, each 32 bits wide, using the modules designed in Task 1. The control inputs and outputs for this module are shown below. Note that when the output_enable signal is low, the data_out should be in a high impedance state, but the registers should still respond to other control inputs as usual. The reg_select signal selects the desired register among the 64 32-bit registers for command execution, e.g., activating the reset signal on the rising edge of the clock clears the content of the selected register.


[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/HW/OSLAB_HW1_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

