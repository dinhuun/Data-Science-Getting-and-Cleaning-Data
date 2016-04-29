## Step 1: merge training set and test set into one data set
# read the activities and features into data frames
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# read the train data into data frame
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# read the test data into data frames
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# names the columns in subject data with "subject_ID"
names(subject_train) <- "subject_ID"
names(subject_test) <- "subject_ID"

# names the columns in X with features and the columns in y with "activity"
names(X_train) <- features$V2
names(y_train) <- "activity"
names(X_test) <- features$V2
names(y_test) <- "activity"

# merge the test set and training set into one data set
train <- cbind(subject_train, y_train, X_train) # dim 7352x563
test <- cbind(subject_test, y_test, X_test) # dim 2947x563
data <- rbind(train, test) # dim 10299x563

## Step 2: extracts only the measurements on the mean and standard deviation for each measurement
# take logical vector of column names of data that contain "subject_ID", "activity", "mean" or "std"
v <- grepl("subject_ID|activity|mean\\(\\)|std\\(\\)", colnames(data))
dataExtracted <- data[, v] # dim 10299x68

## Step 3: name the activities 1,..., 6 in data set with descriptive activity names WALKING, WALKING_UPSTAIRS,
## WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
dataExtracted$activity <- factor(dataExtracted$activity, labels = activity_labels[ , 2])

## Step 4: label the data set with descriptive variable names
names(dataExtracted) # they look fine as they are, no changes

## Step 5: creates a tidy data set with the average of each variable for each activity and each subject
library(reshape2)
# create the tidy data set
dataMelted <- melt(dataExtracted, id = c("subject_ID", "activity"))
dataTidy <- dcast(dataMelted, subject_ID+activity ~ variable, mean)

# write dataTidy to file "dataTidy.csv"
write.csv(dataTidy, "dataTidy.csv", row.names=FALSE)