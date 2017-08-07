% load training set and testing set
clear all;
train_set = loadMNISTImages('train-images.idx3-ubyte')';
train_label = loadMNISTLabels('train-labels.idx1-ubyte');
test_set = loadMNISTImages('t10k-images.idx3-ubyte')';
test_label = loadMNISTLabels('t10k-labels.idx1-ubyte');
t_1=train_set(1:2000,:);
t_2=train_label(1:2000,:);
t_3=test_set(1:2000,:);
t_4=test_label(1:2000,:);

%Create Object

c=K_Nearst_Neighbors(10,7);


%Get The result
%v-> Time 
%n->  Accurracy
[v,n]=calculate_KNN(c,t_1,t_2,t_3,t_4);



