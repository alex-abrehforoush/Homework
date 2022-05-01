function diff = borderDiffNew(X, Y, direction)
%BORDERDIFFNW Summary of this function goes here
    X = int64(X);
    Y = int64(Y);
    r = size(X, 1);
    diff = uint64(0);
    if (direction == 0)
        diff = sum((X(r, :) - Y(1, :)) .^ 2);
    else
        diff = sum((X(:, r) - Y(:, 1)) .^ 2);


    end
end

