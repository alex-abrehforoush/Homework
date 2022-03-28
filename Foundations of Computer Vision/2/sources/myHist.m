function hist_vector = myHist(I)
%MYHIST Summary of this function goes here
    x_axis = 0: 255;
    y_axis = zeros(1, 256);
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)
            y_axis(I(i, j) + 1) = y_axis(I(i, j) + 1) + 1;
        end
    end
    hist_vector = y_axis;
    figure, bar(x_axis, y_axis);
end

