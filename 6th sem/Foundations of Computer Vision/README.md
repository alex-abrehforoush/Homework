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
    <li><a href="#hw2"> ➤ Homework 2</a></li>
    <li><a href="#hw3"> ➤ Homework 3</a></li>
    <li><a href="#hw4"> ➤ Homework 4</a></li>
    <li><a href="#hw5"> ➤ Homework 5</a></li>
    <li><a href="#hw6"> ➤ Homework 6</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 1 -->
<h2 id="hw1"> 👁️ HOMEWORK 1</h2>

<p align="justify">

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

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/1/sources/p1.m)


## Problem 2

In this image processing task, we were given a PPM image as input and were tasked with generating a new image according to specific guidelines. The resulting image consists of three distinct regions: an outer elliptical region in grayscale, a region between the ellipse and the lozenge filled with red color, and an untouched inner lozenge region derived from the original image. The output image is saved in JPG format, and its integrity is verified by opening it in a Windows environment.

### Input Image
<p align="center"> 
  <img src="images/1/Test_01.jpg" alt="Artificial Intelligence" height="426px" width="641px">
</p>


### Image Transformation

To achieve this, we followed a step-by-step approach:

1. Grayscale Conversion: We began by converting the input image into grayscale. This step simplifies subsequent color modifications.

2. Red Coloring for the Ellipse: The outer elliptical region of the image was filled with a red color. To determine the dimensions of the ellipse, we set its width to 400 pixels and height to 800 pixels. Here is the formula for an ellipse:
$$\frac{{(x - x_0)^2}}{{a^2}} + \frac{{(y - y_0)^2}}{{b^2}} = 1$$

3. Lozenge Creation: The inner lozenge region was retained from the original image. The horizontal and vertical diameters of the lozenge were set to 200 and 400 pixels, respectively. The lozenge's shape and dimensions were derived using geometric equations. Here is the formula for an lozenge:
$$\left| \frac{{x - x_0}}{{d_h/2}} \right| + \left| \frac{{y - y_0}}{{d_v/2}} \right| = 1$$

4. Final Output: The result was saved in JPG format, ensuring that the image was correctly stored. We verified its integrity by opening it in a Windows environment.

This exercise demonstrates proficiency in image manipulation, including grayscale conversion, region-specific coloring, and geometric transformations. The ability to apply mathematical principles to image processing tasks is a valuable skill in the field, showcasing the capacity to solve complex problems and create visually appealing graphics programmatically.

### Output Image
<p align="center"> 
  <img src="images/1/2a.jpg" alt="Artificial Intelligence" height="520px" width="960px">
</p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/1/sources/p2.m)

## Problem 3

In this problem, the objective is to rotate a color image by a user-defined angle (θ) without using built-in rotation commands like "imrotate." Instead, we utilize rotation matrices for the transformation.

### Calculate New Dimensions
To calculate the new dimensions (height and width) of the rotated image:
$$
\begin{align*}
\text{New Height (hnew)} & = \lceil |w \cdot \sin(\theta)| + |h \cdot \cos(\theta)| \rceil \\
\text{New Width (wnew)} & = \lceil |h \cdot \sin(\theta)| + |w \cdot \cos(\theta)| \rceil
\end{align*}
$$

### Rotation Matrix
The rotation matrix for a 2D transformation is:
$$\begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\
\sin(\theta) & \cos(\theta)
\end{bmatrix}$$

These equations provide the mathematical foundation for calculating the new dimensions of the image and performing pixel-wise rotation using the rotation matrix. The task is accomplished by the "rotateImage" function.

Here is the rotation for 60 degrees:
<p align="center"> 
  <img src="images/1/3a.jpg" alt="Artificial Intelligence" height="520px" width="960px">
</p>


[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/1/sources/p3.m)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 2 -->
<h2 id="hw2"> 👁️ HOMEWORK 2</h2>

<p align="justify">

## Problem 3
### Part A
In this task, the goal was to develop a function that generates a grayscale image corresponding to a given color input image in a way that maximizes the Peak Signal-to-Noise Ratio (PSNR), a crucial metric for image quality assessment.

#### Code Overview

The provided code accomplishes this task by converting a color image (in RGB format) into a grayscale image while aiming to achieve the highest possible PSNR. Here's an overview of the code's functionality:

 - The function "toBlackWhite" is defined to create the grayscale image.
 - The input image, "I," is processed to generate the corresponding grayscale image, "J."

#### Grayscale Conversion Strategy

The core of the algorithm lies in the grayscale conversion strategy. For each pixel in the input color image, the code calculates the average of the RGB channels (red, green, and blue) and rounds it. This average value is then used to determine whether the pixel in the grayscale image should be set to white (255) or black (0). The decision is based on which color (white or black) is closer to the average of the RGB channel.

