# Getting and Cleaning Data
Getting and Cleaning Data | Week 4 Peer-Reviewed Assignment

## Peer-Reviewed Assignment

Assignment: Create an R script called run_analysis.R that performs the following steps to make a clean data set.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Please follow the following steps to arrive at a clean data set

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```
3. Set the directory containing the R scrip bit as your working directory using ```setwd()``` function in R/RStudio.
4. Run ```source("run_analysis.R")```, this will generate two new files ```merged.csv``` and ```means.csv``` in your working directory.

## Dependencies

```run_analysis.R``` file depends on the ```data.table``` and ```reshape2``` packages.
