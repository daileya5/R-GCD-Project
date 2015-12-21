## This R script was created for the Coursera Course:
## Getting and Cleaning Data
## University: Johns Hopkins University
## Instructor: Jeff Leek

## This script will create a "tidy" dataset from 
## the Human Activity Recognition Using Smartphone Data Set
## available from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## This script will create a tidy dataset by merging the 
## training and test sets into one data set, 
## extracting the mean and standard deviation for each measurement, 
## apply descriptive activity names to each variable, 
## and finally create a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

## The author of this script used the following resources to complete this assignment:
## Coursera discussion forums
## https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

## To Run
# setwd("R-GCD-Project")
# source("run_analysis.R")

# Load Libraries

library(plyr)
library(reshape)




# First read in data


# Store the initial working directory
initial.wd <- getwd()

# Switch to the directory containing the test data
setwd("UCI_HAR_Dataset/test")


# Read in Subjects for test dataset
subject.test <- read.table(file="subject_test.txt", header=FALSE)

# Read in Activity Numbers for test dataset
Y.test <- read.table(file="Y_test.txt", header=FALSE)

# Read in X Columns for test dataset
X.test <- read.table(file="X_test.txt", header=FALSE)


# Change to the root data directory
setwd("..")

# Change to the directory containing the training data
setwd("train")


# Read in Subjects for training dataset
subject.train <- read.table(file="subject_train.txt", header=FALSE)

# Read in Activity Numbers for training dataset
Y.train <- read.table(file="Y_train.txt", header=FALSE)

# Read in X Columns for training dataset
X.train <- read.table(file="X_train.txt", header=FALSE)


# Change to the root data directory
setwd("..")


# Read in Activity Labels
activity.labels <- read.table(file="activity_labels.txt", header=FALSE)

# Create column names for activity.labels
colnames(activity.labels) <- c("activity.labels", "activity.name")


# Read in Features (variable names)
features <- read.table(file="features.txt", header=FALSE, sep="")


# Return to the initial working directory
setwd(initial.wd)




# Step 1. Merge the training and the test sets to create one data set.


# Use rbind to append the Subjects test data to the Subjects training data
subject.train.test <- rbind(subject.train, subject.test)

# Create column names for merged Subjects dataset
colnames(subject.train.test) <- c("subject")



# Use rbind to append the activity.labels test data to the activity.labels training data
Y.train.test <- rbind(Y.train, Y.test)

# Create column names for merged activity.labels dataset
colnames(Y.train.test) <- c("activity.labels")



# Use rbind to append the activity.labels test data to the activity.labels training data
X.train.test <- rbind(X.train, X.test)

# Convert column 2 of the features data to a vector to be used as column names for merged X dataset
x.col.names <- as.vector(features[,2])

# Create column names for merged activity.labels dataset using vector created above
colnames(X.train.test) <- x.col.names



# Use cbind to combine subjects, activity labels, and X columns by column
merged.train.test.data <- cbind(subject.train.test, Y.train.test, X.train.test)




# Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 


# Create an index of variable names that end in "mean" or "std" for mean | standard deviation
variables.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# Create a subset of the merged data set that contains only the subject, activities, and
# variables that end in "mean" or "std" as defined by the variables. mean.std
mean.and.std.subset <- merged.train.test.data[, c(1,2, variables.mean.std$V1+2)]




# Step 3. Use descriptive activity names to name the activities and variables in the data set


# Create a new data frame (subset.w.desc) by joining the activity labels to the mean.and.std.subset
# using the "Activity Labels" column as the join field
subset.w.desc <- join(mean.and.std.subset, activity.labels, by = "activity.labels")

# The join function adds the descriptive activity labels as the last column in the subset.w.desc data frame
# Replace the activity labels in column 2 with the descriptive activity labels in the last column
subset.w.desc[,2] <- subset.w.desc[,ncol(subset.w.desc)]

# Now that we no longer need the last column in the subset.w.desc,
# remove it from the data frame
subset.w.desc[,ncol(subset.w.desc)] <- NULL




# Step 4. Appropriately label the data set with descriptive variable names. 


# I am using the conventions outlined in the Google R style guide for naming the variable names
# https://google.github.io/styleguide/Rguide.xml#attach

# According to this style guide, the important considerations are:
# 1. variable names should be all lower case
# 2. words in variable names should be separated by a "." not an "_"

# Furthermore, according to the assignment, postings on course discussion pages, and other resources, 
# variable names should be meaningful and easily understood by a non-domain expert.
# Specifically, abbreviations should be spelled out and special symbols should be removed (except for ".")



