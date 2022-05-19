function number_of_cells = countCells(I)
%COUNTCELLS Summary of this function goes here
%   Detailed explanation goes here
    J = I;
    map = I;
    number_of_cells = 0;
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            if (J(i, j) == 1)
                number_of_cells = number_of_cells + 1;
                J = countRemoveCell(i, j, J, number_of_cells);
            end
        end
    end
end

