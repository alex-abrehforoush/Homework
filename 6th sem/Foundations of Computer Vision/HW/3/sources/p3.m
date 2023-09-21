clc
clear
close all
imtool close all
%%%%%%%%%%%%%%%%
dirinfo = dir("images\Q3");
name_of_images = {dirinfo.name};
ground_truth = zeros(1, 100);
my_result = zeros(1, 100);
box_color = {'green'};
for i = 3: size(name_of_images, 2)
    current_image_name = char(name_of_images(i));
    temp = strsplit(current_image_name, "_");
    kemp = strsplit(char(temp(3)), ".");
    g_t = str2double(kemp(1));
    ground_truth(i) = g_t;
    I = imread(['images\Q3\' current_image_name]);
    J = I;
    m_r = sumOnImage(I);
    my_result(i) = m_r;
    J = insertText(J, [350 756;], num2str(m_r), 'boxColor', box_color, 'FontSize', 22);
    imwrite(J, ['images\A3\' current_image_name]);
end
correct_guesses = my_result == ground_truth;
percentage = 100 * (sum(correct_guesses) - 2) / (size(my_result, 2) - 2)