# First replace and spaces (" ") with a period (".") per R style guide
names(subset.w.desc)<- gsub("([ ])", ".", names(subset.w.desc))


# Then remove special characters, e.g. "()-", and make all letters lower case per R style guide

names(subset.w.desc) <- tolower(gsub("([()-])", "", names(subset.w.desc)))





# Now we will have to deal with abbreviations


# time replaces the prefix t
names(subset.w.desc)<-gsub("^t", "time.", names(subset.w.desc))

# frequency replaces the prefix f
names(subset.w.desc)<-gsub("^f", "frequency.", names(subset.w.desc))

# accelerometer. replaces acc
names(subset.w.desc)<-gsub("acc", "accelerometer.", names(subset.w.desc))

# gyroscope. replaces gyro
names(subset.w.desc)<-gsub("gyro", "gyroscope.", names(subset.w.desc))

# magnitude. replaces mag
names(subset.w.desc)<-gsub("mag", "magnitude.", names(subset.w.desc))

# body. replaces body
names(subset.w.desc)<-gsub("body", "body.", names(subset.w.desc))

# jerk. replaces jerk
names(subset.w.desc)<-gsub("jerk", "jerk.", names(subset.w.desc))




# Now we will have to add a space (".") between words where they don't exist, per R style guide
# There was probably an easier way of achieving this, but this gets the job done


names(subset.w.desc)<-gsub("gravitymean", "gravity.mean", names(subset.w.desc))


names(subset.w.desc)<-gsub("gravityaccelerometer", "gravity.accelerometer", names(subset.w.desc))


names(subset.w.desc)<-gsub("freqx", "freq.x", names(subset.w.desc))


names(subset.w.desc)<-gsub("freqy", "freq.y", names(subset.w.desc))


names(subset.w.desc)<-gsub("freqz", "freq.z", names(subset.w.desc))


names(subset.w.desc)<-gsub("meanfreq", "mean.freq", names(subset.w.desc))


names(subset.w.desc)<-gsub("meanx", "mean.x", names(subset.w.desc))


names(subset.w.desc)<-gsub("meany", "mean.y", names(subset.w.desc))


names(subset.w.desc)<-gsub("meanz", "mean.z", names(subset.w.desc))


names(subset.w.desc)<-gsub("stdx", "std.x", names(subset.w.desc))


names(subset.w.desc)<-gsub("stdy", "std.y", names(subset.w.desc))


names(subset.w.desc)<-gsub("stdz", "std.z", names(subset.w.desc))




# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



# Create a tidy data set in wide format

# We use the aggregate function to calculate the mean for columns 3:the end of the dataset,
# by the factors in columns 1 and 2
tidy.data <- aggregate(subset.w.desc[,3:ncol(subset.w.desc)], by=list(subset.w.desc[,1], subset.w.desc[,2]), FUN= "mean")

# Because the aggregate function changed the column names of the first two columns,
# we need to change column names those columns here so they are descriptive
colnames(tidy.data)[1:2] <- c("subject", "activity.labels")



# Create a tidy data set in narrow format (did this just to make sure I could do it)

# We need a vector containing the column names of the intermediate data set for the melt function below
col.names <- colnames(subset.w.desc)

# We use the melt function to calculate the mean for columns 3: the end of the dataset,
# by the factors in columns 1 and 2
# then the name of each variable is placed in a variable column and
# the average for that variable is placed in the value column
tidy.data.narrow <- melt(tidy.data, id=c("subject","activity.labels"), measure.vars= col.names[3:ncol(subset.w.desc)])

# Because the melt function changes the column names, we need to change column names to descriptive names
colnames(tidy.data.narrow)[3:4] <- c("variable.name", "mean")




# Step 6. Upload the data set created in step 5 as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).


# Write the tidy.data data frame to a csv file named tidy.data.csv
# As per instructions, row names are not used
# I am including column names because creating descriptive column names was part of the assignment
write.table(tidy.data, file = "tidy.data.csv" , append = FALSE, quote = TRUE, sep = ",", row.names = FALSE, col.names=TRUE)


# Alternatively, write the narrow tidy data set to the tidy.data.csv
# write.table(tidy.data.narrow, file = "tidy.data.csv" , append = FALSE, quote = TRUE, sep = ",", row.names = FALSE, col.names=TRUE)




# Provide instructions for marker for reading tidy dataset back into R

# data <- read.table(file="tidy.data.csv", header = TRUE, quote = TRUE, sep=",")
# View(data)






# The end.