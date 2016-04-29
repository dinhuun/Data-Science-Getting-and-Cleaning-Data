# Getting and Cleaning Data - Course Project

## This Repository
contains the course project for Getting and Cleaning Data by Johns Hopkins on Coursera in April, 2016.

## The Data
about human movement was recorded with a smartphone by UCI staff and stored at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The Script
```run_analysis.R``` does the following processing steps:

1. merge the training set and the test set into one data set.

2. extract only the measurements on the mean and standard deviation for each measurement.

3. use descriptive activity names to name the activities in the data set.

4. label the data set with descriptive variable names.

5. creates a tidy data set with the average of each variable for each activity and each subject.

It uses the ```reshape2``` package.

## The Output
is stored in ```dataTidy.txt```.

## The Codebook
contains more information about the data sets and the processing steps.