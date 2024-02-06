import gym
import numpy as np
from keras.models import load_model
import imageio

env = gym.make('MountainCar-v0')

# Load the trained model
model = load_model('C:/Users/Alireza\Desktop/HW/Homework/9th sem/Deep Learning/5/0/trainNetworkInEPS399.h5')

# Set the number of episodes
n_episodes = 20

best_score = -float('inf')

# Prepare to capture frames for making the GIF


for i_episode in range(n_episodes):
    # currentState = env.reset().reshape(1, 2)
    yyy = np.array(env.reset()[0], dtype = float)
    currentState = yyy.reshape(1,2)

    print("============================================")
    rewardSum = 0
    frames = []
    for t in range(200):
        # Capture frame for GIF
        frames.append(env.render())
        action = np.argmax(model.predict(currentState, verbose=0)[0])
        result = env.step(action)
        new_state, reward, done, info = result[:4]
        new_state = new_state.reshape(1, 2)
        if new_state[0][0] >= 0.5 :
            reward += 10
        currentState = new_state
        rewardSum += reward
        if done:
            print("Episode finished after {} timesteps with reward: {}".format(t+1, rewardSum))
            # Break out after collecting frames for the first episode
            break
    # Stop after the first episode for GIF creation
    if rewardSum > best_score:
        best_score = rewardSum
        best_episode = i_episode
        frames_to_render = frames
    print(f"Episode {i_episode + 1} finished with score: {rewardSum}")


env.close()

# Save frames as GIF
imageio.mimsave('mountaincar.gif', frames_to_render, fps=30)  # Adjust fps as needed