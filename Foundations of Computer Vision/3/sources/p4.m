clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\Q4\Bridge.tif");
psnr_values = [];
%my algorithm
for d = 0.1: 0.1: 0.9
    J = imnoise(I, 'salt & pepper', d);
    K = removeNoise(J);
%     figure, imshow(I, []);
%     figure, imshow(J, []);
%     figure, imshow(K, []);
    psnr_values(end + 1) = psnr(K, I);
end
psnr_values
mean(psnr_values)