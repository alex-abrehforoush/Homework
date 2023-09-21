clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\i3b.png");
J = floydSteinberg(I);
figure, imshow(I, []);
figure, imshow(J, []);
x = I(:, :, 1);
y = J(:, :, 1);