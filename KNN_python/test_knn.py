# -*- coding: utf-8 -*-
"""
Created on Fri Jan 27 23:51:14 2017

@author: khaled ghazy
"""
from __future__ import division
import numpy as np
from scipy.misc import imread, imresize
import theano as T
from theano import tensor as t
import operator
import math
from collections import OrderedDict
import gzip
import cPickle
from  K_Nearst_Neighbors import K_Nearst_Neighbors   # import my class


f = gzip.open('mnist.pkl.gz', 'rb')

#X_train: is training set
#y_train: is training set labels
#X_test:  is testing st
#y_test: is testing set labels

(X_train, y_train), (X_test, y_test) = cPickle.load(f)
f.close()
X_train = X_train.reshape(X_train.shape[0], 1, 784)  #training data
X_test=X_test.reshape(X_test.shape[0], 1, 784)       #testing data
train_set=t.dmatrix()                                  #load data in tesor matrix
train_set=X_train                                      
train_labels=t.dvector()                                  #load labels in tensor vector
train_labels=y_train

#**********************************************************************************
test_set=t.dmatrix()                                     #load data in tesor matrix
test_set=X_test                                      
test_labels=t.dvector()                                  #load labels in tensor vector
test_labels=y_test
#***********************************************************************************  
c=K_Nearst_Neighbors(11,10)
c.load_data_set_and_get_KNN(train_set[1:20,:],train_labels[1:20],test_set[1:5,:],test_labels[1:20])
print c.execution_time
print c.KNN_accurracy
print c.number_of_correct_classified
