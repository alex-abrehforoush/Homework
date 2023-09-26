<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> OSHW </h1>
<h3 align="center"> COMP 1734304 - Operating System Lab.</h3>
<h5 align="center"> Course Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Fall 2022) </h5>

<p align="center"> 
  <img src="images/os.jpg" alt="OS Lab." height="450px" width="600px">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="list-of-problems"> 📖 List of Homeworks</h2>

<details open="open">
  <summary>List of Homeworks</summary>
  <ol>
    <li><a href="#hw1"> ➤ Homework 1</a></li>
    <li><a href="#hw2"> ➤ Homework 2</a></li>
    <li><a href="#hw3"> ➤ Homework 3</a></li>
    <li><a href="#hw4"> ➤ Homework 4</a></li>
    <li><a href="#hw5"> ➤ Homework 5</a></li>
    <li><a href="#hw6"> ➤ Homework 6</a></li>
    <li><a href="#hw7"> ➤ Homework 7</a></li>
    <li><a href="#hw8"> ➤ Homework 8</a></li>
    <li><a href="#hw9"> ➤ Homework 9</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 1 -->
<h2 id="hw1"> 🧱 HOMEWORK 1</h2>

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

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW1_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 2 -->
<h2 id="hw2"> 🧱 HOMEWORK 2</h2>

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

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW2_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 3 -->
<h2 id="hw3"> 🧱 HOMEWORK 3</h2>

<p align="justify">

## Summary
In the Operating System Lab project, we developed a banking system simulation that allows for the management of a small bank with 100 accounts, each initially holding a balance of 2,000,000 units of currency. Transactions on these accounts are performed by writing to a driver file, and the account statuses are checked by reading from the same driver file. The system supports three types of transactions: Transfer (t), Deposit (d), and Withdraw (w), and the format for writing to the driver file is specified as follows: "Type of transaction, [From], [To], [Amount]".

## Example
For transferring 12 units of currency from account 17 to account 22, the corresponding string in the driver file would be: "t,17,22,12".

The format for reading from the driver file is as follows: "[Balance of 0], [Balance of 1], ..., [Balance of 98], [Balance of 99]".

## Key Considerations

  - Properly handle user input format violations by providing suitable ```printk``` messages.
  - Implement error handling for transaction failures (e.g., insufficient balance) by issuing appropriate printk messages.

## Implementation
We have provided a file containing essential functions to create the banking system, simplifying the implementation process.

## Tasks

  1. Develop programs that receive input from the command line, including the device name, transaction type, source account, destination account, and transaction amount. Based on this input, execute a transaction with the bank and print the result.

  2. Create a shell script that performs the following tasks:
      - Compiles the designed module.
      - Compiles the developed program.
      - Loads the compiled module.
      - Creates a driver file named "iutnode" using mknod.
      - Executes your program.
      - Removes the driver file.
      - Cleans up the compiled output files.

## Conclusion
This project demonstrates our practical skills in implementing a simulated banking system in an operating system environment. It involves handling various transaction types, managing account balances, and providing feedback to users. This experience in system-level programming and simulation is valuable for understanding operating system internals and real-world applications.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW3_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 4 -->
<h2 id="hw4"> 🧱 HOMEWORK 4</h2>

<p align="justify">

## Summary
In the Operating System Lab session, we were tasked with modifying the ioctl function in a given example. The objective was to enhance this function to handle two specific commands:

 - The first command should transfer data from user space to kernel space and print it in the kernel.
 - The second command should transfer data from kernel space to user space and print it in user space.

## Details

 - The ioctl function is a crucial component in communication between user space and kernel space in operating systems. It allows for various control operations on devices.

## Implementation
We modified the ioctl function to accommodate these two additional commands, enabling data transfer and printing between user space and kernel space. We also updated the corresponding user-space software to align with these changes.

## Conclusion
This project involved enhancing the ioctl function, a critical part of the operating system's interface, to support new commands for data transfer and printing between user and kernel spaces. This experience demonstrates our proficiency in system-level programming and kernel modifications, which are essential skills for working on operating systems and device drivers.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW4_9816603_abrehforoush)

</p>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 5 -->
<h2 id="hw5"> 🧱 HOMEWORK 5</h2>

<p align="justify">

