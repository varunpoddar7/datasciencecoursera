## Getting & Cleaning Data Final Project
## Varun Poddar
## Feb 5 2018

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names.
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# get packages and dataset
packages <- c("data.table", "reshape2", "dplyr")
sapply(packages, require)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileDestination <- file.path(getwd(), "CourseraDataSc/GCD/") 
download.file(fileURL, file.path(fileDestination, "projectfiles.zip"), method="curl")
unzip(zipfile = "projectFiles.zip")

#get activity classes and mean / std
activityClass <- fread(file.path(fileDestination, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("activityId", "activityClass"))
features <- fread(file.path(fileDestination, "UCI HAR Dataset/features.txt")
                  , col.names = c("featureId", "featureTitle"))
featureSubset <- grep("(mean|std)\\(\\)", features[, featureTitle])
featureNames <- features[featureSubset, gsub('[()]', '', featureTitle)]

#get and merge test / training datasets
testData <- fread(file.path(fileDestination, "UCI HAR Dataset/test/X_test.txt"))[, featureSubset, with=FALSE]
setnames(testData, colnames(testData), featureNames)

testActivities <- fread(file.path(fileDestination, "UCI HAR Dataset/test/Y_test.txt")
                            , col.names = c("activityClassId"))
testSubject <- fread(file.path(fileDestination, "UCI HAR Dataset/test/subject_test.txt")
                         , col.names = c("subjectId"))
testData <- bind_cols(testSubject, testActivities, testData)
rm(testActivities, testSubject)

trainingData <- fread(file.path(fileDestination, "UCI HAR Dataset/train/X_train.txt"))[, featureSubset, with=FALSE]
setnames(trainingData, colnames(trainingData), featureNames)
trainingActivities <- fread(file.path(fileDestination, "UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("activityClassId"))
trainingSubject <- fread(file.path(fileDestination, "UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("subjectId"))
trainingData <- bind_cols(trainingSubject, trainingActivities, trainingData)
rm(trainingActivities, trainingSubject)

#reorganize dataset
tidyData <- bind_rows(trainingData, testData)
tidyData <- inner_join(tidyData, activityClass, by = c("activityClassId" = "activityId"))
tidyData$activityClassId <- as.factor(tidyData[, "activityClassId"]) 
tidyData$subjectId <- as.factor(tidyData[, "subjectId"]) 
setcolorder(tidyData, c(1:2, 69, 3:68))
setorder(tidyData, subjectId, activityClassId)

#return averages for each variable by subject and activity
setDT(tidyData)
tidyData <- tidyData[, lapply(.SD, mean), by= .(subjectId, activityClassId, activityClass)]
fwrite(tidyData, file.path(fileDestination, "tidyData.txt"), row.names=FALSE)