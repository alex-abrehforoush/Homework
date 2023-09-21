function saveCellsData(I, filename, path)
%SAVECELLSDATA Summary of this function goes here
%   Detailed explanation goes here
    level = multithresh(I, 4);
    J = double(I >= level(1));
    x = labelCells(J);
    cells_data = zeros(3, max(max(x)));
    cells_data(1, :) = 1: max(max(x));
    for i = 1: max(max(x))
        cells_data(2, i) = sum(sum(x == i));
        cells_data(3, i) = sum(sum((uint8(x == i) .* I))) / cells_data(2, i);
    end
    writematrix(transpose(cells_data), [path '/' filename]);
end

function map = labelCells(I)
%LABELCELLS Summary of this function goes here
%   Detailed explanation goes here
    map = uint32(zeros(size(I)));
    id = 0;
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            if (I(i, j) == 1)
                id = id + 1;
                [I, map] = labelRemoveCell(i, j, I, id, map);
            end
        end
    end
end

function [J, new_map] = labelRemoveCell(i, j, I, id, map)
%labelRemoveCell Summary of this function goes here
%   Detailed explanation goes her
    J = I;
    new_map = map;
    if (J(i, j) == 1)
        J(i, j) = 0;
        new_map(i, j) = id;
        if (i - 1 >= 1)
            [J, new_map] = labelRemoveCell(i - 1, j, J, id, new_map);
            if (j - 1 >= 1)
                [J, new_map] = labelRemoveCell(i - 1, j - 1, J, id, new_map);
                [J, new_map] = labelRemoveCell(i, j - 1, J, id, new_map);
            end
            if (j + 1 <= size(I, 2))
                [J, new_map] = labelRemoveCell(i - 1, j + 1, J, id, new_map);
                [J, new_map] = labelRemoveCell(i, j + 1, J, id, new_map);
            end
        end
        if (i + 1 <= size(I, 1))
            [J, new_map] = labelRemoveCell(i + 1, j, J, id, new_map);
            if (j - 1 >= 1)
                [J, new_map] = labelRemoveCell(i + 1, j - 1, J, id, new_map);
            end
            if (j + 1 <= size(I, 2))
                [J, new_map] = labelRemoveCell(i + 1, j + 1, J, id, new_map);
            end
        end
    end
end