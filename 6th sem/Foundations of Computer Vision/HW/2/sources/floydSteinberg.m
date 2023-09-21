function J = floydSteinberg(I)
%FLOYDSTEINBERG Summary of this function goes here
    I = int16(I);
    J = zeros(size(I));
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            old_value = I(i, j, 1);
            remaining = int16(-1);
            if(255 - I(i, j, 1) < I(i, j, 1))
                I(i, j, :) = 255;
                remaining = -int16(int16(255 - old_value));
            else
                I(i, j, :) = 0;
                remaining = int16(old_value);
            end
            if(j < size(J, 2))
                I(i, j + 1, :) = I(i, j + 1, 1) + floor((7 / 16) * remaining);
                if(i < size(J, 1))
                    I(i + 1, j + 1, :) = I(i + 1, j + 1, 1) + floor((1 / 16) * remaining);
                end
            end
            if(i < size(I, 1))
                I(i + 1, j, :) = I(i + 1, j, 1) + floor((5 / 16) * remaining);
                if(j > 1)
                    I(i + 1, j - 1, :) = I(i + 1, j - 1, 1) + floor((3 / 16) * remaining);
                end
            end
        end
    end
    J = uint8(I);
end