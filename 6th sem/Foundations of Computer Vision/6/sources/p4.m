clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
min_radius = 30;
max_radius = 50;
thresh = 15;
%%%%%%%%%%%%1_test.tif
I = imread("images\Q4\DRIVE\Test\images\1_test.tif");
%%%%%%%%low-pass filter
lowed_I = I;
lowed_I = imfilter(lowed_I, fspecial('average', 5));
%%%%%%%%removing noise and thresholding
level = multithresh(lowed_I(:, :, 1), thresh);
lowed_I = imopen(lowed_I, strel('disk', 7));
lowed_I = imclose(lowed_I, strel('disk', 7));
K = lowed_I(:, :, 1) > level(thresh);
%%%%%%%%extracting edges
K = imgradient(K);
%%%%%%%%finding centers
centers = double(zeros([size(I, 1) size(I, 2) max_radius]));
for radius = min_radius: max_radius
    centers(:, :, radius) = findCenters(K, radius);
end
max_centers = find(centers == max(centers(:)));
[x_i y_i r_i] = ind2sub(size(centers), max_centers);
RGB_i = insertShape(I, 'circle', [round(mean(y_i)) round(mean(x_i)) round(mean(r_i))], 'LineWidth', 2);
figure, imshow(I, []);
figure, imshow(RGB_i, []);
[round(mean(y_i)) round(mean(x_i))]

%%%%%%%%%%%25_training.tif
J = imread("images\Q4\DRIVE\Training\images\25_training.tif");
%%%%%%%%low-pass filter
lowed_J = J;
lowed_J = imfilter(lowed_J, fspecial('average', 5));
%%%%%%%%removing noise and thresholding
level = multithresh(lowed_J(:, :, 1), thresh);
lowed_J = imopen(lowed_J, strel('disk', 7));
lowed_J = imclose(lowed_J, strel('disk', 7));
L = lowed_J(:, :, 1) > level(thresh);
%%%%%%%%extracting edges
L = imgradient(L);
%%%%%%%%finding centers
centers = double(zeros([size(J, 1) size(J, 2) max_radius]));
for radius = min_radius: max_radius
    centers(:, :, radius) = findCenters(L, radius);
end
max_centers = find(centers == max(centers(:)));
[x_j y_j r_j] = ind2sub(size(centers), max_centers);
RGB_j = insertShape(J, 'circle', [round(mean(y_j)) round(mean(x_j)) round(mean(r_j))], 'LineWidth', 2);
figure, imshow(J, []);
figure, imshow(RGB_j, []);
[round(mean(y_j)) round(mean(x_j))]