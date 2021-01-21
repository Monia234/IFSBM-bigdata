# -*- coding: utf-8 -*-
"""
@created: 01/21/21
@modified: 01/21/21
@author: Yoann Pradat

    CentraleSupelec
    MICS laboratory
    9 rue Juliot Curie, Gif-Sur-Yvette, 91190 France

Useful functions for illustrating the lecture
"""

import numpy as np
import pandas as pd

from matplotlib.colors import ListedColormap
import matplotlib.pyplot as plt
import seaborn as sns

import scipy.stats as stats

# Generate data ========================================================================================================

def plot_1d_data(X, bins=30):
    fig, ax = plt.subplots(1,1,figsize=(8,4))
    sns.histplot(X, bins=bins)
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)
    ax.spines["left"].set_position("zero")
    ax.spines["bottom"].set_position("zero")
    ax.tick_params(axis="y", labelsize=0)
    ax.tick_params(axis="x", labelsize=16)
    ax.set_ylabel("")
    plt.show()

def plot_2d_data(X, Y):
    fig, ax = plt.subplots(1,1,figsize=(8,4))
    ax.scatter(X,Y, color="dodgerblue", alpha=0.7, marker='o', s=50)
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)
    ax.spines["left"].set_position("zero")
    ax.spines["bottom"].set_position("zero")
    ax.tick_params(axis="y", labelsize=14)
    ax.tick_params(axis="x", labelsize=14)
    ax.set_xlabel("X", fontsize=14)
    ax.set_ylabel("Y", fontsize=14)
    plt.show()

def make_unknown_1d_data(n=1500, mu=2, sigma=1, seed=2):
    np.random.seed(seed)
    X =  mu + sigma*np.random.randn(n)
    return X

def make_unknown_2d_data(n=1500, alpha=-1, beta=4, sigma=1, seed=2):
    np.random.seed(seed)
    X = np.random.randn(n,1)
    N = sigma * np.random.randn(n,1)
    Y = alpha + beta*X + N
    return X, Y


def make_unknown_2d_data_logistic(n=20, p=2):
    X = np.concatenate((np.random.rand(n,p)-1, 0.5*(np.random.rand(n,p)+1)))
    Y = np.concatenate((np.repeat(-1, n), np.repeat(1, n)))
    return X, Y


# Likelihood ===========================================================================================================


def likelihood(theta):
    return -1/theta - theta**2


def plot_likelihood_principle():
    X = np.linspace(0.1, 5, 200)
    Y = likelihood(X)

    fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(14, 6))

    #### likelihood
    ax.plot(X, Y, color='indianred', label='vraisemblance')

    #### optimal point
    x_opt = 0.5**(1/3)
    y_opt = likelihood(x_opt)
    ax.vlines(x_opt, 0, y_opt, linestyle='dashed', linewidth=3)
    ax.text(x=0.9*x_opt, y=1, s=r'$\widehat{\theta^*}$', fontsize=25)

    #### settings
    ax.set_xlabel(r'$\theta$', fontsize=20)
    ax.set_ylabel(r'$\mathcal{L}(\theta)$', fontsize=20)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['bottom'].set_position('zero')
    ax.spines['left'].set_position('zero')
    ax.tick_params(axis='both', which='major', labelsize=0, length=0)
    ax.legend(loc='lower right', fontsize=20, frameon=False)
    plt.show()


# Régression logistique ===============================================================================================

