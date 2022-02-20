%clearing command window and workspace and closing all open figures
clc
clear
close all
%reading image data
I = imread("images\Test_01.ppm");
%defining variables
row = size(I, 1);
column = size(I, 2);
theta = 280;
new_row = ceil(abs(column * sind(theta)) + abs(row * cosd(theta)));
new_column = ceil(abs(row * sind(theta)) + abs(column * cosd(theta)));
%enlarging the dimensions
K = uint8(zeros(new_row, new_column, 3));
for i = 1: size(K, 1)
    for j = 1: size(K, 2)
        if (i <= round(abs(new_row - row) / 2)) || (j <= round(abs(new_column - column) / 2)) || (i > size(K, 1) - round(abs(new_row - row) / 2)) || (j > size(K, 2) - round(abs(new_column - column) / 2))
            K(i, j, 1) = 0;
            K(i, j, 2) = 0;
            K(i, j, 3) = 0;
        else
            K(i, j, 1) = I(i - round(abs((new_row - row) / 2)), j - round(abs((new_column - column) / 2)), 1);
            K(i, j, 2) = I(i - round(abs((new_row - row) / 2)), j - round(abs((new_column - column) / 2)), 2);
            K(i, j, 3) = I(i - round(abs((new_row - row) / 2)), j - round(abs((new_column - column) / 2)), 3);
        end
    end
end
J = uint8(zeros(new_row, new_column, 3));
for i = 1: size(J, 1)
    for j = 1: size(J, 2)
        [i_p, j_p] = rotatePixel(new_row, new_column, i, j, -1 * theta);
        if (i_p >= 1 && i_p <= new_row) && (j_p >= 1 && j_p <= new_column)
            J(i, j, 1) = K(i_p, j_p, 1);
            J(i, j, 2) = K(i_p, j_p, 2);
            J(i, j, 3) = K(i_p, j_p, 3);
        end
    end
end
imtool(J, []);