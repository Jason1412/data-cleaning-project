# data-cleaning-project


Yujie Liu

## Description

This is the explanation materials of the project for Getting and Cleaning Data Course with Johns Hopkins Univ. 

## Source Data

The data set information can be found by http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


## Data Information 

The data include the following files: 
* features.txt
* activity_labels.txt
* subject_test.txt (testing and training)
* X_test.txt (testing and training)
* y_test.txt (testing and training)


## Steps

### Step 1
Read data into data tables using RStudio. Preprocess the column names and add two columns (subject and label) into the data set. 

Then combine the training and testing data. Change the names of the newly added columns. 

### Step 2
Find the column names containing "mean", "std", "subject", "label". Exact the columns and form a new data set named "dat_tot3". 

### Step 3
Modify the abbreviation of the columns names. 
t --- time
f --- frequency
Acc --- Acceleration
Mag --- Magnitude

### Step 4
Use the charaters to change the numeric label into the charaters. 

### Step 5
Find the mean value for each label of each subject. Using "Aggregate" to do that. 

Write the data into .txt. 
