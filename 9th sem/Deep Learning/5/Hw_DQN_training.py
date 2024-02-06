import gym
from keras import models
from keras import layers
from keras.optimizers import Adam
from collections import deque
import random
import numpy as np





class MountainCarEnvironment:
    def __init__(self,env):
        """
        First you need to initialize your environment and parameters.
        Choosing these parameters is up to you, so you should tune them for the best results
        """
        self.env = env
        self.gamma = 0.9
        self.epsilon = 1
        self.epsilon_decay = 0.05
        self.epsilon_min = 0.01
        self.learingRate = 0.001
        self.replayBuffer=deque(maxlen=20000)
        self.trainNetwork=self.createNetwork()
        self.episodeNum = 400
        self.iterationNum=201 #max is 200
        self.numPickFromBuffer = 32
        self.targetNetwork=self.createNetwork() 
        self.targetNetwork.set_weights(self.trainNetwork.get_weights())

    def createNetwork(self):
        model = models.Sequential()
        state_shape = self.env.observation_space.shape
        ############# Your model here ######################
        model.add(layers.Dense(24, activation = 'relu', input_shape = state_shape))
        model.add(layers.Dense(48, activation = 'relu'))
        model.add(layers.Dense(self.env.action_space.n, activation = 'linear'))

        ################## Compiling your model #####################
        model.compile(loss = 'mse', optimizer=Adam(lr = self.learingRate))
        return model


    def getBestAction(self, state):
        # Implement epsilon-greedy strategy
        self.epsilon = max(self.epsilon_min, self.epsilon)

        if np.random.rand(1) < self.epsilon:
            action = np.random.randint(0, 3)
        else:
            action = np.argmax(self.trainNetwork.predict(state)[0])

        return action


    def trainFromBuffer(self):
        if len(self.replayBuffer) < self.numPickFromBuffer:
            return
        samples = random.sample(self.replayBuffer,self.numPickFromBuffer)
        states = []
        newStates=[]

        ###### extract states and new states from the samples.
        for sample in samples:
            state, action, reward, new_state, done = sample
            ## Your code here
            states.append(state)
            newStates.append(new_state)
        ###### convert states and new states to be used in the trainNetwork to predict targets
        states_np = np.array(states)
        states = states_np.reshape(self.numPickFromBuffer, 2)

        newStates_np = np.array(newStates)
        newStates = newStates_np.reshape(self.numPickFromBuffer, 2)
        
        ###### calculate the targets for training the network
        targets = self.trainNetwork.predict(states)
        new_state_targets = self.targetNetwork.predict(newStates)

        ###### Implement the logic for updating the targets based on the Q-learning algorithm
        i = 0
        for sample in samples:
            """ the done parameter is a boolean variable which indicates whether or not episode is done"""
            state, action, reward, new_state, done = sample # tuple unpacking
            ### Update target here based on whether it's a terminal state or not
            target = targets[i]
            if done:
                ## Your code here
                target[action] = reward
            else:
                ## Your code here
                Q_future = max(new_state_targets[i])
                target[action] = self.gamma * Q_future + reward
            i = i + 1

        ###### Training the network
        self.trainNetwork.fit(states, targets, epochs=1, verbose=0)


    def orginalTry(self,currentState,eps):
        rewardSum = 0
        max_position=-99
        for i in range(self.iterationNum):

            ###### Choosing the best action
            bestAction = self.getBestAction(currentState)

            ###### show the animation every 50 eps
            if eps % 50 == 0:
                env.render()

            ###### Solicit the new state, reward, and done flag from the environment after an action is taken
            result = env.step(bestAction)
            # Unpack the relevant values
            new_state, reward, done, _ = result[:4]

            new_state = new_state.reshape(1, 2)

            ###### Keep track of max position
            if new_state[0][0] > max_position:
                max_position = new_state[0][0]

            ###### Adjust reward for task completion
            ## Your code here
            if new_state[0][0] >= 0.5:
                reward = reward + 10

            ###### add the experience to the replay buffer
            self.replayBuffer.append([currentState, bestAction, reward, new_state, done])

            ###### training the neural network using experiences stored in the replay buffer.
            # self.trainFromBuffer()
            self.trainFromBuffer()

            ###### update state and handle episode completion
            rewardSum = rewardSum + reward
            currentState = new_state
            if done:
                break
        
        if i >= 199: ## if not reached the goal in 200 timesteps
            print("Failed to finish task in epsoide {}".format(eps))
        else:
            print("Success in epsoide {}, used {} iterations!".format(eps, i))
            self.trainNetwork.save('./trainNetworkInEPS{}.h5'.format(eps)) ## saving the model
        
        ###### synching networks and updating epsilon
        self.targetNetwork.set_weights(self.trainNetwork.get_weights())
        print("now epsilon is {}, the reward is {} maxPosition is {}".format(max(self.epsilon_min, self.epsilon), rewardSum,max_position))
        self.epsilon -= self.epsilon_decay


    def start(self):
        # Training loop over the specified number of episodes
        for eps in range(self.episodeNum):
            ## Reset the environment for a new episode and reshape the initial state
            yyy = np.array(env.reset()[0], dtype = float)
            currentState = yyy.reshape(1,2)
            
            ## Call the orginalTry method to interact with the environment and train the agent
            self.orginalTry(currentState, eps)



env = gym.make('MountainCar-v0')
dqn=MountainCarEnvironment(env=env)
dqn.start()

