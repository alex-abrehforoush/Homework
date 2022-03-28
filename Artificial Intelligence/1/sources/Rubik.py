import numpy as np
def rotate(cube, i):
	new_cube = cube
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
	new_cube = cube
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


#define functions (moves)
def front(cube):
	new_cube = cube
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
	new_cube = cube
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
	
def anti_back(cube):
	new_cube = cube
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
	
def back(cube):
	new_cube = cube
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

def right(cube):
	new_cube = cube
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
	new_cube = cube
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

#define cube
rubik_cube = np.zeros((6, 9), dtype = int)
# 0_white
# 1_green
# 2_red
# 3_blue
# 4_orange
# 5_yellow

# for i in range(6):
# 	temp