## Summary
In the Operating System Lab's fifth session, the focus was on learning how to execute tasks using multiple processes. This exercise involved three key steps:

## Step 1: Implementing a Task Function

  - Develop a task function that simulates work to be performed by multiple processes.
  - Assign a unique ID to each process to determine its specific task.
  - Generate a random sleep duration between 1 and 5 seconds for each process.
  - Print a message upon task completion, indicating the task ID, child process ID (PID), and execution time.
  - Ensure proper seeding of random numbers to ensure uniqueness.

## Step 2: Creating a Parent Process

  - Create a parent process that spawns a specified number of child processes.
  - Each child process should execute the task function with a unique ID.
  - Familiarize with the waitpid command using WNOHANG and WUNTRACED options.
  - The parent process should wait for all child processes to complete and print a termination message.

## Step 3: Enhancing Parent Process

  - The parent process should periodically check the status of all child processes.
  - If a child process has finished its task, the parent replaces it with a new one using the same task ID.
  - The parent process continues until it receives a termination signal (e.g., SIGINT, CTRL+C).

Additionally, a secondary program, "app.cpp," simulates tasks with sleep durations. The main program runs "app" in a loop, records execution times, generates random sleep durations, and launches "app" with the corresponding sleep time.

The goal of this exercise is to practice running programs using multiple processes, logging their execution times, and managing their replacement dynamically.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW5_9816603_abrehforoush)

</p>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 6 -->
<h2 id="hw6"> 🧱 HOMEWORK 6</h2>

<p align="justify">

## Summary
In the sixth session of the Operating System Lab, the focus is on managing a multi-process program using pipeline management. The objective is to simulate child processes performing work with sleep delays. Each child generates a random value, sleeps for a specified duration, and writes it to a pipe for the parent to collect. The parent accumulates these values until they reach a certain constant, at which point both the parent and children terminate.

Here are the tasks:

### Task 1 - Multi-Process Pipeline Management:

  - Create a program that initializes a global variable named 'total' to 0.
  - Create a pipe for communication between the parent and all child processes.
  - Spawn a specified number of child processes (e.g., 5) using fork().
  - The parent continuously waits for data from the pipe.
  - The parent receives values sent by each child and accumulates them into 'total.'
  - When 'total' exceeds a predefined maximum value (e.g., 100), the parent terminates all child processes and itself.

### Task 2 - Named Pipes (FIFOs):
Named pipes, also known as FIFOs, are used to simulate communication between separate programs. You will write two programs: 'server' and 'client.'

## Server Program

  - Create a named pipe (FIFO) and store its path in the 'FIFO_PATH' macro.
  - In an infinite loop, wait for values to be sent from the 'client' program.
  - Open the FIFO for reading and wait for commands ('m' for multiplication or 'p' for addition) and two operands.
  - Perform the specified operation and send the result back to the 'client' through the FIFO.

## Client Program

  - In an infinite loop, prompt the user for a command ('m' or 'p') and two operands.
  - Open the FIFO for writing and send the command and operands to the 'server.'
  - Open the FIFO for reading and receive the result from the 'server.'
  - Display the result to the user.

## Notes for Submission
A) Discuss the potential risks of using a single pipe for communication between multiple child processes and provide suggestions for mitigating those risks.

B) Explain whether it is possible to establish communication between child processes using pipes. If not, provide a brief explanation.

For enhanced clarity and better code organization, it's advisable to encapsulate commands and operands using a struct. This struct should include a character for the command ('m' or 'p') and two integer operands. Using a struct in your implementation will earn you extra points.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW6_9816603_abrehforoush)

</p>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 7 -->
<h2 id="hw7"> 🧱 HOMEWORK 7</h2>

<p align="justify">

## Summary
In the seventh session of the Operating System Lab, the focus is on working with shared memory, signals, and parallel processing. This assignment involves three tasks aimed at enhancing understanding of these concepts.

## Task 1 - Shared Memory
The first task involves sending structured data through shared memory between two processes. The steps include:

  - Creating a 'struct' in the 'protocol' file, containing an array of a specific size and a string.
  - Writing two elements of this structure as arrays in shared memory and reading them.
  - Modifying the programs to have a 'sender' program send two elements of the structure as arrays, and a 'receiver' program receive and display them.
  - Generating random values between 1 and 5 for array elements and sending names through strings.
  - Investigating and adding the 'PROT_WRITE' flag to line 18 in the 'receiver' file and commenting on why this is necessary.

