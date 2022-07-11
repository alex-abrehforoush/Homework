clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("C:\Users\Alireza\Desktop\ccc.jpg");
J = uint8(zeros(size(I)));
K = uint8(zeros(size(I)));

for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        J(i, j, 1) = round(double(I(i, j, 1)) / 3 + double(I(i, j, 2) / 3) + double(I(i, j, 3) / 3));
        if(255 - J(i, j, 1) <= J(i, j, 1))
            K(i, j, 1) = 255;
        else
            K(i, j, 1) = 0;
        end
    end
end
J(:, :, 2) = J(:, :, 1);
J(:, :, 3) = J(:, :, 1);

K(:, :, 2) = K(:, :, 1);
K(:, :, 3) = K(:, :, 1);
psnr(J, I)
psnr(K, I)
figure, imshow(I, []);
figure, imshow(J, []);
figure, imshow(K, []);