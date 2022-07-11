clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%
I = imread("images\Image.tif");
gamma = 1.2;
alpha = double(255) ^ (1 - gamma);
for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        if(I(i, j) <= 127)
            J(i, j) = uint8(round(31.875 * log(double(I(i, j)) + 1)));
        else
            J(i, j) = uint8(round(alpha * double(I(i, j)) ^ gamma));
        end
    end
end
imtool(imadjust(J));