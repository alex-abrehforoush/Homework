function J = My_Imresize_BL(Input_Image, Resizing_Factor)
%MY_IMRESIZE_BL Summary of this function goes here
    old_row = size(Input_Image, 1);
    old_column = size(Input_Image, 2);
    new_row = ceil(old_row * Resizing_Factor);
    new_column = ceil(old_column * Resizing_Factor);
    J = uint8(zeros(new_row, new_column, 3));
    r_ratio = double(old_row - 1) / double(new_row - 1);
    c_ratio = double(old_column - 1) / double(new_column - 1);
    for i = 1: new_row
        i_floor = uint32(floor(r_ratio * i)) + 1;
        i_ceil = uint32(ceil(r_ratio * i));
        if (i_floor > old_row)
            i_floor = old_row;
        end
        if (i_ceil > old_row)
            i_ceil = old_row;
        end
        y = uint32(r_ratio * i - i_floor);
        
        for j = 1: new_column
            j_floor = uint32(floor(c_ratio * j)) + 1;
            j_ceil = uint32(ceil(c_ratio * j));
            if (j_floor > old_column)
                j_floor = old_column;
            end
            if (j_ceil > old_column)
                j_ceil = old_column;
            end
            x = uint32(c_ratio * j - j_floor);

            a = uint32(zeros(1, 3));
            b = uint32(zeros(1, 3));
            c = uint32(zeros(1, 3));
            d = uint32(zeros(1, 3));
            e = uint32(zeros(1, 3));
            %if (i_floor <= old_row && i_ceil <= old_row && j_floor <= old_column && j_ceil <= old_column)
                a = uint32(Input_Image(i_floor, j_floor, :));
                b = uint32(Input_Image(i_floor, j_ceil, :));
                c = uint32(Input_Image(i_ceil, j_floor, :));
                d = uint32(Input_Image(i_ceil, j_ceil, :));
                e = uint32(round(a + (b - a) * x + (c - a) * y + (a - b - c + d) * x * y));
                J(i, j, :) = e;
            %end
        end
    end
end