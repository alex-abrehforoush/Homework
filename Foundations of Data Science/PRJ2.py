import numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
import cv2
from scipy.stats import special_ortho_group as sog

#######################################################
dim = 20
N = 1000

alpha_vectors = np.zeros((dim, N))
for i in range(dim):
    mu, sigma = 0, i + 1
    alpha_vectors[i] = np.random.normal(mu, sigma, N)

V = sog.rvs(dim)
#print(V)
print(np.shape(alpha_vectors))
print(np.shape(V))

print(np.matmul(V, alpha_vectors))
#######################################################
