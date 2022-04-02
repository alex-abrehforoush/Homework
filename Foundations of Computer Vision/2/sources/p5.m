clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%
I = imread("images\Peppers.png");
J = imread("images\LR_Peppers.png");
tic
K = doubleDimensions(J);
toc

imtool(I)
imtool(K)
psnr(K, I)