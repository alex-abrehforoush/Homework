%clearing command window and workspace and closing all open figures
clc
clear
close all
imtool close all
%reading image data
I = imread("images\Test_01.ppm");
theta = 220;
J = rotateImage(I, theta);
figure, imshow(J, []);