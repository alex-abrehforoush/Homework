<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> AIHW </h1>
<h3 align="center"> COMP 1734420 - Artificial Intelligence </h3>
<h5 align="center"> Course Practical Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Winter & Spring 2022) </h5>

<p align="center"> 
  <img src="images/cv.jpg" alt="Artificial Intelligence" height="1440px" width="2560px">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="list-of-problems"> 📖 List of Problems</h2>

<details open="open">
  <summary>List of Problems</summary>
  <ol>
    <li><a href="#rubik's-cube"> ➤ Rubik's Cube (Using Local Search Techniques)</a></li>
    <li><a href="#graph-coloring"> ➤ Graph Coloring (Using Tabu Search)</a></li>
    <li><a href="#city-population"> ➤ City Population</a></li>
    <li><a href="#balanced-map-coloring"> ➤ Balanced Map Coloring</a></li>
    <li><a href="#european-playoff"> ➤ European Playoff</a></li>
    <li><a href="#hungry-horse"> ➤ Hungry Horse</a></li>
    <li><a href="#tiny-maze"> ➤ Tiny Maze</a></li>
    <li><a href="#dnf-to-cnf"> ➤ DNF to CNF</a></li>
    <li><a href="#dimacs-cnf"> ➤ DIMACS CNF</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- RUBIK'S CUBE -->
<h2 id="rubik's-cube"> 🧠 Rubik's Cube (Using Local Search Techniques)</h2>

<p align="justify">
  The Rubik's Cube is a challenging puzzle with numerous possible combinations, and solving it requires a systematic approach. In this report, we present a program written in python that uses local search techniques to solve the Rubik's Cube. The program takes as input the initial arrangement of the Rubik's Cube, represented as a 3x3 matrix with numbers from 1 to 6, obtained from a file (Rubik’s Cube Input.txt). The faces of the cube (White, Green, Red, Blue, Orange, and Yellow) are received in the order depicted in below figure.
  
<p align="center"> 
  <img src="images/rubik.png" alt="Image of Diana" height="248px" width="330px">
</p>

  Upon successfully solving the Rubik's Cube for about three moves, the program outputs the final configuration and the movements performed to achieve it. A total of 12 movements are considered for rotating the cube's faces. When a face is rotated clockwise, it is denoted by the first letter of its name (e.g., U for Up), and counterclockwise rotations are denoted with a prime symbol (e.g., U' for counterclockwise Up).

  To tackle this problem, we employ the Simulated Annealing (SA) algorithm. Each possible move out of the 12 available is considered as a neighbor in the current state of the cube. Therefore, at each step, 12 neighbors are generated. We also define a fitness function, which counts the number of cells in their correct positions, as our objective. We choose the following scheduling function ($t$ stands for temperature):
  $$\frac{1}{\log t}$$
  which starts with an initial temperature of 1000 and decreases by 1 unit in each step.

  For each of the 12 possible movements on the Rubik's Cube, we define a function. It is important to note that clockwise movements are represented without a quotation mark, and counterclockwise movements without a period (e.g., U for Up and U' for counterclockwise Up). Additionally, the getNeighbors function is used to retrieve neighboring states, and the calcValue function calculates the fitness value.

  Our program successfully solves the Rubik's Cubes which deviate from its solved state by at most two moves and some by three and provides the final configuration in the same format as the input, as well as the sequence of movements used to achieve the solution.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/1/P/sources/Rubik.py)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- GRAPH COLORING -->
<h2 id="graph-coloring"> 🧠 Graph Coloring (Using Tabu Search)</h2>

<p align="justify">

  The Graph Coloring Problem entails assigning the minimum number of colors to the vertices of a graph such that adjacent vertices do not share the same color. In this report, we present a program written in a commonly used programming language that employs local search techniques, specifically the Tabu Search algorithm, to solve the Graph Coloring Problem.

  The program takes its input from a file (Graph Coloring Input.txt) and consists of the following components:

  1. The number of vertices.
  2. The number of edges.
  3. The numbering of the endpoints of each edge (vertices are numbered starting from 1).

  The program has a time limit of one minute to find the solution. It aims to determine the minimum number of colors required to color the vertices while ensuring that adjacent vertices have different colors. Additionally, it assigns a color number to each vertex (color numbers start from 1).

  To address the Graph Coloring Problem, we utilize the Tabu Search algorithm. The algorithm begins with an initial state where each vertex is assigned a unique color, equal to the number of vertices in the graph. In each iteration, the algorithm explores neighbors that do not violate the constraint of adjacent vertices having the same color. It selects the neighbor with the minimum possible number of colors as the next state.The provided Python code implements the Tabu Search algorithm for the Graph Coloring Problem. Key functions include:

  🪛 ```getPossibleNeighbors```: Identifies neighbors (new color assignments for vertices) that do not violate adjacency constraints.

  🪛 ```calcValue```: Calculates the number of unique colors used in the current state.

  🪛 ```sls```: Implements the Tabu Search algorithm, selecting the best neighbor as the next state.

  🪛 ```main```: Reads input, constructs the adjacency matrix, initializes colors, and runs the Tabu Search algorithm until the one-minute time limit is reached.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/1/P/sources/Graph.py)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

