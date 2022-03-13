clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\i3b.png");
J = floydSteinberg(I);
K = imread("images\i3b(ground truth).png");
figure, imshow(I, []);
figure, imshow(J, []);
figure, imshow(K, []);
%%

x = I(:, :, 1);
y = J(:, :, 1);
z = K(:, :, 1);