import numpy as np

n = 4;

class Configuration:
    knight_column = 0;
    knight_row = 0;
    is_traversed = np.zeros((n, n));
    path = [];
    def __init__(self, knight_column, knight_row, parent) -> None:
        self.knight_column = knight_column;
        self.knight_row = knight_row;
        if parent != None:
            self.is_traversed = parent.is_traversed.copy();
            self.path = parent.path.copy();
        self.is_traversed[knight_column][knight_row] = 1;
        temp = [];
        temp.append(knight_column);
        temp.append(knight_row);
        self.path.append(temp);
    def getKnightColumn(self):
        return self.knight_column;
    def getKnightRow(self):
        return self.knight_row;
    def getPathLength(self):
        return len(self.path);
    def getNeighbors(self):
        neighbors = [];
        if (0 <= self.knight_column + 1 < n and 0 <= self.knight_row + 2 < n):
            if (self.is_traversed[self.knight_column + 1][self.knight_row + 2] == 0):
                neighbors.append((self.knight_column + 1, self.knight_row + 2, self));

        if (0 <= self.knight_column + 1 < n and 0 <= self.knight_row - 2 < n):
            if (self.is_traversed[self.knight_column + 1][self.knight_row - 2] == 0):
                neighbors.append((self.knight_column + 1, self.knight_row - 2, self));


        if (0 <= self.knight_column - 1 < n and 0 <= self.knight_row + 2 < n):
            if (self.is_traversed[self.knight_column - 1][self.knight_row + 2] == 0):
                neighbors.append((self.knight_column - 1, self.knight_row + 2, self));

        if (0 <= self.knight_column - 1 < n and 0 <= self.knight_row - 2 < n):
            if (self.is_traversed[self.knight_column - 1][self.knight_row - 2] == 0):
                neighbors.append((self.knight_column - 1, self.knight_row - 2, self));



        if (0 <= self.knight_column + 2 < n and 0 <= self.knight_row + 1 < n):
            if (self.is_traversed[self.knight_column + 2][self.knight_row + 1] == 0):
                neighbors.append((self.knight_column + 2, self.knight_row + 1, self));

        if (0 <= self.knight_column + 2 < n and 0 <= self.knight_row - 1 < n):
            if (self.is_traversed[self.knight_column + 2][self.knight_row - 1] == 0):
                neighbors.append((self.knight_column + 2, self.knight_row - 1, self));


        if (0 <= self.knight_column - 2 < n and 0 <= self.knight_row + 1 < n):
            if (self.is_traversed[self.knight_column - 2][self.knight_row + 1] == 0):
                neighbors.append((self.knight_column - 2, self.knight_row + 1, self));

        if (0 <= self.knight_column - 2 < n and 0 <= self.knight_row - 1 < n):
            if (self.is_traversed[self.knight_column - 2][self.knight_row - 1] == 0):
                neighbors.append((self.knight_column - 2, self.knight_row - 1, self));


        return neighbors;


class Board:
    pawns_locations = [];
    root = None;
    optimum_config = (None, 0);
    def __init__(self) -> None:
        self.inputInputs();
    def inputInputs(self):
        t_str = input();
        knight_column = int(t_str.split(' ')[0]) - 1;
        knight_row = int(t_str.split(' ')[1]) - 1;
        self.root = Configuration(knight_column, knight_row, None)
        while (True):
            t_str = input();
            col = int(t_str.split(' ')[0]) - 1;
            row = int(t_str.split(' ')[1]) - 1;
            if (col != -1 or row != -1):
                self.pawns_locations.append((col, row));
            else:
                break;
    def bfsBoard(self):
        optimum_config = float('inf')
        semi_optimum_config = None;
        neighbors = self.root.getNeighbors();
        frontier = [];
        for i in neighbors:
            frontier.append(Configuration(i[0], i[1], self.root));
        children = [];
        while len(frontier):
            children = [];
            for j in frontier:
                attacked_pawns = self.getAttackedPawns(j);
                if attacked_pawns > self.optimum_config[1]:
                    self.optimum_config = (j, attacked_pawns);
                if self.allAttacked(j) == 1:
                    length = j.getPathLength();
                    if (length < optimum_config):
                        optimum_config = length;
                        semi_optimum_config = j;
                else:
                    neighbors = j.getNeighbors();
                    kemp = [];
                    for i in neighbors:
                        kemp.append(Configuration(i[0], i[1], j));
                    children += kemp;
            frontier = children.copy();
        return semi_optimum_config;
    def allAttacked(self, node):
        flag = 1;
        for i in self.pawns_locations:
            if (node.is_traversed[i[0]][i[1]] == 0):
                flag = 0;
            else:
                continue;
        return flag;
    def getAttackedPawns(self, node):
        attacked = 0;
        for i in self.pawns_locations:
            if (node.is_traversed[i[0]][i[1]]):
                attacked = attacked + 1;
        return attacked;

def main():
    game = Board()
    optimum_path = game.bfsBoard();
    if optimum_path != None:
        configs = [];
        for i in optimum_path.path:
            configs.append([(i[0] + 1, i[1] + 1) for i in optimum_path.path]);
    else:
        print('Fail');
        print(game.optimum_config[1]);
        for i in game.optimum_config[0].path:
            configs = [(i[0] + 1, i[1] + 1) for i in game.optimum_config[0].path];
    for i in configs:
        print(str(i[0]) + ' ' + str(i[1]));

main();