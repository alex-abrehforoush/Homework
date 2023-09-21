%clearing command window and workspace and closing all open figures
clc
clear
close all
imtool close all
%opening image file and reading its content
f = fopen("images/Test_01.ppm");
file_content = fread(f, "uint8");
%removing ppm header from file_content
image_data = file_content(17:end);
%defining row and column
row = 852;
column = 1282;
%extracting rgb from image_data
R1D = image_data(1:3:end);
G1D = image_data(2:3:end);
B1D = image_data(3:3:end);
%converting 1D rgb to 2D rgb
R2D = uint8(zeros(row, column));
G2D = uint8(zeros(row, column));
B2D = uint8(zeros(row, column));
k = 1;
for i = 1: row
    for j = 1: column
        R2D(i, j) = R1D(k);
        G2D(i, j) = G1D(k);
        B2D(i, j) = B1D(k);
        k = k + 1;
    end
end
%concatenating rgb to create the original image
I = cat(3, R2D, G2D, B2D);
J = imread("images\Test_01.ppm");
subplot(1, 2, 1);
imshow(I, []);
title("not using imread");
subplot(1, 2, 2);
imshow(J, []);
title("using imread");
fclose(f);