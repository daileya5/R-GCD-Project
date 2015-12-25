| tidy.data | Codebook | 2015/12/25 |


## Project Description
This "tidy" dataset was created from the [Human Activity Recognition Using Smartphone Data Set.]
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) The description of the study design and data processing, collection of the raw data, notes on the original data, and descriptions of the variables are taken directly from the README.txt and features_info.txt files included with the original dataset. 


##Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

###Collection of the raw data
Using the embedded accelerometer and gyroscope in the Samsung Galaxy S II, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###Raw data processing
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Each record includes:
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
 - Its activity label. 
 - An identifier of the subject who carried out the experiment.

###Notes on the original (raw) data 
 - Features are normalized and bounded within [-1,1].
 - Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


##Creating the tidy datafile

###Cleaning the data
This tidy dataset is the end result of a script that merged an existing dataset into one table, selected only variables that are means or standard deviations of measurements, added descriptive variable names and activity names, and finally, created a separate data set that has aggregated each variable by test subject and activity name.  [See the readme document,] (https://github.com/daileya5/R-GCD-Project/blob/master/README.md) which describes the code in the cleaning script in greater detail

###Steps in creating the tidy data file
This script will create a tidy dataset by: 
 1. downloading the original dataset from this url: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 2. merging the training and test sets into one data set, 
 3. extracting the mean and standard deviation for each measurement, 
 4. applying descriptive names to each variable and activity, and, finally,
 5. create a second, independent tidy data set with the average of each variable for each activity and each subject.


##Description of the variables in the tiny.data.txt file
General description of the file including:
 - A data frame with 180 observations on the following 68 variables.
 - Summary of the data
 - Variables present in the dataset



<dl>

<dt>`subject`</dt>

<dd>

a numeric vector

</dd>

<dt>`activity.labels`</dt>

<dd>

a factor with levels `LAYING` `SITTING` `STANDING` `WALKING` `WALKING_DOWNSTAIRS` `WALKING_UPSTAIRS`

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

##Sources
This codebook was based on a template available from the [data science specialization site.] (https://datasciencespecialization.github.io/getclean/)

Additionally, the [thoughtfulbloke wordpress site ] (https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) was invaluable in developing the script that produced the tidy data set. 

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)


##License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


### Examples

<pre>data(tidydata)
## maybe str(tidydata) ; plot(tidydata) ...
</pre>