In the following two problems, we aim to solve two theoretical problems using the CSP modeling framework and implement solutions using the MiniZinc tool. Each student is required to find an appropriate solution for the assigned test case based on their student ID.

<!-- CITY POPULATION -->
<h2 id="city-population"> 🧠 City Population</h2>

<p align="justify"> 
  Consider a country with $n$ cities. These cities are connected by $m$ roads. The country has a peculiar law that mandates that any two neighboring cities must have a population difference of at least 2000 people. Additionally, to prevent the creation of mega-cities, the most populous city should not have a population more than three times that of the least populous city. If we consider the population of each city as a parameter, try to model the problem using CSP.

  Input:

  - The first line provides two integers, $n$ and $m$, indicating the number of cities and roads, respectively.
  The subsequent $m$ lines specify pairs of cities connected by a road.

  Output:

  - You should print $n$ integers, where the $i$-th integer represents the population of the $i$-th city.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/2/P/sources/1/1.mzn)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- BALANCED MAP COLORING -->
<h2 id="balanced-map-coloring"> 🧠 Balanced Map Coloring</h2>

<p align="justify"> 
  In this section, we will tackle the Balanced Map Coloring Problem, inspired by a theorem stating that any map can be colored using four colors in a way that adjacent regions have different colors. However, in this problem, we aim to color the map using four colors—blue, red, green, and white—in such a way that the following criteria are met:

  1. Blue should be used the most frequently.
  2. Red should be used next in frequency.
  3. Green should be used less frequently.
  4. White should be used the least.

Additionally, the number of regions colored blue should be at most twice the number of regions colored white. We will model this problem using the Constraint Satisfaction Problem (CSP) paradigm in MiniZinc.

Given an arbitrary map, you are required to find a valid color assignment for each region of the map, adhering to the constraints mentioned above.

Input:

- The input represents a map, but its specific format is not provided here.

Output:

- For each region on the map, you should print a color label: "blue," "red," "green," or "white."
Ensure that the output satisfies the constraints mentioned in the problem statement.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/2/P/sources/2/2.mzn)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- EUROPEAN PLAYOFF -->
<h2 id="european-playoff"> 🧠 European Playoff</h2>

<p align="justify"> 

In the upcoming match, the English national football team is set to face the winners of the European Playoff. The objective for the English team is to maximize their goal difference in this crucial match. To achieve this goal, we will utilize linear programming and a mixed strategy approach with a suitable LP solver.

Linear programming is a mathematical technique used to optimize a linear objective function subject to linear inequality constraints. In this case, our objective is to maximize the goal difference while adhering to the constraints of the game.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/3/source/AI_HW3_9816603_abrehforoush_theory.mzn)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- <p>I have implemented the depth-first search (DFS) algorithm in the depthFirstSearch function in <code>search.py</code>.</p>
<p>The Pacman will quickly find a solution via running the following commands:</p>

<pre><code>$ python pacman.py -l tinyMaze -p SearchAgent</code></pre>
<pre><code>$ python pacman.py -l mediumMaze -p SearchAgent</code></pre>
<pre><code>$ python pacman.py -l bigMaze -z .5 -p SearchAgent</code></pre> -->

<!-- <p align="center"> 
<img src="gif/DFS.gif" alt="Animated gif DFS Algorithm" height="282px" width="637px">
height="382px" width="737px"
</p> -->


<!-- HUNGRY HORSE -->
<h2 id="hungry-horse"> 🧠 Hungry Horse</h2>

<p align="justify"> 

In accordance with the rules of chess, the knight moves in an L-shaped pattern. For example, in the image below, the knight can move to any of the eight marked squares.

Now, consider a 4x4 chessboard, where rows and columns are numbered from 1 to 4. In the first line of input, you are given the coordinates of the square where the knight is placed, with the first number representing the column and the second number representing the row. In the following lines, the coordinates of the opponent's pawn squares are given. A pair of zeroes in the input signifies the end of the input.

Using the BFS algorithm and the Python programming language, we aim to create a program that finds the shortest path for the knight to capture all opponent's pawns on the chessboard. During this path, the knight can visit each square at most once. The initial square where the knight is placed is considered visited.

