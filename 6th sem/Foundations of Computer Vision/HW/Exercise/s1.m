clc
clear
close all
f = fopen("img/pic1.pgm");
file_contant = fread(f, "uint8");
image_data = file_contant(18:end);
I = zeros(3456, 5184);
k = 1;
for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        I(i, j) = image_data(k);
        k = k + 1;
    end
end
imshow(I, []);
fclose(f);