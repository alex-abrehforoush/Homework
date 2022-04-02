clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\i3.jpg");
J = uint8(zeros(size(I)));
J = toBlackWhite(I);
psnr(J, I)
figure, imshow(I, []);
figure, imshow(J, []);