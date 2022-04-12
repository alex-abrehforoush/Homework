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
    L_prime = medfilt2(J);
    L = J;
    for i = 1: size(L, 1)%to apply to all pixels comment this loop and use L_prime instead of L
        for j = 1: size(L, 2)
            if (L(i, j) == 0 || L(i, j) == 255)
                L(i, j) = L_prime(i, j);
            end
        end
    end
    my_psnr_values(end + 1) = psnr(K, I);
    med_psnr_values(end + 1) = psnr(L, I);
end
my_psnr_values
mean(my_psnr_values)
med_psnr_values
mean(med_psnr_values)