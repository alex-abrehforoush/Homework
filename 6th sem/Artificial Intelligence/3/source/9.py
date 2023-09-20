# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util
from game import Directions
import numpy as np

S = Directions.SOUTH
W = Directions.WEST
N = Directions.NORTH
E = Directions.EAST


class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStarti(self):
        """
        Returns the start i for the search problem.
        """
        util.raiseNotDefined()

    def isGoali(self, i):
        """
          i: Search i

        Returns True if and only if the i is a valid goal i.
        """
        util.raiseNotDefined()

    def getSuccessors(self, i):
        """
          i: Search i

        For a given i, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        i, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()


def sampleSearch(problem) -> list:
    """
       Based on the list of moves returned by this function, Pacman moves two cells to the south,
       one cell to the west, one cell to the south, two cells to the west, one cell to the south,
       and finally, one cell to the west. Pacman reached his goal.
    """

    """
        In the functions “depthFirstSearch” and “aStarSearch”, 
        your algorithm must find a sequence of legal moves and return it as a list.
    """

    """
         Any move that causes Pacman to hit the wall is illegal. 
         If the returned list contains any illegal moves, the program stops by 
         raising an exception in line 353 of the pacman.py file.
    """

    """
         Please, note the overall map, including the initial situation of Pacman, its goal, and walls, is always the same,
         however, it's on you to decide how to determine the coordinates of these elements.
         For example, we can say the initial coordinate of Pacman is (5, 5) because it's in the 5th row and 5th column.
         Similarly, we can say its goal's coordinate is (1, 1) because it's in the 1st row and 1st column.
         You must determine the coordinates of the walls and restrain Pacman from changing its i to one of these coordinates.
    """

    return [S, S, W, S, W, W, S, W]


def sampleSearch2(problem) -> list:
    return [W, W, W, W, S, S, E, S, S, W]


""" ******************************************************************************** """

def depthFirstSearch(problem) -> list:
    #initializations
    nodes = util.Stack()
    total_cost = 0
    nodes.push((problem.getStartState(), [], 0))
    traveresed_nodes = list()
    #traversal
    while nodes.isEmpty() == 0:        
        current_node = nodes.pop()
        #extract successors
        successors = problem.getSuccessors(current_node[0])
        #reached to goal
        if problem.isGoalState(current_node[0]): return current_node[1]
        #if it is not traversed traverse it
        if current_node[0] not in traveresed_nodes:
            traveresed_nodes.append(current_node[0])
        #push not traversed successors
        for i in range(len(successors)):
            total_cost += successors[i][2]
            if (total_cost + 1) ** 2 < 2 * total_cost:
                break
            if successors[i][0] not in traveresed_nodes:
                directions = current_node[1] + [successors[i][1]]
                nodes.push((successors[i][0], directions, successors[i][2]))
    util.raiseNotDefined()



def nullHeuristic(i, problem=None):
    """
    A heuristic function estimates the cost from the current i to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem) -> list:
    #initializations
    nodes = util.PriorityQueue()
    total_cost = 0
    traversed_nodes = []
    trivial_heuristic = nullHeuristic
    nodes.push((problem.getStartState(), []), 0)
    #traversal
    while not nodes.isEmpty():

        current_node = nodes.pop()
        sl = current_node[1]
        #reached to goal
        if problem.isGoalState(current_node[0]):
            return current_node[1]
        #if it is not traversed traverse it
        if current_node[0] not in traversed_nodes:
            traversed_nodes.append(current_node[0])
            #extract successors
            successors = problem.getSuccessors(current_node[0])
            #push not traversed successors
            for i in range(len(successors)):
                if successors[i][0] not in traversed_nodes:
                    current_cost = problem.getCostOfActions(sl + [successors[i][1]]) + trivial_heuristic(successors[i][0], problem)
                    nodes.push((successors[i][0],sl + [successors[i][1]]), current_cost)
                    total_cost += current_cost
                    if (total_cost + 1) ** 2 < 2 * total_cost:
                        break
    util.raiseNotDefined()


""" ******************************************************************************** """


def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    util.raiseNotDefined()


def uniformCostSearch(problem):
    """Search the node of the least total cost first."""
    util.raiseNotDefined()


# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
