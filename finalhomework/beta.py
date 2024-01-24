# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import numpy as np
from numpy.linalg import inv
import random

def predBeta(beta, n):
    random.seed(9001)
    beta = np.array(beta)
    
    x1 = np.array([1]*n)
    x2 = np.random.binomial(1,0.7,n)
    x3 = np.random.uniform(-1,1,n)
    X = np.column_stack((x1,x2,x3))
    
    error = np.random.normal(0, 1, n)
    y = X.dot(beta.transpose()) + error
    
    term1 = inv(X.transpose().dot(X))
    term2 = X.transpose().dot(y)
    beta_hat = term1.dot(term2)
    
    np.savetxt("X.csv", X, delimiter=",")
    np.savetxt("y.csv", y, delimiter=",")
    
    print(beta_hat)