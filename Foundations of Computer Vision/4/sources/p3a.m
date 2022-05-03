clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
temp = imread("images\Q3\Puzzle_1_40\Corner_1_1.tif");
r = size(temp, 1);
temp = imread("images\Q3\Puzzle_1_40\Shuffled_Patches.tif");
row = size(temp, 1);
column = size(temp, 2);
number_of_pieces = (row / r) * (column / r) - 4;
C11 = imread("images\Q3\Puzzle_1_40\Corner_1_1.tif");
C18 = imread("images\Q3\Puzzle_1_40\Corner_1_8.tif");
C51 = imread("images\Q3\Puzzle_1_40\Corner_5_1.tif");
C58 = imread("images\Q3\Puzzle_1_40\Corner_5_8.tif");
J = uint8(zeros(row, column, 3));
J(1: r, 1: r, :) = C11;
J(1: r, column - r + 1: column, :) = C18;
J(row - r + 1: row, 1: r, :) = C51;
J(row - r + 1: row, column - r + 1: column, :) = C58;

patches = uint8(zeros(number_of_pieces, r, r, 3));
for i = 1: number_of_pieces
    patches(i, :, :, :) = imread(['images\Q3\Puzzle_1_40\' 'Patch_' num2str(i) '.tif']);
end
solution = zeros(row / r, column / r);
for i = 1: r: row
    for j = 1: r: column
        if (((i == 1) && (j == 1)) || ((i == row - r + 1) && (j == 1)) || ((i == 1) && (j == column - r + 1)) || ((i == row - r + 1) && (j == column - r + 1)))
            continue;
        end
        if (i == 1)
            base = J(i: i + r - 1, j - r: j - 1, :);
            values = uint32(zeros(1, number_of_pieces));
            for k = 1: number_of_pieces
                values(k) = borderDiff(rgb2gray(base), rgb2gray(squeeze(patches(k, :, :, :))), 1);
            end
            [min_value, min_index] = min(values);
            J(i: i + r - 1, j: j + r - 1, :) = patches(min_index, :, :, :);
            solution(ceil(i / r), ceil(j / r)) = min_index;
            imshow(J, []);
        else
            base = J(i - r: i - 1, j: j + r - 1, :);
            values = uint32(zeros(1, number_of_pieces));
            for k = 1: number_of_pieces
                values(k) = borderDiff(rgb2gray(base), rgb2gray(squeeze(patches(k, :, :, :))), 0);
            end
            if (j > 1)
                base = J(i: i + r - 1, j - r: j - 1, :);
                for k = 1: number_of_pieces
                    values(k) = values(k) + borderDiff(rgb2gray(base), rgb2gray(squeeze(patches(k, :, :, :))), 1);
                end
            end
            [min_value, min_index] = min(values);
            J(i: i + r - 1, j: j + r - 1, :) = patches(min_index, :, :, :);
            solution(ceil(i / r), ceil(j / r)) = min_index;
            imshow(J, []);
        end
    end
end

