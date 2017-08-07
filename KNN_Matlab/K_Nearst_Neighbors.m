classdef K_Nearst_Neighbors
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        number_neighbors;
        number_classes;
    end
    
    methods
        function obj = K_Nearst_Neighbors(num_classes,num_neighbors)
            obj.number_neighbors=num_neighbors;
            obj.number_classes=num_classes;
        end
        function [time,accuracy]=calculate_KNN(obj,train_set,train_label,test_set,test_label)
            train_set_number_observations = size(train_set);                         %number of observations in the training set.
            test_set_number_observations = size(test_set);                           %number of observations in the test  set.
            test_classify_label = zeros(test_set_number_observations(1),1);          %vector to hold the result of classification
           %__________________________________________________________________________
           %Calculate distance.
           %__________________________________________________________________________
           tic;                                                                     %start the timer
           for i=1:test_set_number_observations(1)                                  %get the test data example by example
              test_example = test_set(i,:);                                        %set each test example in a separate vector
              dist = zeros(train_set_number_observations(1),1);                    %create distance vector to hold all distances between test example and all training ones
              for j=1:train_set_number_observations(1)
                 % calculate the distance between test point i and train point j
                   train_point = train_set(j, :);
                   tmp = test_example - train_point;
	               dist(j) = sqrt(sum(tmp.*tmp));                                       %calculate the distance between two observations
                 end
 %_________________________________________________________________________   
 % find the k-nearest neighbor 
 %_________________________________________________________________________
    dist_tmp = sort(dist);                                                %sort the distance vector
    num = zeros(obj.number_classes, 1);                                                   %create vector to count classes in k--nearst neighbors.
    for k=1:obj.number_neighbors                                           %Find the k--nearst neighbors
       idx = find(dist==dist_tmp(k));                                     %Find index of class
       num(train_label(idx)+1) = num(train_label(idx)+1)+1;               %Count number of each class repetition in k--nearst neighbors
    end
           end
%__________________________________________________________________________
%Classify the given test observation.
%__________________________________________________________________________
    maxIdx = 0;                                                           %Variable to store index of class with the maximum count.
    maxNum = -1;                                                          %Variable  to store the count of the maximum class
    for k=1:obj.number_classes
      if(num(k)>maxNum)
         maxIdx = k;
         maxNum = num(k);
      end
    end 
    test_classify_label(i) = maxIdx-1;                                     %Get test example final classification.

%__________________________________________________________________________
%Calculate time and KNN accurracy.
%__________________________________________________________________________
time = toc;
% calculate accuracy
num_correct = sum(test_label==test_classify_label);
accuracy = (num_correct / test_set_number_observations(1));

        end
    end
end


    

