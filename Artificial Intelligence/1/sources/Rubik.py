import numpy as np
import random as rnd
import math
from matplotlib import pyplot as plt

#define moves
def rotate(cube, i):
	new_cube = cube.copy()
	new_cube[i][0] = cube[i][6]
	new_cube[i][1] = cube[i][3]
	new_cube[i][2] = cube[i][0]
	new_cube[i][3] = cube[i][7]
	new_cube[i][4] = cube[i][4]#center
	new_cube[i][5] = cube[i][1]
	new_cube[i][6] = cube[i][8]
	new_cube[i][7] = cube[i][5]
	new_cube[i][8] = cube[i][2]
	return new_cube

def anti_rotate(cube, i):
	new_cube = cube.copy()
	new_cube[i][0] = cube[i][2]
	new_cube[i][1] = cube[i][5]
	new_cube[i][2] = cube[i][8]
	new_cube[i][3] = cube[i][1]
	new_cube[i][4] = cube[i][4]#center
	new_cube[i][5] = cube[i][7]
	new_cube[i][6] = cube[i][0]
	new_cube[i][7] = cube[i][3]
	new_cube[i][8] = cube[i][6]
	return new_cube



def front(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][6] = cube[1][8]
	new_cube[0][7] = cube[1][5]
	new_cube[0][8] = cube[1][2]
	#green
	new_cube[1][2] = cube[5][0]
	new_cube[1][5] = cube[5][1]
	new_cube[1][8] = cube[5][2]
	#red
	new_cube = rotate(new_cube, 2)
	#blue
	new_cube[3][0] = cube[0][6]
	new_cube[3][3] = cube[0][7]
	new_cube[3][6] = cube[0][8]
	#orange
	#yellow
	new_cube[5][0] = cube[3][6]
	new_cube[5][1] = cube[3][3]
	new_cube[5][2] = cube[3][0]

	return new_cube

def anti_front(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][6] = cube[3][0]
	new_cube[0][7] = cube[3][3]
	new_cube[0][8] = cube[3][6]
	#green
	new_cube[1][2] = cube[0][8]
	new_cube[1][5] = cube[0][7]
	new_cube[1][8] = cube[0][6]
	#red
	new_cube = anti_rotate(new_cube, 2)
	#blue
	new_cube[3][0] = cube[5][2]
	new_cube[3][3] = cube[5][1]
	new_cube[3][6] = cube[5][0]
	#orange
	#yellow
	new_cube[5][0] = cube[1][2]
	new_cube[5][1] = cube[1][5]
	new_cube[5][2] = cube[1][8]

	return new_cube

def back(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][0] = cube[3][2]
	new_cube[0][1] = cube[3][5]
	new_cube[0][2] = cube[3][8]
	#green
	new_cube[1][0] = cube[0][2]
	new_cube[1][3] = cube[0][1]
	new_cube[1][6] = cube[0][0]
	#red
	#blue
	new_cube[3][2] = cube[5][8]
	new_cube[3][5] = cube[5][7]
	new_cube[3][8] = cube[5][6]
	#orange
	new_cube = rotate(new_cube, 4)
	#yellow
	new_cube[5][6] = cube[1][0]
	new_cube[5][7] = cube[1][3]
	new_cube[5][8] = cube[1][6]

	return new_cube

def anti_back(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][0] = cube[1][6]
	new_cube[0][1] = cube[1][3]
	new_cube[0][2] = cube[1][0]
	#green
	new_cube[1][0] = cube[5][6]
	new_cube[1][3] = cube[5][7]
	new_cube[1][6] = cube[5][8]
	#red
	#blue
	new_cube[3][2] = cube[0][0]
	new_cube[3][5] = cube[0][1]
	new_cube[3][8] = cube[0][2]
	#orange
	new_cube = anti_rotate(new_cube, 4)
	#yellow
	new_cube[5][6] = cube[3][8]
	new_cube[5][7] = cube[3][5]
	new_cube[5][8] = cube[3][2]

	return new_cube

