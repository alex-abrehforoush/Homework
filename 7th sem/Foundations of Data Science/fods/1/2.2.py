import numpy as np
import matplotlib.pyplot as plt

def calcDistance(A, B, d):
    distance = 0;
    for i in range(d):
        distance += (A[i] - B[i]) ** 2;
    return np.sqrt(distance);
def main():
    d = 100;
    n = 30;
    points = np.random.uniform(low = -0.5, high = 0.5, size = (n, d));
    x = [];
    y = [];
    distances = [];
    angles = [];
    for i in range(n):
        for j in range(n):
            A = points[i];
            B = points[j];
            temp = calcDistance(A, B, d);
            x.append(i);
            y.append(j);
            distances.append(temp);
            kemp = np.arccos(np.dot(A, B) / (np.linalg.norm(A) * np.linalg.norm(B)));
            angles.append(kemp);
    fig = plt.figure();
    # ax = plt.axes(projection = '3d');
    # ax.plot3D(x, y, distances, 'green')
    # plt.show()
    ax = plt.axes(projection = '3d');
    ax.plot3D(x, y, angles, 'green')
    plt.show()

main();