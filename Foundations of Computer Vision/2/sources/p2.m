%clearing command window and workspace and closing all open figures
clc
clear
close all
imtool close all
%reading image data
I = imread("images\Test_01.ppm");
%defining variables
row = size(I, 1);
column = size(I, 2);
ellipse_height = 800;
ellipse_width = 400;
rhombus_height = 400;
rhombus_width = 200;
%generating grayscale image
J = uint8(zeros(row, column, 3));
J(:, :, 1) = rgb2gray(I);
J(:, :, 2) = rgb2gray(I);
J(:, :, 3) = rgb2gray(I);
%making an ellipse at center of image
a = ellipse_width / 2;
b = ellipse_height / 2;
for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        x = column / 2 - j;
        y = row / 2 - i;
        if (x ^ 2) / (a ^ 2) + (y ^ 2) / (b ^ 2) <= 1
            J(i, j, 1) = 255;
            J(i, j, 2) = 0;
            J(i, j, 3) = 0;
        end
    end
end
%making rhombus at the center of image
for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        if (round(abs(i - size(I, 1) / 2)) <= rhombus_width) && (round(abs(j - size(I, 2) / 2)) <= rhombus_height) && (round(abs(i - size(I, 1) / 2) * (rhombus_width / 2) + abs(j - size(I, 2) / 2) * (rhombus_height / 2)) <= rhombus_width * rhombus_height / 4)                                                       
            J(i, j, 1) = I(i, j, 1);
            J(i, j, 2) = I(i, j, 2);
            J(i, j, 3) = I(i, j, 3);
        end
    end
end
figure, imshow(J, []);