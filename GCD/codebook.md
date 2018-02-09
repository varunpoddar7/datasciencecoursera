---
title: "CodeBook"
author: "Varun Poddar"
date: "2/8/2018"
output: html_document
---


## Overview

This is a codebook reference file for cleaning up the fitness data. The dataset contains fitness tracker information for 30 volunteers within an age bracket of 19-48 years on six types of activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. This was observed using Samsung Galaxy S II on the waist. From the 561-feature vector dataset, we focused on mean and standard deviation measurements. for these activities. 

## Read Data
Step-1: Read all the basic activity class and feature information using fread from data.table
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

## Find Subset of Variables
Step-2: Used grep to find and subset only the mean and std columns out of the 561 column vector dataset. Store this in a variable "featureNames"

## Read activity measurements for test and training datasets
Step-3: Read the following files using fread from the data.table package
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Combine datasets
Step-4: bind the subject and activity class information to the training and test datasets so that each observation can be tied to one of the 30 volunteers and one of the six activity classes. Used bind_cols to combine these observations each for training and test data; then used bind_rows to merge them into one dataset called tidyData. 

## Data Transformation Setup
tidyData data.frame contains data on Activities, Subject and all narrowed down Measurements in one dataset combined for the training and test data. 

Then, column names were cleaned up and re-ordered to reflect each subjectId, activityClassId and activityClassName. Used join function to get the corresponding variable name for each activity type id. Also, just in case need be, converted both subjectId and activityId into factors. Converted the data frame to a data table to simplify the mean calculation.

Output from column names after organized dataset:
 [1] "subjectId"                 "activityClassId"           "activityClass"            
 [4] "tBodyAcc-mean-X"           "tBodyAcc-mean-Y"           "tBodyAcc-mean-Z"          
 [7] "tBodyAcc-std-X"            "tBodyAcc-std-Y"            "tBodyAcc-std-Z"           
[10] "tGravityAcc-mean-X"        "tGravityAcc-mean-Y"        "tGravityAcc-mean-Z"       
[13] "tGravityAcc-std-X"         "tGravityAcc-std-Y"         "tGravityAcc-std-Z"        
[16] "tBodyAccJerk-mean-X"       "tBodyAccJerk-mean-Y"       "tBodyAccJerk-mean-Z"      
[19] "tBodyAccJerk-std-X"        "tBodyAccJerk-std-Y"        "tBodyAccJerk-std-Z"       
[22] "tBodyGyro-mean-X"          "tBodyGyro-mean-Y"          "tBodyGyro-mean-Z"         
[25] "tBodyGyro-std-X"           "tBodyGyro-std-Y"           "tBodyGyro-std-Z"          
[28] "tBodyGyroJerk-mean-X"      "tBodyGyroJerk-mean-Y"      "tBodyGyroJerk-mean-Z"     
[31] "tBodyGyroJerk-std-X"       "tBodyGyroJerk-std-Y"       "tBodyGyroJerk-std-Z"      
[34] "tBodyAccMag-mean"          "tBodyAccMag-std"           "tGravityAccMag-mean"      
[37] "tGravityAccMag-std"        "tBodyAccJerkMag-mean"      "tBodyAccJerkMag-std"      
[40] "tBodyGyroMag-mean"         "tBodyGyroMag-std"          "tBodyGyroJerkMag-mean"    
[43] "tBodyGyroJerkMag-std"      "fBodyAcc-mean-X"           "fBodyAcc-mean-Y"          
[46] "fBodyAcc-mean-Z"           "fBodyAcc-std-X"            "fBodyAcc-std-Y"           
[49] "fBodyAcc-std-Z"            "fBodyAccJerk-mean-X"       "fBodyAccJerk-mean-Y"      
[52] "fBodyAccJerk-mean-Z"       "fBodyAccJerk-std-X"        "fBodyAccJerk-std-Y"       
[55] "fBodyAccJerk-std-Z"        "fBodyGyro-mean-X"          "fBodyGyro-mean-Y"         
[58] "fBodyGyro-mean-Z"          "fBodyGyro-std-X"           "fBodyGyro-std-Y"          
[61] "fBodyGyro-std-Z"           "fBodyAccMag-mean"          "fBodyAccMag-std"          
[64] "fBodyBodyAccJerkMag-mean"  "fBodyBodyAccJerkMag-std"   "fBodyBodyGyroMag-mean"    
[67] "fBodyBodyGyroMag-std"      "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std" 

## Calculate and Output Summary Observations
Using functions in the data.table package, each column measurement is averaged (with lapply) as grouped by the subject, activityClassId and activity Class Name (using by operator) to provide the desired mean calculation. This is then returned as a text file.  