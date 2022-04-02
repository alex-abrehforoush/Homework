clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%
I = imread("images\LR_House.png");
J = imread("images\House.png");
sz = size(J, 1);
X = uint8(zeros(sz, sz, 3, 8));
z = X(1);
X(:, :, :, 1) = imresize(I, 2, "bilinear");
tic
X(:, :, :, 2) = imresize(I, 2, "bicubic");
toc
X(:, :, :, 3) = imresize(I, 2, "box");
X(:, :, :, 4) = imresize(I, 2, "cubic");
X(:, :, :, 5) = imresize(I, 2, "lanczos2");
X(:, :, :, 6) = imresize(I, 2, "lanczos3");
X(:, :, :, 7) = imresize(I, 2, "nearest");
X(:, :, :, 8) = imresize(I, 2, "triangle");

psnrs = zeros(1, 8);
for i = 1: 8
    psnrs(i) = psnr(X(:, :, :, i), J);
end
psnrs
%%%%%%%
% for j = 1: size(K, 2) - 1
%     K(1, j, :) = I(1, j, :);
%     K(size(K, 1), j, :) = I(size(K, 1), j, :);
%     K(size(K, 1) - 1, j, :) = I(size(K, 1) - 1, j, :);
% end
% for i = 1: size(K, 1)
%     K(i, 1, :) = I(i, 1, :);
%     K(i, size(K, 2), :) = I(i, size(K, 2), :);
%     K(i, size(K, 2) - 1, :) = I(i, size(K, 2) - 1, :);
% end
%%%%%%%
