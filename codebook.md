| tidy.data | Codebook | 2015/12/25 |


## Project Description
This "tidy" dataset was created from the [Human Activity Recognition Using Smartphone Data Set.]
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) The description of the study design and data processing, collection of the raw data, notes on the original data, and descriptions of the variables are taken directly from the README.txt and features_info.txt files included with the original dataset. 


## Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

### Collection of the raw data
Using the embedded accelerometer and gyroscope in the Samsung Galaxy S II, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Raw data processing
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Each record includes:
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
 - Its activity label. 
 - An identifier of the subject who carried out the experiment.

### Notes on the original (raw) data 
 - Features are normalized and bounded within [-1,1].
 - Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


## Creating the tidy datafile

### Cleaning the data
This tidy dataset is the end result of a script that merged an existing dataset into one table, selected only variables that are means or standard deviations of measurements, added descriptive variable names and activity names, and finally, created a separate data set that has aggregated each variable by test subject and activity name.  

[See the readme document,] (https://github.com/daileya5/R-GCD-Project/blob/master/README.md) which describes the necessary steps to run the data cleaning script called run_analysis.R on your own computer.

### Steps in creating the tidy data file
This script created a tidy dataset by: 
 1. downloading the original dataset from this url: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 2. merging the training and test sets into one data set, 
 3. extracting the mean and standard deviation for each measurement, 
 4. applying descriptive names to each variable and activity, and, finally,
 5. create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Detailed Description of Tidy Data Processing Steps

#### Step 1: Downloading the Dataset
The script downloads the original Human Activity Recognition Using Smartphone Data Set and unzips it to a folder called "UCI_HAR_Dataset" in the R-GCD-Directory. The UCI_HAR_Dataset contains the following files:

* activity_labels.txt : A text file containing descriptive activity labels for each activity code in the dataset.

* features_info.txt : A text file explaining the meaning of the variables in the original dataset.

* features.txt : A list of all of the variables in the original dataset.

* test/ : A directory containing the following test data:

 * Inertial Signals/: The acceleration signal from the smartphone accelerometer. Not used in this script.

 * subject_test.txt: A column of numbers representing the subjectst that performed the test activities.

 * X_test.txt: The test dataset.

 * y_test.txt: The test dataset activity labels.

* train/ : A directory containing the following training data:

 * Inertial Signals/: The acceleration signal from the smartphone accelerometer. Not used in this script.

 * subject_training.txt: A column of numbers representing the subjectst that performed the test activities.

 * X_training.txt: The training dataset.

 * y_training.txt: The training dataset activity labels.


#### Step 2: Merging the Dataset into One Data Frame
The script first merges the training and test data using the row bind (rbind) command as follows:
 * the subject.test data is appended to the subject.train data
 * the X.test data is appended to the X.train data
 * the y.test data is appended to the y.train data

Then the script applies descriptive column names to the subject and y column, and then applies the variable names from the features.txt file to the column names of the X columns.

Next the script merges the subject column, the y column, and the x columns using the column bind (cbind) command. 
 

#### Step 3: Selecting Only Variables That End in Mean or Standard Deviation (std)
The script creates an index identifying the variable names that end in mean or standard deviation (std) using the grep command. The script then creates a subset of the original data that contains the subject names, activity names, and the variables (ending in mean or std) identified with the grep command.


#### Step 4: Applying Descriptive Variable Names
The script first applies the activity labels specified in the activity_labels.txt file to the activity names column, using the join command (part of the plyr package). 

Next the script applies a series of gsub commands to replace certain characters in the variable names to make these names more descriptive and readable, according to the following rules:

 1. Replace all spaces with periods (*)
 2. Remove special characters, like "(", ")", or "-" and convert all letters to lower case (*)
 3. time replaces the prefix t
 4. frequency replaces the prefix f
 5. accelerometer. replaces acc (*)
 6. gyroscope. replaces gyro (*)
 7. magnitude. replaces mag (*)
 8. body. replaces body (*)
 9. jerk. replaces jerk (*)
 10. Insert periods in between any remaining words that are not already seperated (*)
 
 * Note: These naming conventions are according to the [Google R Style Guide.] (https://google.github.io/styleguide/Rguide.xml#attach)


#### Step 5: Create a second, independent tidy data set
The script calculates the average of each variable for each subject and activity, using the aggregate command. The result is a tidy dataset in the "wide" format, where each row represents a specific activity performed by a specific subject, with columns 3:68 containing the average of that variable for that subject and activity.

The script then writes this tidy data set to a comma seperated value file named "tidy.data.csv"


## Overview of the Variables in the Original Dataset
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The mean and standard deviation of each of these variables were used in the final dataset, according to the methods outlined in the above section: Detailed Description of Tidy Data Processing Steps.


## Description of the Variables in the tidy.data.csv File
The tidy.data.csv file contains a data frame with 180 observations on the following 68 variables.

Note: See above Overview of Variables in the Original Dataset for more info about variables 3:68.


<dl>

<dt>`subject`</dt>

<dd>

a numeric vector, ranging from 1:30, representing the 30 individual subjects that performed the tests in this experiment.

</dd>

<dt>`activity.labels`</dt>

<dd>

a factor with levels `LAYING` `SITTING` `STANDING` `WALKING` `WALKING_DOWNSTAIRS` `WALKING_UPSTAIRS`representing the activities performed by the subjects in this experiment.

</dd>

<dt>`time.body.accelerometer.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.gravity.accelerometer.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.accelerometer.jerk.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`time.body.gyroscope.jerk.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.jerk.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.jerk.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.jerk.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.jerk.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.jerk.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.jerk.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.gyroscope.mean.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.gyroscope.mean.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.gyroscope.mean.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.gyroscope.std.x`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.gyroscope.std.y`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.gyroscope.std.z`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.accelerometer.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.body.accelerometer.jerk.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.body.accelerometer.jerk.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.body.gyroscope.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.body.gyroscope.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.body.gyroscope.jerk.magnitude.mean`</dt>

<dd>

a numeric vector

</dd>

<dt>`frequency.body.body.gyroscope.jerk.magnitude.std`</dt>

<dd>

a numeric vector

</dd>

</dl>


## Sources
Original dataset obtained from:
[(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)] ((https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip))

This codebook was based on a template available from the [data science specialization site.] (https://datasciencespecialization.github.io/getclean/)

Additionally, the [thoughtfulbloke wordpress site ] (https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) was invaluable in developing the script that produced the tidy data set. 


## License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

