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
<h2 id="modules"> ⚡ Modules</h2>

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
<h2 id="hw1"> ⚡ HOMEWORK 1</h2>

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
<h2 id="hw2"> ⚡ HOMEWORK 2</h2>

<p align="justify">

## Task 1: Registers

### Task 1.1: Designing an 8-Bit Register with Shift and Load Functionality

In this task, we are required to design an 8-bit register with both left and right shift modes and the ability to parallel load data. The control inputs are active high, and the register operates on the rising edge of the clock signal. If multiple control inputs are active simultaneously on the rising edge of the clock, they should be prioritized as follows: shift_left (3), shift_right (3), load (2), reset (1).

### Task 1.2: Designing a 64x32-Bit Register Bank

In this task, we need to design a register bank consisting of 64 registers, each 32 bits wide, using the modules designed in Task 1. The control inputs and outputs for this module are shown below. Note that when the output_enable signal is low, the data_out should be in a high impedance state, but the registers should still respond to other control inputs as usual. The reg_select signal selects the desired register among the 64 32-bit registers for command execution, e.g., activating the reset signal on the rising edge of the clock clears the content of the selected register.


## Task 2: Designing a Currency Counter Module

In this task, the goal is to design a currency counter device capable of counting three types of banknotes: 2000, 1000, and 5000 Iranian Tomans. Each banknote's count is determined by generating a rising edge pulse. The main module for designing this device includes input signals specific to each type of banknote, namely Pulse2000, Pulse1000, and Pulse5000. Additionally, there is a control signal named count_m that specifies the desired currency denomination to count.

The objective of this design is to determine whether the total sum of counted banknotes is greater than or equal to the specified amount. Consequently, the module will output a single-bit signal. This signal will be set to '1' if the total sum of counted banknotes exceeds or equals the defined amount; otherwise, it will be '0'. Moreover, the module will provide outputs indicating the count of each type of banknote. Hence, there will be three outputs corresponding to each banknote type, specifying the count of each denomination.

It is important to note that the maximum amount this device should count is 500,000 Tomans. Therefore, the input count_m is a 19-bit signal.

Assuming the module also has an asynchronous active-low reset input, when activated, it will reset the module's outputs and all internal registers to zero. The module operates with a clock signal of significantly higher frequency than the input signal rate. Only the Clock signal should be used as the clock pulse in your design.

## Task 3: Designing a Sequence Detector Module

In this task, the objective is to design a sequence detector module at the Behavioral level. The module's input and output functionality are described as follows:

  - input_seq (input): This single-bit input represents a sequence of 0s and 1s, which is serially fed into the module with each falling edge of the clock pulse (clk).

  - lookfor_seq (input): This 2-bit input selects one of the following sequences for detection: 10101, 01010, 10111, or 10100. For instance, if seq_select=2, the module searches for the sequence 10100 in the input number sequence.

  - seq_detected (output): This 1-bit output becomes '1' after detecting the specified sequence for one clock pulse and then resets to '0'.

  - seq_count (output): This 16-bit output indicates the count of detected sequences. Changing the input lookfor_seq resets this output.

To illustrate this, a Verilog module should be designed, following the given diagram and functional specifications. The module should detect the specified sequences in the serial input stream and maintain a count of how many times the sequence has been detected. Each detection should set the seq_detected signal to '1' for one clock pulse.

## Task 4: Designing a Binary Division Module

In this task, you are required to design a module for calculating the remainder of dividing a binary input string by 7 and determining its divisibility. For example, the remainder of the binary string "10101," equivalent to the decimal number 21, divided by 7 is 0.

Here are the key features of the module:

  - The module should accept a single-bit input called "String," which represents the binary input string. The module calculates the remainder of this string divided by 7. With each clock pulse, a bit is added to the right side of the string.

  - Before starting the module, the remainder is assumed to be 0.

  - The module has the following ports:
      - A single-bit input "Clock," which represents the module's clock pulse.
      - A single-bit input "Reset," which operates synchronously.
      - A three-bit output "Remainder," which continuously determines the remainder of dividing the input string by 7.
      - A single-bit output "Divisible," which becomes '1' when the input string is divisible by 7 for one clock pulse. If the remainder changes with the next clock pulse and does not remain 0, this bit should be set to '0'.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/2)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 3 -->
<h2 id="hw3"> ⚡ HOMEWORK 3</h2>

<p align="justify">

## Synthesis and Analysis Report for Hardware Design Tasks

In this report, we will present the synthesis and analysis results of the hardware designs from the previous assignment. The goal was to synthesize these designs using Xilinx ISE software, targeting the Spartan6 family, XC6SLX16 device, CSG324 package, and -3 speed grade.
Design Summaries
Task 1: Binary Register

For the first task, we designed an 8-bit binary register capable of shifting left and right, parallel loading, and reset functionality. The register operates on a rising edge clock signal and synchronous reset. During synthesis, the design utilized a specific number of flip-flops, lookup tables (LUTs), and other resources from the target device.
Task 2: Register Bank

The second task involved creating a register bank comprising 64 32-bit registers. This bank was implemented using instances of the binary register designed in task 1. Various control signals allowed resetting, loading, and shifting operations for these registers. The synthesis report detailed the resource utilization and timing constraints of this bank.
Task 3: Sequence Detector

In task 3, we designed a sequence detector module at the behavioral level. This module takes a serial input string, looks for specific sequences (e.g., 10101), and counts the occurrences of these sequences. It operates based on clock pulses and has a reset functionality. The synthesis report contains information on resource usage and timing performance.
Task 4: Binary Division

