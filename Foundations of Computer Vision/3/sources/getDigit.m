function [min_row, max_row, min_column, max_column, digit] = getDigit(X)
%GETDIGIT Summary of this function goes here
    [min_row, max_row, min_column, max_column, sign] = getBoundaries(X);
    if (min_row == 100000)
        digit = 0;
    else
        J = X(min_row: max_row, min_column: max_column, :);
        mse_of_numbers = zeros(1, 9);
        if sign == 0
            for i = 1: 9
                num_pic = imread(['images\p' num2str(i) '.png']);
                mse_of_numbers(i) = immse(J, imresize(num_pic, size(J(:, :, 1))));
            end
        else
            for i = 1: 9
                num_pic = imread(['images\n' num2str(i) '.png']);
                mse_of_numbers(i) = immse(J, imresize(num_pic, size(J(:, :, 1))));
            end
        end
        [min_value, digit] = min(mse_of_numbers);
        if sign == 1
            digit = -digit;
        end
    end
end

function [min_row, max_row, min_column, max_column, sign] = getBoundaries(I)
%POPDIGIT Summary of this function goes here
    min_row = 100000;
    max_row = -100000;
    min_column = 100000;
    max_column = -100000;
    sign = 0;
    white_pixel = 255 * ones(1, 1, 3);
    black_pixel = zeros(1, 1, 3);
    top_row = 0;
    top_column = 0;
    break_flag = 0;
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            if (~isequal(I(i, j, :), white_pixel) && ~isequal(I(i, j, :), black_pixel))
                top_row = i;
                top_column = j;
                if (I(i, j, 1) == 255)
                    sign = 0;
                end
                if (I(i, j, 3) == 255)
                    sign = 1;
                end
                break_flag = 1;
                break;
            end
        end
        if (break_flag)
            break;
        end
    end
    break_flag = 0;
    if sign == 0
        for i = top_row: top_row + 50
            if (i <= 0)
                continue;
            end
            for j = top_column - 35: top_column + 35
                if (j <= 0)
                    continue;
                end
                if (~isequal(I(i, j, :), white_pixel) && ~isequal(I(i, j, :), black_pixel))
                    if (i < min_row)
                        min_row = i;
                    end
                    if (i > max_row)
                        max_row = i;
                    end
                    if (j < min_column)
                        min_column = j;
                    end
                    if (j > max_column)
                        max_column = j;
                    end
                end
            end
        end
    else
        for i = top_row: top_row + 50
            if (i <= 0)
                continue;
            end
            for j = top_column - 35: top_column + 35
                if (j <= 0)
                    continue;
                end
                if (~isequal(I(i, j, :), white_pixel) && ~isequal(I(i, j, :), black_pixel))
                    if (i < min_row)
                        min_row = i;
                    end
                    if (i > max_row)
                        max_row = i;
                    end
                    if (j < min_column)
                        min_column = j;
                    end
                    if (j > max_column)
                        max_column = j;
                    end
                end
            end
        end
    end
end