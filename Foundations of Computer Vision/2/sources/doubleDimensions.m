function K = doubleDimensions(J)
    height = 2 * size(J, 1);
    width = 2 * size(J, 2);
    K = uint8(zeros(height, width , 3));
    for i = 1: height / 2
        for j = 1: width / 2
            K(2 * i - 1, 2 * j - 1, :) = J(i, j, :);
        end
    end
    for i = 2: 2: height - 1
        for j = 2: 2: width - 1
            K(i, j, :) = (1 / 4) * K(i - 1, j - 1, :) + (1 / 4) * K(i - 1, j + 1, :) + (1 / 4) * K(i + 1, j - 1, :) + (1 / 4) * K(i + 1, j + 1, :);
        end
    end
    for j = 2: 2: width - 1
        K(height, j, :) = (1 / 2) * K(height - 1, j - 1, :) + (1 / 2) * K(height - 1, j + 1, :);
    end
    for i = 2: 2: height - 1
        K(i, width, :) = (1 / 2) * K(i - 1, width - 1, :) + (1 / 2) * K(i + 1, width - 1, :);
    end
    K(height, width, :) = K(height - 1, width - 1, :);
    
    
    
    for i = 2: height - 1
        for j = 2: width - 1
            if (mod(i, 2) == 0 && mod(j, 2) == 1) || (mod(i, 2) == 1 && mod(j, 2) == 0)
                K(i, j, :) = (1 / 4) * K(i - 1, j, :) + (1 / 4) * K(i + 1, j, :) + (1 / 4) * K(i, j - 1, :) + (1 / 4) * K(i, j + 1, :);
            end
        end
    end
    for j = 2: width - 1
        if (mod(j, 2) == 0)
            K(1, j, :) = (1 / 3) * K(1, j - 1, :) + (1 / 3) * K(1, j + 1, :) + (1 / 3) * K(2, j, :);
        else
            K(height, j, :) = (1 / 3) * K(height, j - 1, :) + (1 / 3) * K(height, j + 1, :) + (1 / 3) * K(height - 1, j, :);
        end
    end
    for i = 2: height - 1
        if (mod(i, 2) == 0)
            K(i, 1, :) = (1 / 3) * K(i - 1, 1, :) + (1 / 3) * K(i + 1, 1, :) + (1 / 3) * K(i, 2, :);
        else
            K(i, width, :) = (1 / 3) * K(i - 1, width, :) + (1 / 3) * K(i + 1, width, :) + (1 / 3) * K(i, width - 1, :);
        end
    end
    K(height, 1, :) = (1 / 3) * K(height - 1, 1, :) + (1 / 3) * K(height - 1, 2, :) + (1 / 3) * K(height, 2, :);
    K(1, width, :) = (1 / 3) * K(1, width - 1, :) + (1 / 3) * K(2, width - 1, :) + (1 / 3) * K(2, width, :);
end

