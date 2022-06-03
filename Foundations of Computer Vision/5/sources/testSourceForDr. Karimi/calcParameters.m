function [tp, tn, fp, fn] = calcParameters(I, gt)
%CALCPARAMETERS Summary of this function goes here
%   Detailed explanation goes here
tp = 0;
tn = 0;
fp = 0;
fn = 0;



for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        if (I(i, j) == 1 && gt(i, j) == 255)
            tp = tp + 1;
        end
        if (I(i, j) == 0 && gt(i, j) == 0)
            tn = tn + 1;
        end
        if (I(i, j) == 1 && gt(i, j) == 0)
            fp = fp + 1;
        end
        if (I(i, j) == 0 && gt(i, j) == 255)
            fn = fn + 1;
        end
    end
end



end