### Input Image
<p align="center"> 
  <img src="images/2/i3b.png" alt="Alexander" height="243px" width="203px">
</p>

### Output Image
<p align="center"> 
  <img src="images/2/3c2.jpg" alt="Alexander" height="243px" width="203px">
</p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/2/sources/toBlackWhite.m)

### Part B
In this task, the objective was to write a function that converts a color image into a black and white image using the Floyd-Steinberg dithering algorithm. The goal of this algorithm is to determine whether each pixel should be black or white, aiming to preserve visual details while achieving a desirable result in terms of image quality.

#### Code Overview

The provided code accomplishes this task by implementing the Floyd-Steinberg dithering algorithm to convert a color image into grayscale and then to black and white. Here's an overview of the code's functionality:

  - The function "floydSteinberg" is defined to perform the dithering.
  - The input color image, "I," is first converted to an integer representation.
  - A new matrix, "J," of the same size as the input image is created to store the resulting black and white image.
  - The algorithm iterates through each pixel of the image, from left to right and from top to bottom.

#### Dithering Strategy

The core of the algorithm lies in the dithering strategy. For each pixel in the input color image, the code calculates the pixel's luminance or brightness. Based on this luminance value, the pixel is assigned either black (0) or white (255).

#### Error Diffusion

To minimize information loss and preserve visual quality, error diffusion is employed. Any error resulting from the decision made for the current pixel (e.g., changing a grayscale value to 255 or 0) is distributed to neighboring pixels. The error is diffused according to specific weighted coefficients defined by the Floyd-Steinberg algorithm.

### Input Image
<p align="center"> 
  <img src="images/2/i3b.png" alt="Alexander" height="243px" width="203px">
</p>

### Output Image
<p align="center"> 
  <img src="images/2/3c1.jpg" alt="Alexander" height="243px" width="203px">
</p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/2/sources/floydSteinberg.m)


## Problem 4

In this task, the objective was to create a function that implements the Bilinear image resizing algorithm without using built-in resizing commands like "imresize." The function, named "My_Imresize_BL," takes an input image and a resizing factor as parameters.

### Code Overview

The provided code accomplishes this task by performing the Bilinear resizing algorithm on the input image. Here's an overview of the code's functionality:

  - The function "My_Imresize_BL" is defined to implement the Bilinear resizing.
  - The resizing factor, "Resizing_Factor," can be greater or less than one.
  - The code calculates the new dimensions of the output image based on the resizing factor.
  - A new matrix, "J," of the computed dimensions is created to store the resulting image.
  - Bilinear interpolation is applied to determine the pixel values in the resized image.

### Resizing Process

The core of the algorithm involves mapping each pixel in the output image to its corresponding position in the input image. Bilinear interpolation is used to calculate the pixel values in the resized image by considering the neighboring pixels in the original image.

### Input Image
<p align="center"> 
  <img src="images/2/4a.jpg" alt="Lena" height="420px" width="300px">
</p>

### Output Image (70 percent reduction)
<p align="center"> 
  <img src="images/2/4b.jpg" alt="Lena" height="126px" width="90px">
</p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/2/sources/My_Imresize_BL.m)


## Problem 5

### Introduction
In this project, I developed an image resizing and enhancement algorithm designed to improve the quality of grayscale images by resizing them using a constant resizing factor of 2. The primary goal was to assess the accuracy and effectiveness of this proposed method. To ensure a comprehensive evaluation, a set of original images was provided, with every other pixel removed. The missing pixels were then replaced to reconstruct the images, using the proposed method and implementation. The final evaluation of the methods was carried out on a set of images that were not provided initially, to avoid any dependence on the given dataset.

### Methodology
The proposed method involves resizing and enhancing grayscale images, adhering to specific steps. Firstly, the missing pixels in the images were interpolated. This was achieved by averaging the brightness levels of neighboring pixels, with a window of 4 pixels around the missing pixel. For pixels located on the image's boundary, having two diagonal neighbors, a similar technique was applied.

<p align="center"> 
  <img src="images/2/5b.jpg" alt="" height="301px" width="302px">
</p>

Next, the brightness levels of the remaining pixels were interpolated by averaging the values of their neighboring pixels, both horizontally and vertically (above, below, left, and right). Similar to the boundary pixels, the algorithm handled the corner pixels in the same manner. The algorithm's implementation can be found in the "doubleDimensions" function.

<p align="center"> 
  <img src="images/2/5c.jpg" alt="" height="340px" width="341px">
</p>

