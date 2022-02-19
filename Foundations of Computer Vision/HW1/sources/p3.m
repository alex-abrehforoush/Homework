%clearing command window and workspace and closing all open figures
clc
clear
close all
%reading image data
I = imread("images\Test_01.ppm");
%defining variables
row = 852;
column = 1282;
theta = 60;

J = zeros(row, column, 3);
for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        [i_p, j_p] = rotatePixel(i, j, theta);
        J(i_p, j_p, 1) = I(i, j, 1);
        J(i_p, j_p, 2) = I(i, j, 2);
        J(i_p, j_p, 3) = I(i, j, 3);
    end
end
imshow(J, []);