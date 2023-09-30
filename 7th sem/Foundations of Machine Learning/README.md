<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> OSHW </h1>
<h3 align="center"> COMP 1730435 - Basics of Machine Learning</h3>
<h5 align="center"> Course Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Fall 2022) </h5>

<p align="center"> 
  <img src="images/ml.jpg" alt="OS Lab." height="408px" width="612px">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="list-of-problems"> 📖 List of Homeworks</h2>

<details open="open">
  <summary>List of Homeworks</summary>
  <ol>
    <li><a href="#hw1"> ➤ Homework 1 (Introduction to Linux)</a></li>
    <li><a href="#hw2"> ➤ Homework 2 (Scripts)</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 1 -->
<h2 id="hw1"> 🧱 HOMEWORK 1 (Introduction to Linux)</h2>

<p align="justify">

In the first session of the Operating System Lab, students are assigned several tasks aimed at familiarizing them with fundamental concepts and commands related to the Linux operating system. Completing these tasks demonstrates proficiency in basic system operations, making them valuable skills to showcase on a CV or personal website.

## Task 1 - Directory Permissions and Timestamps

  1. Open a terminal window and navigate to the root directory.
  2. Examine the contents of this directory to identify which directories do not allow write permissions for the owner (mention directory names separated by spaces).
  3. Change to the 'home' directory.
  4. Create a new file named 'oslab1_groupno' (replace 'groupno' with your lab group number).
  5. Record the timestamp of the last access to the file and note the time (e.g., 15:11).
  6. Open the file with 'vim' and write your name, surname, and student ID on three consecutive lines.
  7. Save the changes and exit the file.
  8. Record the timestamp of the last access to the file again and note the time.
  9. Copy this file to the '/root' directory and revoke write permissions for all users.

## Task 2 - Network Configuration

 1. Use the 'ifconfig' command to obtain the IP address of your local network.
 2. Check if you can see the IP address of the adjacent computer (determine if your computer can communicate with it).
 3. Establish an 'ssh' connection to your friend's computer.
 4. Copy the output file from the previous question from your friend's computer to your own.

## Task 3 - Memory-Intensive Processes

 1. Identify three running processes that consume the most main memory on your computer.
 2. Record their names and memory usage in the report.

## Task 4 - Linux Kernel System Calls

 1. Obtain the latest version of the 2. Linux kernel source code using the 'apt' command.
 2. Extract the downloaded compressed file.
 3. Search for the 'syscall.tbl' file within the source code.
 4. Find the number of system calls related to 'write' in this file.
 5. Copy the lines corresponding to these 'write' system calls into a new file named 'stdno_oslab1_q2.'

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/HW/OSLAB_HW1_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 2 -->
<h2 id="hw2"> 🧱 HOMEWORK 2 (Scripts)</h2>

<p align="justify">

## Task 1: Scripting for File Generation

We created a shell script named "myscript" that generates multiple files in a specified directory. The script takes four parameters:

  - `dir`: The directory path where the files should be created.
  - `prefix`: The prefix for the file names.
  - `from`: The starting value for the incremental index.
  - `to`: The ending value for the incremental index.

The script checks if the specified directory exists and creates it if not. It then generates files in the format of "prefix-i.txt," where 'i' varies from 'from' to 'to.' The script also sets file permissions to restrict write access.

Example Usage:

```
$ ./myscript /home/user/frd quiz 2 5
File quiz2.txt created in /home/user/frd
File quiz3.txt created in /home/user/frd
File quiz4.txt created in /home/user/frd
File quiz5.txt created in /home/user/frd
```

## Task 2: Creating C Programs and Makefile

Part (a): We created a C program that calculates the power of a base number raised to an exponent. Additionally, we developed a "main.c" file to take input parameters from the command line, utilizing the power function, and print the result.

Part (b): We created a Makefile for the project, capable of compiling and linking all ".c" files into an executable. The Makefile must support the following targets:

  - `all`: Compiles and links all ".c" files to create the final executable.
  - `install`: Installs the final executable named "pow" in a directory accessible to the user.
  - `uninstall`: Removes the installed project.
  - `clean`: Cleans the current directory of any generated files from previous build steps.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/HW/OSLAB_HW2_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

