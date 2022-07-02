var float: x1;
var float: x2;
var float: x3;
var float: x4;
var float: x5;
var float: x6;

constraint  1 * x1 + 5 * x2 - 3 * x3 - 2 * x4 + 2 * x5 >= x6;
constraint  4 * x1 + 0 * x2 - 1 * x3 + 3 * x4 + 1 * x5 >= x6;
constraint  0 * x1 - 3 * x2 + 6 * x3 + 1 * x4 - 4 * x5 >= x6;
constraint -2 * x1 + 7 * x2 + 0 * x3 - 4 * x4 - 1 * x5 >= x6;
constraint -1 * x1 + 0 * x2 + 3 * x3 - 2 * x4 + 0 * x5 >= x6;

constraint x1 + x2 + x3 + x4 + x5 = 1;
constraint x1 >= 0;
constraint x2 >= 0;
constraint x3 >= 0;
constraint x4 >= 0;
constraint x5 >= 0;

solve maximize x6;