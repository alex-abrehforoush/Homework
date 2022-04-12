function K = removeNoise(J)
%REMOVENOISE Summary of this function goes here
    K = J;
    for i = 1: size(K, 1)
        for j = 1: size(K, 2)
            if (K(i, j) == 0 || K(i, j) == 255)
                arr = [];
                for k = i - 1: i + 1
                    for l = j - 1: j + 1
                        if (k > 0 && k < size(K, 1) && l > 0 && l < size(K, 2))
                            if (K(k, l) > 0 && K(k, l) < 255)
                                arr(end + 1) = K(k, l);
                            end
                        end
                    end
                end
                K(i, j) = mean(arr);
            end
        end
    end
end

