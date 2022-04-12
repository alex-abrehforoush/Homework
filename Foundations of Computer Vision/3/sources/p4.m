clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\Q4\House.tif");
my_psnr_values = [];
med_psnr_values = [];
for d = 0.1: 0.1: 0.9
    J = imnoise(I, 'salt & pepper', d);
    K = removeNoise(J);
    while (ismember(0, K) || ismember(255, K))
        K = removeNoise(K);
    end
    L = medfilt2(J);
    my_psnr_values(end + 1) = psnr(K, I);
    med_psnr_values(end + 1) = psnr(L, I);
end
my_psnr_values
mean(my_psnr_values)
med_psnr_values
mean(med_psnr_values)