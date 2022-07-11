%clearing command window and workspace and closing all open figures
clc
clear
close all
%reading image and storing it in a matrix
I = imread("img\pic4.jpg");
D = im2double(I);
%extracting rgb colors
R = I(:, :, 1);
G = I(:, :, 2);
B = I(:, :, 3);

% % showing original image
% imshow(I, []);
% % showing extracted rgb images in grayscale in seperate figure
% figure, imshow([R G B], []);

% %concating rgb channels to make the original picture
% J = cat(3, R, G, B);
% imshow(J);

% %swapping different channels
% J_1 = cat(3, G, R, B);
% J_2 = cat(3, R, B, G);
% J_3 = cat(3, B, G, R);
% figure, imshow([I J_1; J_2 J_3], []);

% %generating negative images
% R_N = 255 - R;
% G_N = 255 - G;
% B_N = 255 - B;
% I_N = cat(3, R_N, G_N, B_N);
% figure, imshow([I I_N], []);

% %convert to grayscale(uint)
% I_GS = (R + G + B) / 3;
% figure, imshow(I_GS, []);

% %convert to grayscale(double)
% I_GS = (im2double(R) + im2double(G) + im2double(B)) / 3;
% figure, imshow(I_GS, []);

% %grayscale to black and white
% K = rgb2gray(im2double(I));
% BW_1 = K > 0.2;
% BW_2 = K > 0.4;
% BW_3 = K > 0.8;
% figure, imshow([K BW_1 BW_2 BW_3], []);

% %flip horizontal
% I_FH = D;
% for j = 1: size(D, 2)
%     I_FH(:, size(D, 2) - j + 1, :) = D(:, j, :);
% end
% imshow([D I_FH; I_FH D], []);

% a circle in center of image
% R1 = 500;
% L = D;
% for i = 1: size(D, 1)
%     for j = 1: size(D, 2)
%         %if round(sqrt((i - size(D, 1) / 2) ^ 2 + (j - size(D, 2) / 2) ^ 2)) >= R1
%         %if round(sqrt((i - size(D, 1) / 2) ^ 2 + (j - size(D, 2) / 2) ^ 2)) == R1
%         if round(sqrt((i - size(D, 1) / 2) ^ 2 + (j - size(D, 2) / 2) ^ 2)) <= R1
%             L(i, j, 1) = 0;
%             L(i, j, 2) = 0;
%             L(i, j, 3) = 0;
%         end
%     end
% end
% figure, imshow(L, []);

% %cropping
% w1 = 300;
% w2 = 800;
% l1 = 800;
% l2 = 1100;
% M = D(w1: w2, l1: l2, :);
% figure, imshow(M, []);

%writing in file
% R1 = 500;
% O = [400, 800];
% L = D;
% for i = 1: size(D, 1)
%     for j = 1: size(D, 2)
%         if round(sqrt((i - O(1)) ^ 2 + (j - O(2)) ^ 2)) == R1
%             L(i, j, 1) = 1;
%             L(i, j, 2) = 0;
%             L(i, j, 3) = 0;
%         end
%     end
% end
% imwrite(L, "img\mypic.jpg");