def right(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][2] = cube[2][2]
	new_cube[0][5] = cube[2][5]
	new_cube[0][8] = cube[2][8]
	#green
	#red
	new_cube[2][2] = cube[5][2]
	new_cube[2][5] = cube[5][5]
	new_cube[2][8] = cube[5][8]
	#blue
	new_cube = rotate(new_cube, 3)
	#orange
	new_cube[4][0] = cube[0][8]
	new_cube[4][3] = cube[0][5]
	new_cube[4][6] = cube[0][2]
	#yellow
	new_cube[5][2] = cube[4][6]
	new_cube[5][5] = cube[4][3]
	new_cube[5][8] = cube[4][0]

	return new_cube

def anti_right(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][2] = cube[4][6]
	new_cube[0][5] = cube[4][3]
	new_cube[0][8] = cube[4][0]
	#green
	#red
	new_cube[2][2] = cube[0][2]
	new_cube[2][5] = cube[0][5]
	new_cube[2][8] = cube[0][8]
	#blue
	new_cube = anti_rotate(new_cube, 3)
	#orange
	new_cube[4][0] = cube[5][8]
	new_cube[4][3] = cube[5][5]
	new_cube[4][6] = cube[5][2]
	#yellow
	new_cube[5][2] = cube[2][2]
	new_cube[5][5] = cube[2][5]
	new_cube[5][8] = cube[2][8]

	return new_cube

def left(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][0] = cube[4][8]
	new_cube[0][3] = cube[4][5]
	new_cube[0][6] = cube[4][2]
	#green
	new_cube = rotate(new_cube, 1)
	#red
	new_cube[2][0] = cube[0][0]
	new_cube[2][3] = cube[0][3]
	new_cube[2][6] = cube[0][6]
	#blue
	#orange
	new_cube[4][2] = cube[5][6]
	new_cube[4][5] = cube[5][3]
	new_cube[4][8] = cube[5][0]
	#yellow
	new_cube[5][0] = cube[2][0]
	new_cube[5][3] = cube[2][3]
	new_cube[5][6] = cube[2][6]

	return new_cube

def anti_left(cube):
	new_cube = cube.copy()
	#white
	new_cube[0][0] = cube[2][0]
	new_cube[0][3] = cube[2][3]
	new_cube[0][6] = cube[2][6]
	#green
	new_cube = anti_rotate(new_cube, 1)
	#red
	new_cube[2][0] = cube[5][0]
	new_cube[2][3] = cube[5][3]
	new_cube[2][6] = cube[5][6]
	#blue
	#orange
	new_cube[4][2] = cube[0][6]
	new_cube[4][5] = cube[0][3]
	new_cube[4][8] = cube[0][0]
	#yellow
	new_cube[5][0] = cube[4][8]
	new_cube[5][3] = cube[4][5]
	new_cube[5][6] = cube[4][2]

	return new_cube

def up(cube):
	new_cube = cube.copy()
	#white
	new_cube = rotate(new_cube, 0)
	#green
	new_cube[1][0] = cube[2][0]
	new_cube[1][1] = cube[2][1]
	new_cube[1][2] = cube[2][2]
	#red
	new_cube[2][0] = cube[3][0]
	new_cube[2][1] = cube[3][1]
	new_cube[2][2] = cube[3][2]
	#blue
	new_cube[3][0] = cube[4][0]
	new_cube[3][1] = cube[4][1]
	new_cube[3][2] = cube[4][2]
	#orange
	new_cube[4][0] = cube[1][0]
	new_cube[4][1] = cube[1][1]
	new_cube[4][2] = cube[1][2]
	#yellow

	return new_cube

def anti_up(cube):
	new_cube = cube.copy()
	#white
	new_cube = anti_rotate(new_cube, 0)
	#green
	new_cube[1][0] = cube[4][0]
	new_cube[1][1] = cube[4][1]
	new_cube[1][2] = cube[4][2]
	#red
	new_cube[2][0] = cube[1][0]
	new_cube[2][1] = cube[1][1]
	new_cube[2][2] = cube[1][2]
	#blue
	new_cube[3][0] = cube[2][0]
	new_cube[3][1] = cube[2][1]
	new_cube[3][2] = cube[2][2]
	#orange
	new_cube[4][0] = cube[3][0]
	new_cube[4][1] = cube[3][1]
	new_cube[4][2] = cube[3][2]
	#yellow

	return new_cube

