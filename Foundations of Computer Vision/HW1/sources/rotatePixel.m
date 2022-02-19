%defining function to calculate new coordinates
function [i_p, j_p] = rotatePixel(i, j, theta)
%defining variables
    row = 852;
    column = 1282;
    x0 = 0;
    y0 = 0;
    x1 = 0;
    y1 = 0;
    x2 = 0;
    y2 = 0;
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
    x1 = x0 * cosd(theta) - y0 * sind(theta);
    y1 = x0 * sind(theta) + y0 * cosd(theta);
    %converting to pixel coordinate
    r = mod(theta, 360);
    x2 = round(abs(x1));
    y2 = round(abs(y1));
    if (r >= 0) && (r < 90)
        j_p = 1 + x2 + column / 2;
        i_p = 1 + row / 2 - y2;
    elseif (r >= 90) && (r < 180)
        j_p = 1 + column / 2 - x2;
        i_p = 1 + row / 2 - y2;
    elseif (r >= 180) && (r < 270)
        j_p = 1 + column / 2 - x2;
        i_p = 1 + y2 + row / 2;
    else
        j_p = x2 + column / 2;
        i_p = y2 + row / 2;
    end
end