clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\i3.jpg");
J = uint8(zeros(size(I)));

for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        J(i, j, 1) = round(double(I(i, j, 1)) / 3 + double(I(i, j, 2) / 3) + double(I(i, j, 3) / 3));
    end
end
J(:, :, 2) = J(:, :, 1);
J(:, :, 3) = J(:, :, 1);

K = toBlackWhite(I);
psnr(K, I)

figure, imshow(I, []);
figure, imshow(K, []);