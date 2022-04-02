function J = toBlackWhite(I)
%TOBLACKWHITE Summary of this function goes here
% RGB to black and white with maximum psnr
    J = uint8(zeros(size(I)));
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            avg_of_rgb = round(double(I(i, j, 1)) / 3 + double(I(i, j, 2) / 3) + double(I(i, j, 3) / 3));
            if(255 - avg_of_rgb <= avg_of_rgb)
                J(i, j, 1) = 255;
                J(i, j, 2) = 255;
                J(i, j, 3) = 255;
            else
                J(i, j, 1) = 0;
                J(i, j, 2) = 0;
                J(i, j, 3) = 0;
            end
        end
    end
end