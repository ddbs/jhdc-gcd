# Course project for Johns Hopkins' Getting and Cleaning Data @ Coursera
# R version 3.2.2, on Linux Mint 17.1, x64

# To run this script on your computer set your own working directory below. 

### Required libraries

#install.packages('dplyr')
#install.packages('reshape2')

library(dplyr)
library(reshape2)


### 0. Load data

# Set working directory --> CHANGE TO YOUR OWN DIRECTORY
setwd('/home/dario/Documents/Data/Courses/CourseraDataScience/projects/03_getting_cleaning_data_project/')

# Download and extract the data
source_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
source_zip <- 'uci_har.zip'
download.file(source_url, destfile = source_zip, method='curl')
unzip(source_zip, overwrite = FALSE)

# load label data
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
features <- read.table('UCI HAR Dataset/features.txt')

# load testing data
x_test <- read.table('UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

# load training data
x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')


### 1. Merges the training and the test sets to create one data set

# merge the train and test data using row binds
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

# label the merged data
colnames(x_merged) <- features$V2
colnames(y_merged) <- 'activityId'
colnames(subject_merged) <- 'subjectId'

# create a dataframe of the merged data using column binds
df <- cbind(subject_merged, y_merged, x_merged)


### 2. Extracts only the measurements on the mean and standard deviation for each measurement

# extract only the mean/std measurements columns using grep + activity/subject
col_subset <- grep('activityId|subjectId|Mean\\()|std\\()', colnames(df), ignore.case = TRUE)
df <- df[, col_subset]


### 3. Uses descriptive activity names to name the activities in the data set

# use descriptive activity names
colnames(activity_labels) <- c('activityId', 'activityDescription')
df <- inner_join(df,activity_labels)

# column rearrangement
df <- df[, c(1, 2, 69, 3:68)]


### 4. Appropriately labels the data set with descriptive variable names

# see labels in 1. 

# enhancing labels
colnames(df) <- sub('tBody','timeBody', colnames(df)) 
colnames(df) <- sub('tGravity','timeGravity',colnames(df))
colnames(df) <- sub('fBody','functionBody',colnames(df))
colnames(df) <- sub('\\()','',colnames(df))


### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# cast into a new dataframe
df_melted <- melt(df, id = c('subjectId', 'activityId', 'activityDescription'))
df_casted <- dcast(df_melted, subjectId + activityId + activityDescription ~ variable, mean)

# write the tidy data set 
write.table(df_casted, 'uci_har_means_tidy.txt', row.names = FALSE)

# export vars for codebook.md
#write.table(colnames(df_casted),'vars_tidy.txt')