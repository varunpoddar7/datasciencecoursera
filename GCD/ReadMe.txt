README.text for cleaning fitness data

The code file contained herewith takes into account the following datasets merged onto one dataset, with the average value for each observation reported. 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The dataset contains fitness tracker information for 30 volunteers within an age bracket of 19-48 years on six types of activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. This was observed using Samsung Galaxy S II on the waist. From the 561-feature vector dataset, we focused on mean and standard deviation measurements. for these activities. 

The goal was to provide an average estimate for each such measurement, based on the volunteer (subjectId) and activity type. 

Four files included in this folder are:
ReadMe.txt: basic overview of the assignment
Codebook.md: reference to code chunks to help follow steps from reading and consolidating data, to calculating the mean and re-organizing the dataset
run_analysis.R: supporting R code for the submission
tidyData.txt: the text output file with data summarized by subject and activity class

