<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> CVHW </h1>
<h3 align="center"> COMP 1730460 - Foundations of Computer Vision</h3>
<h5 align="center"> Course Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Winter & Spring 2022) </h5>

<p align="center"> 
  <img src="images/cv.jpg" alt="Artificial Intelligence" height="480px" width="853px">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="list-of-problems"> 📖 List of Homeworks</h2>

<details open="open">
  <summary>List of Homeworks</summary>
  <ol>
    <li><a href="#hw1"> ➤ Homework 1</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 1 -->
<h2 id="hw1"> 👁️ HOMEWORK 1</h2>

<p align="justify">
Lorem

## Problem 1

In the field of computer vision and image processing, one of the foundational tasks is reading an input image within a programming environment and accessing its data. In this exercise, we explored the process of reading and displaying image data from a PPM file format using MATLAB. Additionally, we assessed the correctness of our approach by utilizing the "imread" command and presenting two results side by side.

<p align="center"> 
  <img src="images/1/1d.jpg" alt="Artificial Intelligence" height="520px" width="960px">
</p>

### Reading Image Data

To begin, we opened the image file using a text editor. Based on the provided information, the image has dimensions of 1282 × 852 pixels, and the maximum brightness level for each color channel of every pixel is 255. From this, we deduced that the image data starts from the seventeenth byte onward.

### Accessing Image Data

We proceeded to open the image using both the "fopen" and "fread" commands as well as the "imtool" command. Upon closer examination of the image, it became evident that our initial assumption about the location of the image data was accurate. The brightness level of the first pixel of the image data is stored in the seventeenth byte of the file. Furthermore, comparing the output of the "imtool" command to an array representing the file, we observed that the brightness levels for the red, green, and blue channels were respectively stored at indices that are multiples of 3, offset by 2, 3, and 1.

This exercise demonstrated the fundamental process of extracting image data from a PPM file and accessing it within a MATLAB environment. Additionally, it highlighted the importance of validation through tools like "imread" to ensure the accuracy of the data extraction process. This experience underscores the essential skills and understanding of image processing techniques, file manipulation, and data validation, all of which are valuable assets in the realm of computer vision and related fields.

## Problem 2

This is the content of subsection 2.

## Problem 3

This is the content of subsection 3.


[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Artificial%20Intelligence/HW/1/P/sources/Rubik.py)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

