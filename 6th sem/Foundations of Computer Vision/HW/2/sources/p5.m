clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%
I = imread("images\Cameraman.png");
J = imread("images\LR_Cameraman.png");
nn = imresize(J, 2, "nearest");
bil = imresize(J, 2, "bilinear");
bic = imresize(J, 2, "bicubic");

tic
K = doubleDimensions(J);
toc

[psnr(nn, I) psnr(bil, I) psnr(bic, I) psnr(K, I)]
imtool(I)
imtool(K)