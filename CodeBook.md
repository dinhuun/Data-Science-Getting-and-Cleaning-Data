# Code Book
This code book describes the data used in this project and how it is processeed into the tidy data set.

## The Files
30 volunteers performed 6 activities while wearing a smartphone. Data about their movements in the X,Y,Z directions was captured and stored in the following files. 

* ```activity_labels.txt```: names and IDs of the 6 activities performed.
* ```features_info.txt```: information about the 561 features captured.
* ```features.txt```: names of the features.
* ```X_train.txt```: 7352 observations of the features for 21 training volunteers.
* ```subject_train.txt```: IDs of the training volunteers corresponding to the observations in ```X_train.txt```.
* ```y_train.txt```: IDs of the activities corresponding to the observations in ```X_train.txt```.
* ```X_test.txt```: 2947 observations of the features for 9 test volunteers.
* ```subject_test.txt```: IDs of the test volunteers corresponding to the observations in ```X_test.txt```.
* ```y_test.txt```: IDs of the activities corresponding to the observations in ```X_test.txt```.

More information about these files is in ```README.txt``` in the downloaded folder.

This analysis does not use the raw signal data stored in the Inertial Signals folders.

## The Processing Steps
1. read relevant data files into data frames, add appropriate column headers and merge the training set and test set into one data set.
2. extract subject_ID column, activity column and 66 columns containing mean and std measurements.
3. convert activity column of activity IDs to a factor of descriptive activity labels.
4. (not) label the data set with descriptive variable names, they are already descriptive enough and kept as are.
5. create a tidy data set with the mean of each feature for each subject and each activity and store it in ```dataTidy.csv```. Since each subject has 6 rows for 6 activities and each row contains the mean for each of the 66 features for that subject/activity combination, the tidy data set has dimensions (30*6)x(2+66) = 180x68.