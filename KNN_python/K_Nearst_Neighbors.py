# -*- coding: utf-8 -*-
"""
Created on Tue Jan 24 22:17:20 2017

@author: Wael Eid
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
import time

class K_Nearst_Neighbors:
    
#*******************************************************        
#Class properties(Attributes).
#*******************************************************  
    
    number_neighbors=0
    number_classes=0
    training_set=t.dmatrix()
    training_set_labels=t.dvector()
    testing_set=t.dmatrix()
    testing_set_labels=t.dvector()
    number_of_correct_classified=0
    execution_time=0
    KNN_accurracy=0
    
#*******************************************************        
#Class constructor
#*******************************************************      
    def __init__(self, number_neighbors, number_classes):
           self.number_neighbors = number_neighbors
           self.number_classes = number_classes

#*******************************************************        
#Load data
#*******************************************************  
   
    def load_data_set_and_get_KNN(self,training_set,training_set_labels,testing_set,testing_set_labels):
        
        start_time = time.time()        #start timer

        self.training_set           =   training_set
        self.training_set_labels    =   training_set_labels
        self.testing_set           =   testing_set
        self.testing_set_labels     =   testing_set_labels
        self.KNN_accurracy=self.test_k_nearst_neigbors(self.testing_set,self.testing_set_labels,self.training_set,self.training_set_labels,self.number_neighbors)
        self.execution_time= time.time() - start_time #stop timer
#*******************************************************        
#compute the k nearst neighbor.
#*******************************************************        
        
        
    def compute_nearest_neighbors(self,test_example,number_nearst_neigbor,train_set_up,labels_train):
       k_nearst_neigbors=[]               #used to store the k_nearst_neighbors  
       replace=t.dvector()                # convert distance from object to real number
       class_and_distance=[]              #store each class and its distance 
       
       for i in range(len(train_set_up)): # Compute the distance between each test example and all examples in training set
         distance=t.sqrt(t.sum(t.pow(t.sub(train_set_up[i],test_example),2)))    #Compute the distance
         replace=distance.eval();
         class_and_distance.append((labels_train[i],replace))
       class_and_distance.sort(key=operator.itemgetter(1))
       #print "Class and distance is:",class_and_distance
       for i in range(number_nearst_neigbor):
            k_nearst_neigbors.append(class_and_distance[i][0])   
       return   k_nearst_neigbors
       
#*******************************************************        
#get_similar class of input data 
       
#*******************************************************  
       
    def get_similar_class(self,k_nearst_neigbors):
     class_count={}
     final_class_prediction=[]
     for i in range(len(k_nearst_neigbors)):
         class_value=k_nearst_neigbors[i]
         if class_value in class_count:
            class_count[class_value]+=1
         else: 
           class_count[class_value]=1
     class_count=sorted(class_count.iteritems(), key=operator.itemgetter(1), reverse=True)
     #print'Class count  is:', class_count
     numbers_vector=[]
     class_vector=[]
     for i in  range(len(class_count)):
         numbers_vector.append(class_count[i][1])
         class_vector.append(class_count[i][0])
    
     final_class_prediction.append(class_vector[0])
     return final_class_prediction  
     
     
#*******************************************************        
# test_k_nearst_neigbors function used to test each testing example with respect to training set.
       
#*******************************************************   
       
    def test_k_nearst_neigbors(self,test_set,test_set_labels,training_data,training_data_labels,k):
      correct_number=0                     #variable to hold number of correct classified classes
      prediction_classes=[]                #variable to store predicted classes
      for i in range(len(test_set)):       #Compare each testing example with respect to training set
        prediction_classes.append(self.get_similar_class(self.compute_nearest_neighbors(test_set[i],k,training_data,training_data_labels))) 
      count=0;                             #is used to display presentage rate of data
      number_count=0                       #10% 20% ...
      print 'Starting..............'    
      for x in range(len(test_set)):
        count=count+1
        limit_display=(len(test_set)/100)
        
        if count % limit_display== 0:
                 number_count=number_count+1
                 print number_count,' % completed.'
                 
        if test_set_labels[x]== prediction_classes[x][0]:
          correct_number +=1
      print 'Finishing..............'
      self.number_of_correct_classified = correct_number
      return  (correct_number/float(len(test_set))) * 100       


