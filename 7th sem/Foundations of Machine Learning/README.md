<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> OSHW </h1>
<h3 align="center"> COMP 1730435 - Basics of Machine Learning</h3>
<h5 align="center"> Course Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Fall 2022) </h5>

<p align="center"> 
  <img src="images/ml.jpg" alt="OS Lab." height="408px" width="612px">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="list-of-problems"> 📖 List of Homeworks</h2>

<details open="open">
  <summary>List of Homeworks</summary>
  <ol>
    <li><a href="#hw1"> ➤ Homework 1</a></li>
    <li><a href="#hw2"> ➤ Homework 2</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 1 -->
<h2 id="hw1"> 📍 HOMEWORK 1</h2>

<p align="justify">

## Linear Regression Model Implementation and Analysis
### Introduction

In this exercise, we aim to perform linear regression using the Gradient Descent method on an insurance dataset. The dataset contains information about Age, BMI, and Children, with the goal of predicting Charges. We will implement three different variants of Gradient Descent: Batch GD, SGD, and Mini-batch GD, comparing their convergence speed and error minimization. Additionally, we will explore the effects of learning rate values and data normalization. Finally, we will compare our custom model with scikit-learn's Linear Regression model.
### Implementation and Analysis
#### a) Implement Gradient Descent Methods

We begin by implementing three variants of Gradient Descent - Batch GD, SGD, and Mini-batch GD. We calculate the mean squared error at each weight update step and plot the error over iterations. The x-axis represents the iterations (weight updates), and the y-axis represents the error on the entire dataset. This provides us with insights into how each method converges.
#### b) Compare Convergence Speed and Error

We compare the convergence speed and error minimization of the three Gradient Descent methods. This analysis helps us understand which method performs better for our dataset.
#### c) Test Small Learning Rate

We investigate the effect of using a small learning rate (0.3) on the convergence of the Gradient Descent methods. This allows us to assess how a small learning rate affects convergence speed and accuracy.
#### d) Test Large Learning Rate

Similarly, we test the effect of using a large learning rate (3) to understand its impact on convergence and error rates.
#### e) Normalize Data

We normalize the dataset and repeat the experiments from parts (a) and (b). Normalization can impact the performance of Gradient Descent methods, and this comparison helps us understand the difference.
#### f) Compare with scikit-learn

We utilize the scikit-learn library to train a Linear Regression model. We then compare this model's error and convergence speed with the custom implementation from part (a).
#### g) Compare with Built-in Solution

We use scikit-learn's built-in Linear Regression solver to calculate the parameter values and error. We then compare these results with our custom model and the scikit-learn-trained model.
### Conclusion

This exercise involves implementing and analyzing various Gradient Descent methods for linear regression on an insurance dataset. By comparing convergence speeds, error rates, and the impact of learning rates and data normalization, we gain insights into the strengths and weaknesses of different approaches. Furthermore, we compare our custom implementation with scikit-learn's Linear Regression model and evaluate our results against a built-in solution.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/7th%20sem/Foundations%20of%20Machine%20Learning/HW/1/P/HW01_Programming.ipynb)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 2 -->
<h2 id="hw2"> 📍 HOMEWORK 2</h2>

<p align="justify">

## Investigating the Impact of Loss Functions in Linear Regression
### Introduction

In this question, we will explore the effect of loss functions in linear regression. We are working with the "insurance" dataset, which includes variables such as age, BMI, and the number of children, with the goal of predicting medical charges. We will randomly split the dataset into an 80% training set and a 20% test set.
### Implementation and Analysis
#### a) Linear Regression with Different Loss Functions

We begin by fitting linear regression models to the training dataset using two different loss functions: Mean Absolute Error (MAE) and Mean Squared Error (MSE). We optimize these models using the Stochastic Gradient Descent (SGD) optimization method. After each weight update, we plot the changes in error (MAE and MSE) to observe how they evolve.
#### b) Compare MAE and MSE Losses

We compare the changes in error between the two loss functions used in part (a). Our goal is to analyze the differences in performance and provide insights into the suitability of each loss function for our dataset.
#### c) Normalize Data

In this step, we normalize the dataset and repeat the experiments from parts (a) and (b). Normalization can impact the performance of different loss functions, and we aim to observe and explain the changes in error metrics.
#### d) Optional: Use Libraries

Optionally, we implement parts (a) and (b) using pre-existing libraries for linear regression. This allows us to compare our custom implementation with library-based solutions and evaluate their consistency.
### Conclusion

This question focuses on investigating the impact of loss functions in linear regression using the "insurance" dataset. By comparing the Mean Absolute Error (MAE) and Mean Squared Error (MSE) losses, we gain insights into how different loss functions affect the accuracy and convergence of linear regression models. Normalizing the data further helps us understand the importance of data preprocessing in machine learning.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/7th%20sem/Foundations%20of%20Machine%20Learning/HW/2/P/HW02_Programming_Abrehforoush_9816603.ipynb)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

