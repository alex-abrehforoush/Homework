clc
clear
%close all
%imtool close all
%%%%%%%%%%%%%%%%
n = 20;
path1 = 'images\Q3\DRIVE\Test\';
path2 = 'images\Q3\DRIVE\Training\';
path = path1;
temp1 = imread([path 'images\1_test.tif']);
temp2 = imread([path '1st_manual\1_manual1.gif']);
images = uint8(zeros([n size(temp1)]));
first_manual = uint8(zeros([n size(temp2)]));
second_manual = uint8(zeros([n size(temp2)]));
mask = uint8(zeros([n size(temp2)]));
for i = 1: n
    images(i, :, :, :) = imread([path 'images\' num2str(i) '_test.tif']);
    first_manual(i, :, :, :) = imread([path '1st_manual\' num2str(i) '_manual1.gif']);
    %second_manual(i, :, :, :) = imread([path '2nd_manual\' num2str(i) '_manual2.gif']);
    mask(i, :, :, :) = imread([path 'mask\' num2str(i) '_test_mask.gif']);
end
%%%%%%%%%%%%%%%%%%%%%%%%mask
masked_images = images;
for i = 1: n
    for j = 1: size(masked_images(i, :, :, :), 2)
        for k = 1: size(masked_images(i, :, :, :), 3)
            if (mask(i, j, k) == 0)
                masked_images(i, j, k, 1) = 0;
                masked_images(i, j, k, 2) = 0;
                masked_images(i, j, k, 3) = 0;
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%enhancing lines in 12 directions using opening operation
linearly_opened_images = masked_images;
for i = 1: n
    for j = 1: 15: 180
        se = strel('line', 7, j);
        linearly_opened_images(i, :, :, :) = imopen(squeeze(linearly_opened_images(i, :, :, :)), se);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%sharpening
sharped_images = linearly_opened_images;
for i = 1: n
    sharped_images(i, :, :, :) = imsharpen(squeeze(sharped_images(i, :, :, :)), 'Radius', 1, 'Amount', 5);
end
%%%%%%%%%%%%%%%%%%%%%%%%thresholding
threshold_images = sharped_images;
% for i = 1: n
%     S = imfilter(squeeze(threshold_images(i, :, :, :)), fspecial('average', [21 21]));
%     K = 0.93;
%     T = K * S;
%     threshold_images(i, :, :, :) = squeeze(threshold_images(i, :, :, :)) < T;
% end
%%%%%%%%%%%%%%%%%%%%%%%reduce noise
% noise_canceled_images = threshold_images;
% se = strel('line', 6, 0);
% for i = 1: n
%     noise_canceled_images(i, :, :, :) = imdilate(squeeze(noise_canceled_images(i, :, :, :)), se);
% end
% %
% for i = 1: n
%     noise_canceled_images(i, :, :, 1) = medfilt2(squeeze(noise_canceled_images(i, :, :, 1)), [3 3]);
%     noise_canceled_images(i, :, :, 2) = medfilt2(squeeze(noise_canceled_images(i, :, :, 2)), [3 3]);
%     noise_canceled_images(i, :, :, 3) = medfilt2(squeeze(noise_canceled_images(i, :, :, 3)), [3 3]);
% end
%%%%%%%%%%%%%%%%%%%%%%%mask
masked_images = threshold_images;
for i = 1: n
    for j = 1: size(masked_images(i, :, :, :), 2)
        for k = 1: size(masked_images(i, :, :, :), 3)
            if (mask(i, j, k) == 0)
                masked_images(i, j, k, 1) = 0;
                masked_images(i, j, k, 2) = 0;
                masked_images(i, j, k, 3) = 0;
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%reduce noise
noise_canceled_images = masked_images;

%%%%%%%%%%%%%%%%%%%%%%%kmeans
kmeans_images = masked_images;
k = 8;
for i = 1: n
    kmeans_images(i, :, :, 1) = imsegkmeans(squeeze(kmeans_images(i, :, :, 1)), k);
    kmeans_images(i, :, :, 2) = imsegkmeans(squeeze(kmeans_images(i, :, :, 2)), k);
    kmeans_images(i, :, :, 3) = imsegkmeans(squeeze(kmeans_images(i, :, :, 3)), k);
    imwrite(imadjust(squeeze(kmeans_images(i, :, :, 2))), ['images\Q3_results\' num2str(i) '(' num2str(k) ').tif']);
end


final_images = noise_canceled_images;
%%%%%%%%%%%%%%%%%%%%%%%calc parameters
sensitivity = double(zeros([1 n]));
specificity = double(zeros([1 n]));
accuracy = double(zeros([1 n]));
for i = 1: n
    [tp, tn, fp, fn] = calcParameters(squeeze(final_images(i, :, :, 2)), squeeze(first_manual(i, :, :)));
    sensitivity(i) = double(tp / (tp + fn));
    specificity(i) = double(tn / (tn + fp));
    accuracy(i) = double((tp + tn) / (tp + tn + fp + fn));
end
sen_mean = mean(sensitivity)
spe_mean = mean(specificity)
acc_mean = mean(accuracy)
% sensitivity
% specificity
% accuracy