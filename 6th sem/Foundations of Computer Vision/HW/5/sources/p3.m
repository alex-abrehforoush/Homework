clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
n = 20;
path = 'images\Q3\DRIVE\Test\';
temp1 = imread([path 'images\1_test.tif']);
temp2 = imread([path '2nd_manual\1_manual2.gif']);
images = uint8(zeros([n size(temp1)]));
first_manual = uint8(zeros([n size(temp2)]));
second_manual = uint8(zeros([n size(temp2)]));
mask = uint8(zeros([n size(temp2)]));
for i = 1: n
    images(i, :, :, :) = imread([path 'images\' num2str(i) '_test.tif']);
    first_manual(i, :, :, :) = imread([path '1st_manual\' num2str(i) '_manual1.gif']);
    second_manual(i, :, :, :) = imread([path '2nd_manual\' num2str(i) '_manual2.gif']);
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
%%%%%%%%%%%%%%%%%%%%%%%%adaptive thresholding
thresh_images = sharped_images;
for i = 1: n
    S = imfilter(squeeze(thresh_images(i, :, :, :)), fspecial('average', [21 21]));
    K = 0.93;
    T = K * S;
    thresh_images(i, :, :, :) = squeeze(thresh_images(i, :, :, :)) < T;
end
%%%%%%%%%%%%%%%%%%%%%%%reduce noise
noise_canceled_images = thresh_images;
se = strel('line', 6, 0);
for i = 1: n
    noise_canceled_images(i, :, :, :) = imdilate(squeeze(noise_canceled_images(i, :, :, :)), se);
end
%
for i = 1: n
    noise_canceled_images(i, :, :, 1) = medfilt2(squeeze(noise_canceled_images(i, :, :, 1)), [3 3]);
    noise_canceled_images(i, :, :, 2) = medfilt2(squeeze(noise_canceled_images(i, :, :, 2)), [3 3]);
    noise_canceled_images(i, :, :, 3) = medfilt2(squeeze(noise_canceled_images(i, :, :, 3)), [3 3]);
end
%%%%%%%%%%%%%%%%%%%%%%%mask
final_images = noise_canceled_images;
for i = 1: n
    for j = 1: size(final_images(i, :, :, :), 2)
        for k = 1: size(final_images(i, :, :, :), 3)
            if (mask(i, j, k) == 0)
                final_images(i, j, k, 1) = 0;
                final_images(i, j, k, 2) = 0;
                final_images(i, j, k, 3) = 0;
            end
        end
    end
    %imwrite(imadjust(squeeze(final_images(i, :, :, 2))), ['images\Q3_results\1\' num2str(i) '.tif']);
    imwrite(imadjust(squeeze(final_images(i, :, :, 2))), ['images\Q3_results\2\' num2str(i) '.tif']);
end

%%%%%%%%%%%%%%%%%%%%%%%calc parameters
sensitivity = double(zeros([1 n]));
specificity = double(zeros([1 n]));
accuracy = double(zeros([1 n]));
for i = 1: n
    [tp, tn, fp, fn] = calcParameters(squeeze(final_images(i, :, :, 2)), squeeze(second_manual(i, :, :)));
    sensitivity(i) = double(tp / (tp + fn));
    specificity(i) = double(tn / (tn + fp));
    accuracy(i) = double((tp + tn) / (tp + tn + fp + fn));
end
sen_mean = mean(sensitivity)
spe_mean = mean(specificity)
acc_mean = mean(accuracy)
sensitivity;
specificity;
accuracy;