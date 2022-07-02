import numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
import cv2
from scipy.stats import special_ortho_group as sog
##########################################################
dim = 20
N = 1000

alpha_vectors = np.zeros((N, dim))

for i in range(N):
    alpha_vectors[i] = np.random.normal(0, i + 1, dim)

V = sog.rvs(dim)
alpha_v = np.matmul(alpha_vectors, V)
#print(alpha_v)
##########################################################
pca = PCA()
pca.fit(alpha_v)
#print(pca.components_)
#print(pca.explained_variance_)
##########################################################
pca = PCA(n_components = 3)
pca.fit(alpha_v)
#print(str(100 * np.sum(pca.explained_variance_ratio_)) + " percent of data is preserved in 3 dimensions!")
min_dim = 0
pca = PCA(n_components = 8)
pca.fit(alpha_v)
# for i in range(1, dim):
#     pca = PCA(n_components = i)
#     pca.fit(alpha_v)
#     if (np.sum(pca.explained_variance_ratio_) >= 0.9):
#         min_dim = i
#         break
#print("Almost " + str(100 * np.sum(pca.explained_variance_ratio_)) + " percent of data is preserved in at least " + str(min_dim) + " dimensions!")







##########################################################
##########################################################
image1 = cv2.imread("mona.jpg")
image = cv2.cvtColor(image1, cv2.COLOR_BGR2RGB)
dim = image.shape
#print('Image shape =', dim)
##########################################################
#plt.imshow(image)
#plt.show()
##########################################################
R = image[:, :, 0]
G = image[:, :, 1]
B = image[:, :, 2]
# print(R.shape)
# print(G.shape)
# print(B.shape)
##########################################################
# k = 10
# rpca = PCA(n_components = k)
# gpca = PCA(n_components = k)
# bpca = PCA(n_components = k)

# rpca.fit(R)
# gpca.fit(G)
# bpca.fit(B)

# # print("Almost " + str(100 * np.sum(rpca.explained_variance_ratio_)) + " percent of red matrix is preserved!")
# # print("Almost " + str(100 * np.sum(gpca.explained_variance_ratio_)) + " percent of green matrix is preserved!")
# # print("Almost " + str(100 * np.sum(bpca.explained_variance_ratio_)) + " percent of blue matrix is preserved!")

# # plt.bar([i for i in range(k)], rpca.explained_variance_ratio_, color ='red', width = 0.4)
# # plt.xlabel("Red Components")
# # plt.ylabel("Variance %")
# # plt.show()

# # plt.bar([i for i in range(k)], gpca.explained_variance_ratio_, color ='green', width = 0.4)
# # plt.xlabel("Green Components")
# # plt.ylabel("Variance %")
# # plt.show()

# # plt.bar([i for i in range(k)], bpca.explained_variance_ratio_, color ='blue', width = 0.4)
# # plt.xlabel("Blue Components")
# # plt.ylabel("Variance %")
# # plt.show()
# ##########################################################
# Transform_R = rpca.transform(R)
# Transform_B = gpca.transform(G)
# Transform_G = bpca.transform(B)
# Reduced_R = rpca.inverse_transform(Transform_R)
# Reduced_G = gpca.inverse_transform(Transform_G)
# Reduced_B = bpca.inverse_transform(Transform_B)

# # print('Transform Matrix Shape = ', Transform_R.shape)
# # print('Inverse Transform Matrix Shape = ', Reduced_R.shape)

# ##########################################################
# Reduced_R = Reduced_R.reshape((dim[0], dim[1], 1))
# Reduced_G = Reduced_G.reshape((dim[0], dim[1], 1))
# Reduced_B = Reduced_B.reshape((dim[0], dim[1], 1))

# reduced_image = np.dstack((Reduced_R, Reduced_G, Reduced_B))
# final_image = reduced_image.astype(int)
# # print('final_image shape = ', final_image.shape)
# # plt.imshow(final_image)
# # plt.show()
##########################################################
##########################################################
##########################################################
##########################################################
##########################################################
k = 5
rpca = PCA(n_components = k)
gpca = PCA(n_components = k)
bpca = PCA(n_components = k)

rpca.fit(R)
gpca.fit(G)
bpca.fit(B)


##########################################################
Transform_R = rpca.transform(R)
Transform_B = gpca.transform(G)
Transform_G = bpca.transform(B)
Reduced_R = rpca.inverse_transform(Transform_R)
Reduced_G = gpca.inverse_transform(Transform_G)
Reduced_B = bpca.inverse_transform(Transform_B)

# print('Transform Matrix Shape = ', Transform_R.shape)
# print('Inverse Transform Matrix Shape = ', Reduced_R.shape)

##########################################################
Reduced_R = Reduced_R.reshape((dim[0], dim[1], 1))
Reduced_G = Reduced_G.reshape((dim[0], dim[1], 1))
Reduced_B = Reduced_B.reshape((dim[0], dim[1], 1))

reduced_image = np.dstack((Reduced_R, Reduced_G, Reduced_B))
final_image = reduced_image.astype(int)
print('final_image shape = ', final_image.shape)
plt.imshow(final_image)
plt.show()
print(np.sum(rpca.explained_variance_ratio_))