## Task 2 - Signals
The second task aims to introduce signals and scheduling future tasks. The steps include:

  - Learning about signals and the 'alarm' function through the 'man' command.
  - Creating a program that regularly prints the message "! I am alive" every second (simulated using 'sleep').
  - Printing the message "I received alarm" five seconds after the program starts using the 'alarm' function.
  - Emphasizing that counting messages and printing messages are not allowed in a real program.

## Task 3 - Parallel Processing with Shared Memory
The third task focuses on dividing work among multiple processes using shared memory. The goal is to transform all elements of an array with a specific function. The steps include:

  - Creating an array of 100 elements in shared memory.
  - The parent program creates child processes according to the 'MAX_CHILD' value.
  - The parent initializes the array elements.
  - After initialization, the parent sends a 'SIGUSR1' signal to all child processes to start their work.
  - The parent waits for all child processes to finish, prints the modified array, and terminates.
  - Suggesting a fair workload distribution strategy among child processes.
  - Emphasizing the need for a delay (e.g., 'usleep') after forking to ensure proper process creation.

## Additional Note
It's important to consider that handling signal responses in signal handlers (e.g., 'handler') involves significant low-level work due to how operating systems treat them differently from normal program execution. To simplify this task, it's recommended to perform most of the work in the regular child process code and only use a global variable to indicate signal reception in the signal handler.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW7_9816603_abrehforoush/7)

</p>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 8 -->
<h2 id="hw8"> 🧱 HOMEWORK 8</h2>

<p align="justify">

## Summary
In the eighth session of the Operating System Lab, the assignment involves adding a custom system call to the kernel to retrieve and display the names and PIDs (Process IDs) of running processes. This task focuses on enhancing system understanding and customizing kernel functionality.

## Task 1 - Custom System Call

    - The main objective of this assignment is to extend the kernel with a custom system call.
    - The custom system call should provide information about running processes, including their names and PIDs.
    - The system call should enable user programs to retrieve this information from the kernel.

## Task 2 - User Programs

  - Write user-level programs that utilize the custom system call to:
      - Retrieve a list of running processes.
      - Print the names and PIDs of these processes.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW8_9816603_abrehforoush)

</p>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 9 -->
<h2 id="hw9"> 🧱 HOMEWORK 9</h2>

<p align="justify">

## Summary

In the ninth session of the Operating System Lab, we are tasked with two distinct programming challenges, focusing on parallel algorithms and synchronization. These exercises demonstrate proficiency in parallel computing and problem-solving, making them valuable additions to a CV or personal website.

## Task 1 - Parallel Algorithm: Find the Smallest Element in an Array

  - The first task involves finding the smallest element in an array (A) of size SIZE using a parallel algorithm.
  - The algorithm employs a global variable, 'stride,' initially set to SIZE/2.
  - In each step:
      - Multiple threads (equal to the current 'stride' value) are created.
      - Each thread calculates the minimum value between elements A[t] and A[t+stride], storing it in A[t].
      - The 'stride' variable is halved (stride /= 2), and if stride becomes 0, the algorithm terminates, and the smallest element is displayed.
  - In the final step, the smallest element is stored in A[0].

## Task 2 - Parallel Program: Calculate the Dot Product of Two Arrays

  - The second task involves calculating the dot product of two arrays, A and B, both of size SIZE.
  - The program is designed to use THREADS threads, where THREADS <= SIZE.
  - The computed result is stored in a variable named 'product.'
  - Multiple threads may concurrently write to 'product,' so synchronization mechanisms are essential to ensure accurate results.

## Task 3 - Dining Philosophers Problem: Multi-threaded Solution

  - For the Dining Philosophers problem, we are required to create a multi-threaded solution for five philosophers.
  - Each philosopher is represented by a separate thread and is either eating or thinking.
  - Philosophers can eat if both forks on their sides are available, with a random wait time of fewer than 3 seconds.
  - After eating, a philosopher places the forks on the table and thinks for a random duration of fewer than 3 seconds.
  - To prevent deadlocks, philosophers only begin eating when both forks are available (using busy waiting and semaphore checks).

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/7th%20sem/OS%20Lab/OSLAB_HW9_9816603_abrehforoush)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

