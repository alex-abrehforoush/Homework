clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
for k = 0: 9
    I = imread(['images\' num2str(k) '.png']);
    min_row = 1000;
    max_row = 0;
    min_column = 1000;
    max_column = 0;
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            if (I(i, j, 1) < 200)
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
    Red = uint8(zeros(max_row - min_row + 1, max_column - min_column + 1, 3));
    Blue = uint8(zeros(max_row - min_row + 1, max_column - min_column + 1, 3));
    for i = min_row: max_row
        for j = min_column: max_column
            Red(i - min_row + 1, j - min_column + 1, 1) = 255;
            Red(i - min_row + 1, j - min_column + 1, 2: 3) = I(i, j, 2: 3);
            Blue(i - min_row + 1, j - min_column + 1, 1: 2) = I(i, j, 1: 2);
            Blue(i - min_row + 1, j - min_column + 1, 3) = 255;
        end
    end
    
    imtool(I);
    imtool(Red);
    imtool(Blue);
    imwrite(Red, ['images\p' int2str(k) '.png']);
    imwrite(Blue, ['images\n' int2str(k) '.png']);
end