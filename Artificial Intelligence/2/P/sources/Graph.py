import numpy as np
import random as rnd
import time as tm
import math
from matplotlib import pyplot as plt

def getPossibleNeighbors(colors, adjacency_matrix, v):
    neighbors = []
    for i in range(v):
        for j in range(v):
            current = colors.copy()
            if colors[i] != j:
                current[i] = j
                possible = 1
                for k in range(v):
                    for l in range(k + 1, v):
                        if (k != l and current[k] == current[l] and adjacency_matrix[k][l] == 1):
                            possible = 0
                            break
                    if (possible == 0):
                        break
                if (possible):
                    neighbors.append(current)
    return neighbors

def calcValue(colors, v):#number of used colors
    value = 0
    not_used_color = 0
    for i in range(v):
        if (i in colors):
            continue
        else:
            not_used_color += 1
    value = v - not_used_color
    return value

def sls(colors, adjacency_matrix, v):
    neighbors = getPossibleNeighbors(colors, adjacency_matrix, v)
    values = [calcValue(i, v) for i in neighbors]
    if not values:
        return colors
    else:
        best_response = np.amin(values)
        best_index = values.index(best_response)
        return neighbors[best_index]


def main():
    global start_time
    input_string = input().split(' ')
    v = int(input_string[0])
    e = int(input_string[1])
    adjacency_matrix = [[0 for i in range(v)] for j in range(v)]
    for i in range(e):
        input_string = input().split(' ')
        v1 = int(input_string[1]) - 1
        v2 = int(input_string[2]) - 1
        adjacency_matrix[v1][v2] = 1
        adjacency_matrix[v2][v1] = 1
    colors = [i for i in range(v)]
    while(tm.time() - start_time <= 60):
        colors = sls(colors, adjacency_matrix, v)
    print(colors)
    print(calcValue(colors, v))


##############
start_time = tm.time()

main()