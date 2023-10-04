<!-- <p align="center"> 
  <img src="gif/Pacman Logo2.jpg" alt="Pacman Logo" width="80px" height="80px">
</p> -->
<h1 align="center"> MLCIHW </h1>
<h3 align="center"> COMP 1730435 & COMP 1730403 - Basics of Machine Learning, Principles of Computational Intelligence</h3>
<h5 align="center"> Course Practical Homeworks - <a href="https://english.iut.ac.ir/">Isfahan University of Technology</a> (Fall 2022, Spring & Winter 2023) </h5>

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
    <li><a href="#hw3"> ➤ Homework 3</a></li>
    <li><a href="#hw4"> ➤ Homework 4</a></li>
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

<!-- HOMEWORK 3 -->
<h2 id="hw3"> 📍 HOMEWORK 3</h2>

<p align="justify">

## Implementation of Logistic Regression from Scratch
### Introduction

In this assignment, we are tasked with implementing logistic regression from scratch without using PyTorch or TensorFlow libraries. The goal is to create a logistic_regression function that takes several input parameters and trains a logistic regression model using gradient descent. We'll use a dataset containing information about thousands of different molecules, categorized into two classes: "Boudar" and "Bibo."
### Implementation Steps
1. Define the logistic_regression Function

We need to create a Python function named logistic_regression that accepts the following input parameters:

  - x: An array of shape (n_samples, n_features) representing the input data, where n_samples is the number of data points, and n_features is the number of features.
  - y: A vector of length n_samples containing the labels for the input data.
  - learning_rate: The learning rate for gradient descent.
  num_iterations: The number of iterations for training.
  - add_intercept: A boolean variable to determine whether to add an intercept term.

Inside this function, we will implement logistic regression using gradient descent to learn the weights for a binary classification problem.

2. Preprocess the Data

Before training the model, we will preprocess the data, which includes normalizing the features.

3. Training and Testing

We will train the logistic regression model using a training dataset called clean2 and test it on another dataset called clean1. Both datasets contain information about different molecules categorized into "Boudar" and "Bibo." We will perform the following steps:

  - Train the model with the training dataset.
  - Test the model's performance on the test dataset.
  - Repeat the above two steps with different learning rates (small and large).
  - Visualize the model's performance by plotting relevant graphs.
  - Evaluate the model's performance without using any external libraries by calculating accuracy and error parameters (optional).

4. Optional: Evaluate Using Accuracy, Recall, and F1 Score

Optionally, we can evaluate the model's performance using accuracy, recall, and F1 score. We may choose to use library functions to calculate these metrics and explain the significance of each metric.
### Conclusion

This assignment focuses on implementing logistic regression from scratch and applying it to a real-world dataset of molecule classification. We aim to gain insights into the impact of different learning rates and evaluate the model's performance using various evaluation metrics. Implementing logistic regression from scratch enhances our understanding of the underlying principles and is a valuable skill for machine learning practitioners.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/8th%20sem/Foundations%20of%20Computational%20Intelligence/1/P/HW1_Programming_Abrehforoush_9816603.ipynb)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- HOMEWORK 4 -->
<h2 id="hw4"> 📍 HOMEWORK 4</h2>

<p align="justify">

## Convolutional Neural Network Training and Hyperparameter Tuning

### Introduction

In this practical assignment, we will explore the training of a Convolutional Neural Network (CNN) on a given dataset. It is important to note that we are not allowed to use pre-trained network weights or transfer learning in this section. Instead, we are required to train the CNN from scratch, including all weight-learning stages.

### Scenario 1: Underfitting

In the first scenario, our goal is to design a model that intentionally underfits the data. We need to create a CNN model that performs poorly on both the training and validation datasets. After training the model, we should provide insights into the factors and reasons behind underfitting.

### Scenario 2: Overfitting and Remediation

In the second scenario, we will intentionally design a model that overfits the data, resulting in high performance on the training set but poor generalization to the validation set. We must explain the factors and reasons for overfitting. Subsequently, we need to apply techniques or modifications to address this issue and improve model performance.
### Scenario 3: Hyperparameter Tuning for Best Fit

In the third scenario, we will leverage various techniques and tools to fine-tune the hyperparameters of the model to achieve the "best fit" model. The term "best fit" implies that the model should perform well on both training and validation data without overfitting or underfitting. We need to specify hyperparameter tuning settings and conduct this tuning process on a validation dataset.
Hyperparameter Tuning Techniques:

  - Hyperparameter tuning for the learning rate using grid search (Table 3).
  - Hyperparameter tuning for the learning rate using tools like "wandb" or "come" (as mentioned in the assignment).

### Evaluation

For each scenario, we must generate error plots showing the loss on the training and validation datasets over epochs. Additionally, after training the model, we need to report the accuracy of the model on the test dataset, using the "Accuracy" metric.
Conclusion

This assignment focuses on training Convolutional Neural Networks from scratch and explores various scenarios, including underfitting, overfitting, and hyperparameter tuning. By experimenting with different model configurations and optimizing hyperparameters, we aim to gain a deep understanding of CNN training and achieve the best model fit for the given dataset.

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush/Homework/blob/master/8th%20sem/Foundations%20of%20Computational%20Intelligence/2/P/HW2_Programming_Abrehforoush_9816603.ipynb)

</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> 📜 Credits</h2>

Alireza Abrehforoush

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Alireza-Abrehforoush)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alireza-abrehforoush-b6815b19b/)

<!-- Acknowledgements: Based on UC Berkeley's Pacman AI project, <a href="http://ai.berkeley.edu">http://ai.berkeley.edu</a> -->