Algorithm Description:

  Initialize a chessboard grid with the same dimensions as the given chessboard, marking visited squares as False initially.
  Implement BFS to find the shortest path from the knight's starting position to each opponent's pawn square.
  As the knight captures pawns, mark those squares as visited.
  If it is possible to capture all opponent's pawns, record and print the coordinates of visited squares in separate rows, following their order of capture.
  If it is not possible to capture all opponent's pawns, print "Fail" on the first line, followed by the maximum number of pawns captured on the second line, and the coordinates of visited squares in the subsequent lines.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/3/source/8.py)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- TINY MAZE -->
<h2 id="tiny-maze"> 🧠 Tiny Maze</h2>

<p align="justify">

In order to solve this problem, it is necessary to have PIP installed on your system. Firstly, obtain the source code for the maze game from the<a href="https://github.com/ZitingShen/Pac-Man">source</a>. After installing the required tools, run the project by executing the command pip install -r requirements.txt, followed by running the pacman.py file. If no issues arise during this process, the maze game will run successfully.

For this exercise, we will be working on a simplified and small-scale version of the Maze game. After playing a few rounds and getting familiar with the game, execute the following command:

```python pacman.py -l tinyMaze -p SearchAgent -a fn=sampleSearch```

This command instructs Pacman to navigate from the starting point to the goal based on the directions provided by the sampleSearch function, located in the ```search.py``` file.

Similarly, the following command will call the sampleSearch2 function and guide Pacman along a different path:

```python pacman.py -l tinyMaze -p SearchAgent -a fn=sampleSearch2```

Task A:
In the depthFirstSearch function, which is located in the search.py file, implement Pacman's pathfinding using the depth-first search (DFS) algorithm. To evaluate the performance of your algorithm, you can use the following command:

```python pacman.py -l tinyMaze -p SearchAgent -a fn=depthFirstSearch```

Task B:
In the aStarSearch function, also located in the search.py file, implement Pacman's pathfinding using the A* search algorithm. To assess the performance of your algorithm, use the following command:

```python pacman.py -l tinyMaze -p SearchAgent -a fn=aStarSearch```

Please note that the starting position of Pacman, as well as the positions of walls and the goal, remain constant and are as seen in the game. Additional explanations and details are provided as comments within the sampleSearch function. Ensure that any modifications you make are limited to the search.py file.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/3/source/9.py)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- DNF TO CNF -->
<h2 id="dnf-to-cnf"> 🧠 DNF TO CNF</h2>

<p align="justify">

To complete this task, we used the Logic software package provided by Maple or the Logic software tools available in Mathematica. The input expression was in Disjunctive Normal Form (DNF) and was provided in a file named "DNF to CNF Input.txt." Our objective was to convert this DNF expression into Conjunctive Normal Form (CNF). The resulting CNF expression was saved in a file called "DNF to CNF Output.txt." This task carried a weight of 15 points.

The DIMACS CNF format used in the file conversion is defined as follows:

  - Each line of the CNF expression consists of integers separated by spaces.
  - The first line of the CNF file is in the format "p cnf n m," where 'n' represents the number of variables, and 'm' represents the number of clauses.
  - Variable numbering starts from 1, and the negation of a variable is indicated by a '-' sign.
  - Clauses end with a '0' value.

The successful completion of this task demonstrated our ability to convert complex logical expressions from one canonical form to another, enhancing our understanding of logic manipulation.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/6th%20sem/Artificial%20Intelligence/HW/4/sources/8)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- DIMACS CNF -->
<h2 id="dimacs-cnf"> 🧠 DIMACS CNF</h2>

<p align="justify">

In the second task, we focused on solving a CNF-SAT problem using an Inexact SAT Solver, specifically UBCSAT. UBCSAT is known for its local search-based optimization techniques. The CNF-SAT problem was provided in DIMACS CNF format within a file named "DIMACS Input.txt."

The DIMACS CNF format is defined as follows:

  - Each line of the CNF expression consists of integers separated by spaces.
  - The first line of the CNF file is in the format "p cnf n m," where 'n' represents the number of variables, and 'm' represents the number of clauses.
  - Variable numbering starts from 1, and the negation of a variable is indicated by a '-' sign.
  - Clauses end with a '0' value.

Our goal in this task was to employ UBCSAT to solve the CNF-SAT problem provided in "DIMACS Input.txt" and generate an output file named "DIMACS Output.txt." This output file contained the truth assignments of the variables, sequentially from variable 1 to variable 'n,' represented as '0' or '1.' The completion of this task was also associated with 15 points.

The successful execution of this task demonstrated our ability to apply SAT-solving algorithms to complex Boolean satisfiability problems. This experience reinforced the importance of SAT solvers in various computational and decision-making contexts.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/tree/master/6th%20sem/Artificial%20Intelligence/HW/4/sources/9)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

