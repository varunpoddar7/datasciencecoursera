---
title: "CodeBook"
author: "Varun Poddar"
date: "2/8/2018"
output: html_document
---


## R Markdown

This is a codebook reference file for cleaning up the fitness data

### Dataset & Variables
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Data Transformations
Data from Activities, Subject and Measurements were consolidated into one dataset each for the training and test data. This was then combined into one data table using bind_rows

The column names were cleaned up and re-ordered to reflect each subjectId, activityClassId and activityClassName. 

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

### Summary Observations
Using functions in the data.table package, each column measurement is averaged as grouped by the subject, activityClassId and activity Class Name to provide the desired output. 