### Results
To evaluate the effectiveness of this resizing and enhancement method, I executed the algorithm on a set of test images with resizing factor of two and recorded the results. The results, including execution time and PSNR values, are summarized in the table below:

| Image        | Nearest neighbor (dB) | Bilinear (dB)  | Bicubic (dB) | My method (dB) | Execution time (seconds)    |
|--------------|------------------|-----------|----------|-----------|------------|
| Boat         | 25.5147          | 27.104    | 26.9296  | 28.8864   | 0.899658   |
| Peppers      | 28.1116          | 29.949    | 29.7193  | 32.1106   | 0.941563   |
| Cameraman    | 28.0316          | 30.3392   | 30.4896  | 34.6318   | 0.913748   |
| House        | 27.5452          | 29.3679   | 29.2722  | 31.5815   | 0.228155   |
| Average PSNR | 27.30075         | 29.190475 | 29.102675| 31.802575 |            |

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/2/sources/doubleDimensions.m)

## Problem 6
### Part A
In this task, I wrote a function that gets a grayscale image in the input and outputs its histogram. The function is executed for the following image.
<p align="center"> 
  <img src="images/2/Image.jpg" alt="" height="500px" width="342px">
</p>

<p align="center"> 
  <img src="images/2/6a.jpg" alt="" height="474px" width="960px">
</p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/2/sources/myHist.m)

### Part B
#### Introduction
In this project, I focused on improving the visual quality of an image, Image.tif, by employing histogram analysis techniques and applying appropriate transformations. The goal was to enhance the image to reveal the maximum level of detail while maintaining a balanced contrast. The "imadjust" function was used to facilitate this enhancement process. In this report, I will explain the analysis method and the transformation functions applied in detail.

#### Histogram Analysis
As observed in the histogram of the Image.tif, the pixel intensities are predominantly concentrated around zero and close to 255. This distribution indicates that a significant portion of the image is either very dark or very bright. To enhance the image quality for both low and high brightness levels, an appropriate transformation function is required.

#### Transformation Functions

1. Logarithmic Transformation:
For improving the quality of the image in regions with low brightness levels (pixel intensities less than k), a logarithmic transformation function is a suitable choice. This function expands the range of low brightness levels while preserving the approximate brightness levels of the high-intensity regions. The specific logarithmic transformation function used is:
$$J = 31.875 × log(I + 1)$$

1. Inverse Logarithmic Transformation:
To enhance the quality of the image in regions with high brightness levels (pixel intensities greater than k), the inverse logarithmic transformation is applied. This transformation function widens the range of high-intensity regions while maintaining the approximate brightness levels of the low-intensity regions. The transformation parameters used for enhanced clarity in the bright regions are:
     - Gamma value (γ) set to 1.2
     - k value set to 127
     The inverse logarithmic transformation function is defined as:
     $$J = \frac{1}{255} × I^2$$

Here is the enhanced image:
<p align="center"> 
  <img src="images/2/6b.jpg" alt="" height="500px" width="342px">
</p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/2/sources/p6b.m)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 3 -->
<h2 id="hw3"> 👁️ HOMEWORK 3</h2>

<p align="justify">

## Problem 3

### Introduction
In this project, I developed algorithms to calculate the sum of the digits within each image in a given database. The challenge was to consider the sign associated with each digit's color and display the result at the bottom of the same image in green. Positive numbers were represented in red, while negative numbers were represented in blue. The accuracy of the algorithm was assessed in terms of the percentage of correct calculations.

### Algorithm Description
The first step in this algorithm involves generating blue and red reference images for digits 1 to 9, which serve as preprocessing steps. Each image in the database is then processed as follows:

 1. Finding the Digit's Position:
 The algorithm reads the image and, at each iteration, identifies the top-leftmost location of a color pixel (either blue or red) within the image. This pixel's position corresponds to the digit's location.

 1. Calculating the Mean Square Error (MSE):
 The algorithm calculates the Mean Square Error (MSE) between the identified portion of the image and all the reference digits generated in the preprocessing step. This helps in determining the digit that the color pixel represents. The reference digits are resized to match the dimensions of the identified portion using image resizing techniques.

 1. Identifying the Digit:
 The digit with the minimum MSE value, which is highly likely to correspond to the digit in question, is added to the array of digits within the image. The identified portion is then masked to prevent it from affecting the detection of subsequent digits.

 1. Repeat for All Digits:
 This process is repeated until all digits within the image are detected. Each digit is added to the array of digits, and the detected portion is blacked out to ensure that the next digit is found accurately.

 1. Calculating the Sum:
 After all digits are identified, the algorithm calculates their sum with 100% accuracy.

### Results

