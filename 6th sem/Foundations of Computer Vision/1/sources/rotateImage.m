function J = rotateImage(I, theta)
    if mod(theta, 360) ~= 0
    %defining variables
        row = size(I, 1);
        column = size(I, 2);
        new_row = ceil(abs(column * sind(theta)) + abs(row * cosd(theta)));
        new_column = ceil(abs(row * sind(theta)) + abs(column * cosd(theta)));
        J = uint8(zeros(new_row, new_column, 3));
        for i = 1: size(J, 1)
            for j = 1: size(J, 2)
                [i_p, j_p] = rotatePixel(row, column, i - round((new_row - row) / 2), j - round((new_column - column) / 2), -1 * theta);
                if (i_p < 1 || i_p > row || j_p < 1 || j_p > column)
                    J(i, j, 1) = 0;
                    J(i, j, 2) = 0;
                    J(i, j, 3) = 0;
                else
                    J(i, j, 1) = I(i_p, j_p, 1);
                    J(i, j, 2) = I(i_p, j_p, 2);
                    J(i, j, 3) = I(i_p, j_p, 3);
                end
            end
        end
    else
        J = I;
    end
end

%defining function to calculate new coordinates
function [i_p, j_p] = rotatePixel(row, column, i, j, degree)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%defining variables
    x0 = 0;
    y0 = 0;
    x1 = 0;
    y1 = 0;
    x2 = 0;
    y2 = 0;
    theta = deg2rad(degree);
    %converting to cartesian coordinate
    if i <= row / 2
        y0 = abs(i - row / 2);
    else
        y0 = -1 * abs(i - row / 2);
    end
    if j <= column / 2
        x0 = -1 * abs(j - column / 2);
    else
        x0 = abs(j - column / 2);
    end
    %calculating rotated cartesian coordinate
    x1 = x0 * cos(theta) - y0 * sin(theta);
    y1 = x0 * sin(theta) + y0 * cos(theta);
    %converting to pixel coordinate
    x2 = abs(x1);
    y2 = abs(y1);
    if (x1 >= 0)
        j_p = round(column / 2 + x2);
    else
        j_p = round(column / 2 - x2);
    end
    if (y1 >= 0)
        i_p = round(row / 2 - y2);
    else
        i_p = round(row / 2 + y2);
    end
end
