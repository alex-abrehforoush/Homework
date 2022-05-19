clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
I = imread("images\Q2\Cells.tif");
I = I(1: size(I, 1) - 1, :);
saveCellsData(I, 'cells_data.xls', '.');