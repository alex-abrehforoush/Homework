<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> Imageful </h1>
<h3 align="center"> COMP 1730460 - Foundations of Computer Vision </h3>
<h5 align="center"> Homework 6 - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Spring 2022) </h5>

<!-- <p align="center"> 
  <img src="gif/Diana.png" alt="Image of Diana" height="427px" width="427px">
</p> -->

<div style="display: flex; justify-content: center;">
  <img src="gif/Diana.png" alt="Image of Diana" height="427px" width="427px">
  <span style="margin: 0 10px; display: flex; justify-content: center; align-items: center;"> </span>
  <img src="gif/Diana_50_percent.png" alt="Image of Diana" height="427px" width="214px">
</div>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> 📖 Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project"> ➤ About The Project</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#my-method"> ➤ My Method</a></li>
    <li><a href="#results"> ➤ Results</a></li>
    <li><a href="#references"> ➤ References</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- ABOUT THE PROJECT -->
<h2 id="about-the-project"> 📝 About The Project</h2>

<p align="justify">
  Display devices come with varying resolutions and aspect ratios, necessitating the resizing of images to fit these different screens properly. Also, it is important to protect the critical content of the images and prevent distortions as much as possible in resized images. Content-Aware Image Retargeting (CAIR) techniques provide a promising solution to this ongoing challenge. The process of CAIR involves altering the resolution and aspect ratio of images to address these essential aspects as effectively as possible. This adaptation is achieved by adhering to geometric constraints and adopting a content-aware approach.
  
  "Imageful" is a content-aware image retargeting project implemented as final project for the Foundations of Computer Vision course. It intelligently resizes images while preserving their essential content and visual appeal. With its innovative approach, Imageful ensures that crucial elements in the most of the images remain undistorted during resizing, making it a valuable tool for various multimedia applications.
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> 💾 Project Files Description</h2>

<ul>
  <li><b>cair.m</b> - Where all of the functions reside.</li>
  <li><b>main.m</b> - The main file that runs the algorithm.</li>
</ul>

<!-- <h3>Some other supporting files</h3>
<ul>
  <li><b>graphicsDisplay.py</b> - Graphics for Pacman.</li>
</ul> -->

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- GETTING STARTED -->
<!-- <h2 id="getting-started"> 📖 Getting Started</h2>

<p>You are able to start the game by typing the following commands in the command line:</p>
<pre><code>$ python pacman.py</code></pre>

<p>You can see the list of all options and their default values via:</p>
<pre><code>$ python pacman.py -h</code></pre>
<i>Note that all of the commands that appear in this project also appear in <code>commands.txt</code>, for easy copying and pasting.</i>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png) -->

<!-- MY METHOD -->
<h2 id="my-method"> 💡 My Method</h2>

<p align="justify"> 
  As the classic seam carving algorithm was vulnerable to some properties of the images, such as the noisiness of the background and the existence of geometric structures, I modified the classic seam carving algorithm to make it convenient for a bigger group of images.

  Generally speaking, my method consists of two main parts: first, modification of the seam carving algorithm, and second, providing a new importance map, both of which enhance the overall visual result.

 1st:
 While removing the seam having the least importance value in the importance map, it is sensible in the next iteration not to remove the seam containing adjacent pixels to the pixels of the removed seam in order to avoid distortions caused by the removal of adjacent seams. To handle this situation, I encountered that it would be beneficial to add a constant factor of the importance value of removed pixels to its adjacent ones. This trick works because in every iteration (respectively seam removal step), the seam with the minimum importance is chosen to be removed. So when we increase the importance of the pixels adjacent to the removed seam, it becomes more probable for the next seam not to consist of pixels adjacent to the previously removed seam. Therefore, in each iteration, I add 0.491/2 times x to each adjacent pixel's importance value on the right and left and 0.009/2 to each second-order adjacent importance value on the right and left.

 2nd:
 The importance map used in this method is calculated through a linear combination of the normalized depth map, saliency map, gradient magnitude, and the maximum of values obtained by applying two 3 by 3 diagonal Sobel operators regarding edges of 45 or 135 degrees. The importance map is obtained as follows:
 $$map_{importance} = 3 nrml(map_{depth}) + nrml(map_{saliency\:map}) + nrml(map_{gradient\:magnitude}) + 3 nrml(max(map_{45\:degree\:Sobel}, map_{135\:degree\:Sobel}))$$
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


<!-- Results -->
<h2 id="results"> 🎉 Results</h2>

<p align="justify"> 
  After applying my method to the provided images, here are the corresponding outputs that demonstrate a 50% reduction in width.
</p>

<div style="display: flex; justify-content: center;">
  <img src="gif/Baby.png" alt="Image of baby" height="200" width="200">
  <span style="margin: 0 10px; display: flex; justify-content: center; align-items: center;"> </span>
  <img src="gif/Baby_50_percent.png" alt="Image of baby" height="200" width="100px">
</div>
<div style="display: flex; justify-content: center;">
  <img src="gif/Diana.png" alt="Image of Diana" height="200" width="200">
  <span style="margin: 0 10px; display: flex; justify-content: center; align-items: center;"> </span>
  <img src="gif/Diana_50_percent.png" alt="Image of Diana" height="200" width="100px">
</div>
<div style="display: flex; justify-content: center;">
  <img src="gif/Dolls.png" alt="Image of dolls" height="200" width="200">
  <span style="margin: 0 10px; display: flex; justify-content: center; align-items: center;"> </span>
  <img src="gif/Dolls_50_percent.png" alt="Image of dolls" height="200" width="100px">
</div>
<div style="display: flex; justify-content: center;">
  <img src="gif/Snowman.png" alt="Image of snowman" height="200" width="200">
  <span style="margin: 0 10px; display: flex; justify-content: center; align-items: center;"> </span>
  <img src="gif/Snowman_50_percent.png" alt="Image of snowman" height="200px" width="100px">
</div>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- <p>I have implemented the depth-first search (DFS) algorithm in the depthFirstSearch function in <code>search.py</code>.</p>
<p>The Pacman will quickly find a solution via running the following commands:</p>

<pre><code>$ python pacman.py -l tinyMaze -p SearchAgent</code></pre>
<pre><code>$ python pacman.py -l mediumMaze -p SearchAgent</code></pre>
<pre><code>$ python pacman.py -l bigMaze -z .5 -p SearchAgent</code></pre> -->

<!-- <p align="center"> 
<img src="gif/DFS.gif" alt="Animated gif DFS Algorithm" height="282px" width="637px">
height="382px" width="737px"
</p> -->


<!-- REFERENCES -->
<h2 id="References"> 🌏 References</h2>

[1] Asheghi, Bahareh, et al. "A comprehensive review on content-aware image retargeting: From classical to state-of-the-art methods." Signal Processing 195 (2022): 108496.

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="Credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

