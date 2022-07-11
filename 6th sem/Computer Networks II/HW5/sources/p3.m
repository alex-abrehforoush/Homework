%clearing command window and workspace and closing all open figures
clc
clear
close all
imtool close all
%reading image data
I = imread("images\Test_01.ppm");
%defining variables
row = size(I, 1);
column = size(I, 2);
theta = 245.7;
new_row = ceil(abs(column * sind(theta)) + abs(row * cosd(theta)));
new_column = ceil(abs(row * sind(theta)) + abs(column * cosd(theta)));
J = uint8(zeros(new_row, new_column, 3));
for i = 1: size(J, 1)
    for j = 1: size(J, 2)
        [i_p, j_p] = rotatePixel(row, column, i - round((new_row - row) / 2), j - round((new_column - column) / 2), -1 * theta);
        if (i_p < 1 || i_p > row || j_p < 1 || j_p > column)
            J(i, j, 1) = 0;
            J(i, j, 2) = 0;
            J(i, j, 3) = 0;
        else
            J(i, j, 1) = I(i_p, j_p, 1);
            J(i, j, 2) = I(i_p, j_p, 2);
            J(i, j, 3) = I(i_p, j_p, 3);
        end
    end
end
K = imrotate(I, theta);
MSE = immse(J, K)
imtool(J, []);
imtool(K, []);