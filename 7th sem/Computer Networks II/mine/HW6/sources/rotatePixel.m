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
