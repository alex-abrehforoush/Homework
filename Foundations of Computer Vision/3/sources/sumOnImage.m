function sum_of_values = sumOnImage(I)
%SUMONIMAGE Summary of this function goes here
%     X = uint8(zeros(size(I, 1), size(I, 2), 3));
%     X(:, :, 1) = medfilt2(I(:, :, 1), [3 3]);
%     X(:, :, 2) = medfilt2(I(:, :, 2), [3 3]);
%     X(:, :, 3) = medfilt2(I(:, :, 3), [3 3]);
    X = I;
    values = 0;
    digit = 1;
    while(true)
        [min_row, max_row, min_column, max_column, digit] = getDigit(X);
        if (digit == 0)
            break;
        end
        X(min_row: max_row, min_column: max_column, :) = 0;
        %imtool(X);
        values(end + 1) = digit;
    end
    sum_of_values = sum(values);
end

