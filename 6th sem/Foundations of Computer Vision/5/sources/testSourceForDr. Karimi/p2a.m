clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\Q2\Cells.tif");
level = multithresh(I, 2);
J = double(I >= level(1));
%figure, imshow(J, []);
se = strel('disk', 5);
K = imerode(J, se);
%figure, imshow(K, []);
x = countCells(J)
y = max(max(bwlabel(J)))
z = countCells(K)
w = max(max(bwlabel(K)))