clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%
I = imread("images\i3b.png");
J = floydSteinberg(I);
K = toBlackWhite(I);

fs_psnr = psnr(J, I);
bw_psnr = psnr(K, I);

figure, imshow(I, []);
figure, imshow(J, []);
figure, imshow(K, []);

