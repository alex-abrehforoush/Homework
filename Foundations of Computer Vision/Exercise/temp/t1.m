clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("C:\Users\Alireza\Desktop\ccc.jpg");
J = I(:, :, 1);
K = false(size(J));
for i = 1: size(J, 1)
    for j = 1: size(J, 2)
        if(abs(255 - J(i, j)) >= abs(J(i, j)))
            K(i, j) = 1;
        else
            K(i, j) = 0;
        end
    end
end
figure, imshow(J, []);
figure, imshow(K, []);