#### Input
<p align="center"> 
  <img src="images/3/Image_1_1_Q.png" alt="" height="750px" width="800px">
</p>

#### Output
<p align="center"> 
  <img src="images/3/Image_1_1_A.png" alt="" height="750px" width="800px">
</p>

The developed algorithm successfully calculates the sum of digits within images while considering the color coding for positive and negative numbers. The algorithm's high accuracy, achieving 100% correct results, demonstrates its reliability and efficiency. This skillset can be a valuable asset in various applications, including optical character recognition (OCR) and image analysis, contributing to the success of future projects and endeavors.

Note: The accuracy here refers to the percentage of times the algorithm correctly calculates the sum of digits in the given images.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/3/sources/p3.m)

## Problem 4

### Introduction
In this task, I proposed a custom noise reduction method for salt and pepper noise and compared its performance with the median filter on four provided images. The goal was to complete the table below, showcasing the effectiveness of the proposed method. To provide a comprehensive explanation, I will use a block diagram or pseudocode to describe the recommended approach. Note: For comparison, consider the size of the median filter in each case to be equal to the neighborhood size used in your method for that case.

### Algorithm Description
For each pixel affected by salt and pepper noise (with brightness levels 0 and 255), we consider a 3x3 kernel centered around that pixel. We then replace the pixel's brightness value with the average brightness of its noise-free neighbors within the 3x3 kernel (if such neighbors exist). The brightness levels of other pixels (either with all noisy neighbors or without noise themselves) remain unchanged.

Assuming that the original image doesn't contain a significant number of pixels with brightness levels 0 or 255 (or only has a few), we iterate the algorithm until no pixels with brightness levels 0 or 255 remain in the image.

Note that the efficiency of this algorithm depends on the noise level and its spatial distribution in the image. In cases where the original image has a high proportion of pixels with brightness levels 0 or 255, this algorithm may not perform efficiently. Also, in time-critical applications, where execution time is crucial, the algorithm's efficiency may be a concern due to its potential need for multiple iterations.

### Results
The custom noise reduction algorithm effectively mitigates salt and pepper noise by averaging pixel values within a 3x3 neighborhood. While it can improve image quality in scenarios where noise is sporadic, its efficiency may vary depending on the noise distribution and the presence of many pixels with extreme brightness levels. Understanding the strengths and limitations of this algorithm is essential for its practical application in image processing tasks. The following table shows the PSNR values regarding different noise percentages and also compares my method and 3x3 median filter.

| Noise Percentage | Bridge - Median (dB) | Bridge - My Method (dB) | Boat - Median (dB) | Boat - My Method (dB) | Peppers - Median (dB) | Peppers - My Method (dB) | House - Median (dB) | House - My Method (dB) |
|------------------|-----------------------|--------------------------|--------------------|-----------------------|------------------------|---------------------------|--------------------|-----------------------|
| 10%              | 34.2685               | 35.5608                  | 36.9305            | 38.4299               | 39.5897                | 39.8929                   | 37.5208            | 41.2446               |
| 20%              | 29.1947               | 32.351                   | 30.8115            | 35.103                | 31.6369                | 36.9182                   | 30.8793            | 38.0098               |
| 30%              | 24.2216               | 30.3418                  | 24.9933            | 33.0565               | 25.7074                | 35.0742                   | 25.3376            | 35.603                |
| 40%              | 19.8592               | 28.7748                  | 20.402             | 31.3515               | 20.7401                | 33.0959                   | 20.3952            | 33.6473               |
| 50%              | 16.2266               | 27.2865                  | 16.6014            | 29.916                | 16.5719                | 31.6668                   | 16.4084            | 31.8117               |
| 60%              | 13.1765               | 25.888                   | 13.403             | 28.442                | 13.3855                | 30.1246                   | 13.6071            | 30.3997               |
| 70%              | 10.6323               | 24.3311                  | 10.9112            | 26.7086               | 10.7682                | 28.1435                   | 10.8164            | 28.2111               |
| 80%              | 8.4913                | 22.5335                  | 8.7927             | 24.7861               | 8.6039                 | 25.9394                   | 8.758              | 25.6044               |
| 90%              | 6.7577                | 20.0949                  | 6.9537             | 21.8315               | 6.8026                 | 22.3678                   | 6.9176             | 22.6665               |
| **Mean**         | **18.0921**           | **27.4625**              | **18.8666**        | **29.9583**           | **19.3118**            | **31.4693**                | **18.96**           | **31.9109**           |


Note: The completed table, comparing the proposed method and the median filter's performance on the provided images, would provide a visual representation of the algorithm's effectiveness.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/6th%20sem/Foundations%20of%20Computer%20Vision/HW/3/sources/p4.m)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