def plot_illustrate_logistic():
    X, Y = make_unknown_2d_data_logistic()

    ####
    #### plot
    ####
    fig, ax = plt.subplots(nrows=1, ncols=2, figsize=(14, 5))

    #### scatter points 
    ax[0].scatter(X[Y==-1, 0], X[Y==-1, 1], color='indianred', marker='+', s=150, label='class -1')
    ax[0].scatter(X[Y==1, 0], X[Y==1, 1], color='blue', marker='o', facecolors='none', s=150, label='class 1')

    #### settings
    ax[0].set_xlabel(r'$x_1$', fontsize=20)
    ax[0].set_ylabel(r'$x_2$', fontsize=20)
    ax[0].spines['top'].set_visible(False)
    ax[0].spines['right'].set_visible(False)
    ax[0].set_xticks([])
    ax[0].set_yticks([])
    ax[0].legend(loc='lower right', fontsize=20, frameon=False)

    def sigmoid(z):
        return 1/(1+np.exp(-z))

    X_sig = np.linspace(-10, 10, 200)
    Y_sig = sigmoid(X_sig)

    #### sigmoid 
    ax[1].plot(X_sig, Y_sig, color='orange', label='fonction sigmoid')
    ax[1].set_xlabel(r'$x^\top\theta$', fontsize=20)
    ax[1].set_ylabel(r'$\sigma(x^\top\theta)$', fontsize=20)
    ax[1].tick_params(axis='both', which='major', labelsize=15)
    ax[1].spines['top'].set_visible(False)
    ax[1].spines['right'].set_visible(False)
    ax[1].spines['left'].set_position('zero')
    ax[1].legend(loc='lower right', fontsize=15, frameon=False)

    plt.show()


def plot_decision_regions(X, y, classifier, ax, test_idx=None, resolution=0.02):
    markers = ('+', 'o', 'x', '^', 'v')
    colors = ('red', 'blue', 'lightgreen', 'gray', 'cyan')
    cmap = ListedColormap(colors[:len(np.unique(y))])
    x1_min, x1_max = X[:,0].min()-0.5, X[:,0].max()+0.5
    x2_min, x2_max = X[:,1].min()-0.5, X[:,1].max()+0.5
    xx1, xx2 = np.meshgrid(np.arange(x1_min, x1_max, resolution),
                           np.arange(x2_min, x2_max, resolution))
    Z = classifier.predict(np.array([xx1.ravel(), xx2.ravel()]).T)
    Z = Z.reshape(xx1.shape)
    ax.contourf(xx1, xx2, Z, alpha=0.3, cmap=cmap)
    ax.set_xlim(xx1.min(), xx1.max())
    ax.set_ylim(xx2.min(), xx2.max())

    for idx, cl in enumerate(np.unique(y)):
        ax.scatter(x=X[y==cl,0],y=X[y==cl,1], alpha=0.8,
                   marker=markers[idx], c=colors[idx],
                   label=cl, s=150, edgecolor='black')

    if test_idx:
        X_test = X[test_idx, :]
        ax.scatter(X_test[:, 0], X_test[:, 1],
                   c='', edgecolor='black', alpha=1.0,
                   linewidth=0.5, marker='o',
                   s=200, label='test set')


# Régression linéaire ================================================================================================

def plot_illustrate_linear():
    beta=2
    sigma=0.2
    n=20

    X, Y = make_unknown_2d_data(n=n, alpha=0, beta=beta, sigma=sigma)

    #### estimator
    beta_hat = np.linalg.inv(X.T.dot(X)).dot(X.T.dot(Y)).flatten()[0]

    ####
    #### plot residuals
    ####
    fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(14, 5))

    #### scatter points 
    ax.scatter(X, Y, color='black', label='données (n=%d)' % n)
    ax.plot(X, beta*X, color='red', label='vrai model')

    #### plot residuals distrib
    X_norm = np.linspace(-1, 1, 100)
    Y_norm = stats.norm.pdf(X_norm, loc=0, scale=sigma)
    ax.plot(Y_norm/25 + X[0], X_norm + beta*X[0], color='blue', label='vraie densité des residus')
    for x in X[1:]:
        ax.plot(Y_norm/25 + x, X_norm + beta*x, color='blue')

    #### settings
    ax.set_xlabel(r'$x$', fontsize=20)
    ax.set_ylabel(r'$y$', fontsize=20)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.set_xticks([])
    ax.set_yticks([])
    ax.legend(loc='lower right', fontsize=20, frameon=False)
    plt.show()