For the fourth task, we created a module to calculate the remainder of dividing a binary input string by 7 and determine its divisibility. The design included ports for clock, reset, input string, and output signals for remainder and divisibility. The synthesis report provides insights into the logic resource utilization and timing constraints.
Observations and Conclusions

The synthesis process revealed critical information about resource usage, timing performance, and overall functionality of the designed hardware modules. We observed that each task's design met the specified hardware requirements and utilized resources within acceptable limits for the target device.

The generated reports contain comprehensive details about resource utilization, including the number of flip-flops, LUTs, and other relevant information. Additionally, timing constraints were met for all modules, ensuring proper synchronization in different clock domains.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/3)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 4 -->
<h2 id="hw4"> ⚡ HOMEWORK 4</h2>

<p align="justify">

## Task 1: Multiplayer Number Guessing Game - FPGA Hardware Design

### Introduction

In this FPGA hardware design project, we have created a multiplayer number guessing game. The game is played with two participants who take turns guessing a randomly selected N-bit number. The target number is displayed on a card and remains constant throughout the game.

The participants, referred to as Player 1 and Player 2, have ten chances each to guess the correct N-bit number. The guesses of Player 1 and Player 2 are represented by two N-bit numbers known as First_num and Second_num. The goal is to determine the winner based on the correlation between their guesses and the target number. Correlation, in this context, represents the number of matching bits between the guessed number and the target number.

### Game Rules

The game determines the winner based on the following rules:

  - If a player correctly guesses the target number (i.e., correlation is equal to N), they win the game instantly.

  - If neither player correctly guesses the target number in ten rounds, the player with the highest cumulative correlation over the rounds is declared the winner.

  - If both players have an equal cumulative correlation at the end of the game, the game results in a tie.

### Hardware Design Overview

The hardware design of this game consists of four main modules: Top_module, Correlation, Winner, and Decision. Let's briefly describe each module:

  - Top_module: This module orchestrates the game and interfaces with the external environment. It takes input signals including clock (Clock), asynchronous reset (Reset), and the target number (Target_Num). It also produces output signals (Result) to indicate the game result.

  - Correlation: This module calculates the correlation between the guessed numbers (First_num and Second_num) and the target number (Target_Num). The resulting correlations are stored in two N+3-bit signals (Out_1 and Out_2) that keep track of the cumulative correlations of Player 1 and Player 2.

  - Winner: The Winner module compares the cumulative correlations of both players and determines the temporary winner. It produces a 2-bit signal (Out_wr) that represents the temporary winner.

  - Decision: The Decision module is responsible for making the final decision on the game winner. It considers the temporary winner from the Winner module and the Correct_guess signal, which indicates if any player has guessed the exact target number. The final result is presented in the Result signal.

### Game Flow

Here's an overview of how the game progresses:

  - The game starts with the target number (Target_Num) displayed on the card, and Player 1 begins guessing.

  - Both Player 1 and Player 2 take turns guessing, and the correlations between their guesses and the target number are calculated and stored.

  - If either player correctly guesses the target number, they instantly win, and the game ends.

  - If neither player wins in ten rounds, the temporary winner with the highest cumulative correlation is determined by the Winner module.

  - Finally, the Decision module considers the temporary winner and whether any player guessed the exact number. The game result is then determined and presented as Result.


## Task 2: Multiplayer Correlation-Based Winner Determination - FPGA Hardware Design

### Introduction

In this FPGA hardware design project, we aim to create a system capable of determining winners among 16 participants based on their correlation with a target number. Each of the 16 players provides a 32-bit number, and the system calculates the correlation between their number and the target number to declare a winner. The goal is to design efficient modules that perform this task and ensure that in cases where multiple players have the same correlation, the player with the lowest number wins.

### Design Overview

#### Part 1: Player Correlation Module

In the first part, we design a module that handles the correlation calculation for each player. Here's a brief overview:

  - Inputs:
      Target_Num (32 bits): The target number against which players' numbers are correlated.
      Num_16 (32 bits): The 32-bit number provided by each player (16 players in total).
      Clock: The clock signal for synchronization.
      Reset: The asynchronous reset signal.
  - Outputs:
      Out_4 (4 bits): This 4-bit output indicates the number of the winning player based on their correlation. If multiple players have the same correlation, the player with the lowest number will be declared the winner.

#### Part 2: RFCorrelator Module

In the second part, we design an additional module called RFCorrelator, which makes use of the Player Correlation Module to efficiently determine the winners. Here's an overview of the RFCorrelator:

  - Inputs:
      Bit_stream (1 bit): This input carries serial data representing the numbers of all 16 players. It receives data synchronously with the rising edge of the clock signal.
      Clock: The clock signal for synchronization.
      Reset: The asynchronous reset signal.

  - Outputs:
      Out_str (4 bits): This 4-bit output provides the number of the winning player for each set of 32 bits received. The output remains stable until the next set of data is processed.

The RFCorrelator processes incoming data and continuously determines winners based on the correlations calculated by the Player Correlation Module. It also ensures that the winner with the lowest number is declared in cases of tied correlations.
Applications

While this design is presented as a game, it has broader applications in telecommunications systems and other fields where data correlation plays a crucial role. It showcases how FPGA hardware can efficiently handle large datasets and complex calculations in real-time.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/4th%20sem/FPGA/HWs/4)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

