clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%
I = imread("images\lena.gif");
rf = 0.3;
J = My_Imresize_BL(I, rf);
figure, imshow(I, []);
figure, imshow(J, []);