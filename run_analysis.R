library(plyr)
#Reading training datasets and storing in variables
x_train <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/train/subject_train.txt")

#Reading test datasets and storing in variables
x_test <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/test/subject_test.txt")

#Reading feature vector and storing in variables
features <- read.table("./R/Coursera_Assignment/UCI HAR Dataset/features.txt")

#Reading activity labels and storing in variables
activity_labels = read.table("./R/Coursera_Assignment/UCI HAR Dataset/activity_labels.txt")

#Assigning variable names and storing in variables
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activity_labels) <- c("activityID", "activityType")

#Merging all datasets into one set 
alltrain <- cbind(y_train, subject_train, x_train)
alltest <- cbind(y_test, subject_test, x_test)
merged_dataset <- rbind(alltrain, alltest)

#Mean and Standard deviation extraction process

#Reading column names of the merged dataset
colNames <- colnames(merged_dataset)

#Creating vector for defining ID, mean, and sd
mean_and_std <- (grepl("activityID", colNames) |
                   grepl("subjectID", colNames) |
                   grepl("mean..", colNames) |
                   grepl("std...", colNames)
)

#holder for mean and sd
tempforMeanandStd <- merged_dataset[ , mean_and_std == TRUE]

#holder for descriptive activity names
tempForActivityNames <- merge(tempforMeanandStd, activity_labels,
                              by = "activityID",
                              all.x = TRUE)

# Creating a second,  independent tidy data set with the avg of each variable for each activity and subject

#Making a second tidy data set
tidySet1 <- aggregate(. ~subjectID + activityID, tempForActivityNames, mean)
tidySet2 <- tidySet1[order(tidySet1$subjectID, tidySet1$activityID), ]

#Writing second tidy data set into a txt file
write.table(tidySet2, "tidySet.txt", row.names = FALSE)
View(tidySet2)