def down(cube):
	new_cube = cube.copy()
	#white
	#green
	new_cube[1][6] = cube[4][6]
	new_cube[1][7] = cube[4][7]
	new_cube[1][8] = cube[4][8]
	#red
	new_cube[2][6] = cube[1][6]
	new_cube[2][7] = cube[1][7]
	new_cube[2][8] = cube[1][8]
	#blue
	new_cube[3][6] = cube[2][6]
	new_cube[3][7] = cube[2][7]
	new_cube[3][8] = cube[2][8]
	#orange
	new_cube[4][6] = cube[3][6]
	new_cube[4][7] = cube[3][7]
	new_cube[4][8] = cube[3][8]
	#yellow
	new_cube = rotate(new_cube, 5)

	return new_cube

def anti_down(cube):
	new_cube = cube.copy()
	#white
	#green
	new_cube[1][6] = cube[2][6]
	new_cube[1][7] = cube[2][7]
	new_cube[1][8] = cube[2][8]
	#red
	new_cube[2][6] = cube[3][6]
	new_cube[2][7] = cube[3][7]
	new_cube[2][8] = cube[3][8]
	#blue
	new_cube[3][6] = cube[4][6]
	new_cube[3][7] = cube[4][7]
	new_cube[3][8] = cube[4][8]
	#orange
	new_cube[4][6] = cube[1][6]
	new_cube[4][7] = cube[1][7]
	new_cube[4][8] = cube[1][8]
	#yellow
	new_cube = anti_rotate(new_cube, 5)

	return new_cube



def calcValue(cube):
	value = 0.0
	for i in range(6):
		for j in range(9):
			if (cube[i][j] == i):
				value += 1
	return value

def getNeighbors(cube):
	neighbor = np.zeros((12, 6, 9), dtype = int)
	neighbor[0] = front(cube.copy())
	neighbor[1] = anti_front(cube.copy())
	neighbor[2] = back(cube.copy())
	neighbor[3] = anti_back(cube.copy())
	neighbor[4] = right(cube.copy())
	neighbor[5] = anti_right(cube.copy())
	neighbor[6] = left(cube.copy())
	neighbor[7] = anti_left(cube.copy())
	neighbor[8] = up(cube.copy())
	neighbor[9] = anti_up(cube.copy())
	neighbor[10] = down(cube.copy())
	neighbor[11] = anti_down(cube.copy())
	
	return neighbor

def schedule(t):
	return 1 / t


#make decision approach 2:
def simulatedAnealing(cube, neighbors):
	initial_value = calcValue(cube)
	value_of_neighbors = np.zeros((12), dtype = int)
	result = -1
	i = rnd.randint(0, 11)
	value_of_neighbors[i] = calcValue(neighbors[i])
	delta = value_of_neighbors[i] - initial_value
	prob = np.exp(delta / schedule(my_timer))
	if delta > 0:
		result = i
	else:
		random_choice = rnd.random()
		if (random_choice < prob):
			result = i
	return result
		
	




##########################################################
def main():
	global my_timer
	moves = ["F", "F'", "B", "B'", "R", "R'", "L", "L'", "U", "U'", "D", "D'"]
	rubik_cube = np.zeros((6, 9), dtype = int)
	for i in range(6):
		k = 0
		for j in range(3):
			temp = input().split(' ')
			rubik_cube[i][k] = int(temp[0]) - 1
			rubik_cube[i][k + 1] = int(temp[1]) - 1
			rubik_cube[i][k + 2] = int(temp[2]) - 1
			k += 3
		if i < 5:
			input()
	#print(rubik_cube)
	solution = ""
	p_counter = 0
	p_x = []
	p_y = []
	while calcValue(rubik_cube) < 54 and p_counter < 50000:
		p_counter += 1
		my_timer += 1
		neighbors = getNeighbors(rubik_cube.copy())
		target_neighbor_index = simulatedAnealing(rubik_cube.copy(), neighbors.copy())
		p_x.append(p_counter)
		p_y.append(calcValue(rubik_cube))
		if target_neighbor_index < 0:
			continue
		else:
			rubik_cube = neighbors[target_neighbor_index]
			solution += moves[target_neighbor_index] + " "
		
	plt.plot(p_x, p_y)
	plt.show()
	print(solution)

##################################################################################################################################################################################################################################################################################################################################################################################################################################################################
my_timer = 1
main()