import numpy as np
import random as rnd
import math
from matplotlib import pyplot as plt

def getNeighbors(colors, v):
    neighbors = []
    for i in range(v):
        for j in range(v):
            current = colors.copy()
            if colors[i] != j:
                current[i] = j
                neighbors.append(current)
    return neighbors

def calcValue(colors, adjacency_matrix, v, e):
    value = 0
    penalty = e / 2
    for i in range(v):
        if (i in colors):
            continue
        else:
            value += 1
    for i in range(v):
        for j in range(v):
            if (adjacency_matrix[i][j] == 1 and colors[i] == colors[j]):
                value += penalty
    return value
    



def main():
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
    neighbors = getNeighbors(colors, v)
    print(neighbors)


##############
main()