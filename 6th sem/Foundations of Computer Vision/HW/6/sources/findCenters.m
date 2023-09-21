function centers = findCenters(I, radius)
%FINDCENTERS Summary of this function goes here
%   Detailed explanation goes here
centers = double(zeros(size(I)));
for i = 1: size(I, 1)
    for j = 1: size(I, 2)
        if (i == 217 && j == 80)
            x = 0;
        end
        if (I(i, j) ~= 0)
            centers = updateCenters(I, centers, i, j, radius);
        end
    end
end
end

function new_centers = updateCenters(I, centers, i, j, radius)
%UPDATECENTERS Summary of this function goes here
%   Detailed explanation goes here
new_centers = centers;
for k = i - radius - 1: i + radius + 1
    for l = j - radius - 1: j + radius + 1
        if ((k >= 1 && k <= size(I, 1)) && (l >= 1 && l <= size(I, 2)))
            if (I(i, j) ~= 0 && round((double(i) - double(k)) ^ 2 + (double(j) - double(l)) ^ 2) == radius ^ 2)
                new_centers(k, l) = new_centers(k, l) + 1;
            end
        end
    end
end
end