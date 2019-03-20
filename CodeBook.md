#This is the code book for the project

##How to get to the tidySet.txt:
1. Download data from the link below and unzip it into working directory of R Studio.
2. Execute the R script.

## About the source data
The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## About R script
-File with R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):   
-Merges the training and the test sets to create one data set in variable name "merged_dataset"
-Extracts only the measurements on the mean and standard deviation for each measurement. Variable "mean_and_std" has this information.
-Uses descriptive activity names to name the activities in the data set, you can find this in "tempForActivityNames"
-Appropriately labels the data set with descriptive variable names.
-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code assumes all the data is present in the same folder, un-compressed and without names altered.

## About variables:   
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `alltrain` contains merged data of all training data set
* `alltest`  contains merged data of all test data set
* `merged_dataset` merges the training and testing datasets for further analysis.
* `features` contains the data from the feature data set
* `tidySet2` contains the tidy data to be used for analysis.
