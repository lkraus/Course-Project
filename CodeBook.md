#**Code Book**

**Raw Data**

This analysis uses the "Human Activity Recognition Using Smartphones Dataset, Version 1.0" data set by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.  Their experiment involved a group of 30 volunteers within the ages of 19 and 48.  Each person performed six different activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) waeing a Samsung Galaxy S II smartphone on their waist.  They then captured 3-axial linear acceleration and 3-axial angular velocity at a contant rate of 50Hz using the phone's embedded accelerometer and gyroscope.

They pre-processed the accelerometer and gyroscope sensor signals by applying noise filters and then sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap.  The sensor acceleration signal was separated into gravitational and body motion components using a Butterworth low-pass filter.  They assumed the gravitational force had only low frequency components, and therefore used a filter with a 0.3 Hz cuttoff frequency.  From each fixed-width sliding window they obtained a vector of features calculating variables form the time and frequency domain.  We will be using the mean and standard deviation estimates of the signals they recorded.  As a last step, they randomly partitioned their dataset into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

This data can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

See "features_info.txt" for an extensive explanation of how they collected and measured their data, and for descriptions of their variables.

This analysis takes the raw test and training data sets from the "UCI HAR Dataset" folder above and creates a new data set that merges the test and training data sets.  Once the test and training sets are merged, smaller data set is created by extracting only the measurements on the mean and standard deviation for each measurement.  The final tiday set was created that gives the average of each variable for each activity and each subject.  Therefore for each of the 30 subjects there are 6 rows, one for each of the 6 different activity values, and each measurement column gives the average measurement for that subject and activity value.  The code book for this final tidy data set is below.

**Code Book**

Variable Name | Description
--------------|------------
subject.id		|	ID of the subject who performed the activity. Its range is from 1 to 30
activity.value		|	Type of activity performed.  Its values are: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
AVG.tBodyAcc.mean.X	|	Average of mean of body acceleration time domain signal in the X direction
AVG.tBodyAcc.mean.Y	|	Average of mean of body acceleration time domain  signal in the Y direction
AVG.tBodyAcc.mean.Z	|	Average of mean of body acceleration time domain signal in the Z direction
AVG.tBodyAcc.std.X	|	Average of standard deviation of body acceleration time domain signal in the X direction
AVG.tBodyAcc.std.Y	|	Average of standard deviation of body acceleration time domain signal in the Y direction
AVG.tBodyAcc.std.Z	|	Average of standard deviation of body acceleration time domain signal in the Z direction
AVG.tGravityAcc.mean.X	|	Average of mean of gravity acceleration time domain signal in the X direction
AVG.tGravityAcc.mean.Y	|	Average of mean of gravity acceleration time domain signal in the Y direction
AVG.tGravityAcc.mean.Z	|	Average of mean of gravity acceleration time domain signal in the Z direction
AVG.tGravityAcc.std.X	|	Average of standard deviation of gravity acceleration time domain signal in the X direction
AVG.tGravityAcc.std.Y	|	Average of standard deviation of gravity acceleration time domain signal in the Y direction
AVG.tGravityAcc.std.Z	|	Average of standard deviation of gravity acceleration time domain signal in the Z direction
AVG.tBodyAccJerk.mean.X	|	Average of mean of body linear acceleration Jerk time domain signal in the X direction
AVG.tBodyAccJerk.mean.Y	|	Average of mean of body linear acceleration Jerk time domain signal in the Y direction
AVG.tBodyAccJerk.mean.Z	|	Average of mean of body linear acceleration Jerk time domain signal in the Y direction
AVG.tBodyAccJerk.std.X	|	Average of standard deviation of body linear acceleration Jerk time domain signal in the X direction
AVG.tBodyAccJerk.std.Y	|	Average of standard deviation of body linear acceleration Jerk time domain signal in the Y direction
AVG.tBodyAccJerk.std.Z	|	Average of standard deviation of body linear acceleration Jerk time domain signal in the Y direction
AVG.tBodyGyro.mean.X	|	Average of mean of raw body gyroscope time domain signal in the X direction
AVG.tBodyGyro.mean.Y	|	Average of mean of raw body gyroscope time domain signal in the Y direction
AVG.tBodyGyro.mean.Z	|	Average of mean of raw body gyroscope time domain signal in the Z direction
AVG.tBodyGyro.std.X	|	Average of standard deviation of raw body gyroscope time domain signal in the X direction
AVG.tBodyGyro.std.Y	|	Average of standard deviation of raw body gyroscope time domain signal in the Y direction
AVG.tBodyGyro.std.Z	|	Average of standard deviation of raw body gyroscope time domain signal in the Z direction
AVG.tBodyGyroJerk.mean.X |	Average of mean of body angular velocity Jerk time domain signal in the X direction
AVG.tBodyGyroJerk.mean.Y |	Average of mean of body angular velocity Jerk time domain signal in the Y direction
AVG.tBodyGyroJerk.mean.Z |	Average of mean of body angular velocity Jerk time domain signal in the Z direction
AVG.tBodyGyroJerk.std.X	|	Average of standard deviation of body angular velocity Jerk time domain signal in the X direction
AVG.tBodyGyroJerk.std.Y	|	Average of standard deviation of body angular velocity Jerk time domain signal in the Y direction
AVG.tBodyGyroJerk.std.Z	|	Average of standard deviation of body angular velocity Jerk time domain signal in the Z direction
AVG.tBodyAccMag.mean	|	Average of mean of the magnitude of body acceleration time domain signal
AVG.tBodyAccMag.std	|	Average of standard deviation of the magnitude of body acceleration time domain signal
AVG.tGravityAccMag.mean	|	Average of mean of the magnitude of gravity acceleration time domain signal
AVG.tGravityAccMag.std	|	Average of standard deviation of the magnitude of gravity acceleration time domain signal
AVG.tBodyAccJerkMag.mean	| Average of mean of the magnitude of the body linear acceleration Jerk time domain signal
AVG.tBodyAccJerkMag.std	|	Average of standard deviation of the magnitude of the body linear acceleration Jerk time domain signal
AVG.tBodyGyroMag.mean	|	Average of mean of the magnitude of the raw body gyroscope time domain signal
AVG.tBodyGyroMag.std	|	Average of standard deviation of the magnitude of the raw body gyroscope time domain signal
AVG.tBodyGyroJerkMag.mean |	Average of mean of the magnitude of the body angular velocity Jerk time domain signal
AVG.tBodyGyroJerkMag.std	| Average of standard deviation of the magnitude of the body angular velocity Jerk time domain signal
AVG.fBodyAcc.mean.X	|	Average of mean of body acceleration Fast Fourier Transform signal in the X direction
AVG.fBodyAcc.mean.Y	|	Average of mean of body acceleration Fast Fourier Transform  signal in the Y direction
AVG.fBodyAcc.mean.Z	|	Average of mean of body acceleration Fast Fourier Transform signal in the Z direction
AVG.fBodyAcc.std.X	|	Average of standard deviation of body acceleration Fast Fourier Transform signal in the X direction
AVG.fBodyAcc.std.Y	|	Average of standard deviation of body acceleration Fast Fourier Transform signal in the Y direction
AVG.fBodyAcc.std.Z	|	Average of standard deviation of body acceleration Fast Fourier Transform signal in the Z direction
AVG.fBodyAccJerk.mean.X	|	Average of mean of body linear acceleration Jerk Fast Fourier Transform signal in the X direction
AVG.fBodyAccJerk.mean.Y	|	Average of mean of body linear acceleration Jerk Fast Fourier Transform signal in the Y direction
AVG.fBodyAccJerk.mean.Z	|	Average of mean of body linear acceleration Jerk Fast Fourier Transform signal in the Y direction
AVG.fBodyAccJerk.std.X	|	Average of standard deviation of body linear acceleration Jerk Fast Fourier Transform signal in the X direction
AVG.fBodyAccJerk.std.Y	|	Average of standard deviation of body linear acceleration Jerk Fast Fourier Transformsignal in the Y direction
AVG.fBodyAccJerk.std.Z	|	Average of standard deviation of body linear acceleration Jerk Fast Fourier Transform signal in the Y direction
AVG.fBodyGyro.mean.X	|	Average of mean of raw body gyroscope Fast Fourier Transform signal in the X direction
AVG.fBodyGyro.mean.Y	|	Average of mean of raw body gyroscope Fast Fourier Transform signal in the Y direction
AVG.fBodyGyro.mean.Z	|	Average of mean of raw body gyroscope Fast Fourier Transform signal in the Z direction
AVG.fBodyGyro.std.X	|	Average of standard deviation of raw body gyroscope Fast Fourier Transform signal in the X direction
AVG.fBodyGyro.std.Y	|	Average of standard deviation of raw body gyroscope Fast Fourier Transform signal in the Y direction
AVG.fBodyGyro.std.Z	|	Average of standard deviation of raw body gyroscope Fast Fourier Transform signal in the Z direction
AVG.fBodyAccMag.mean	|	Average of mean of the magnitude of body acceleration Fast Fourier Transform signal
AVG.fBodyAccMag.std	|	Average of standard deviation of the magnitude of body acceleration Fast Fourier Transform signal
AVG.fBodyBodyAccJerkMag.mean	| Average of mean of the magnitude of the body linear acceleration Jerk  Fast Fourier Transform signal
AVG.fBodyBodyAccJerkMag.std	 | Average of standard deviation of the magnitude of the body linear acceleration Jerk  Fast Fourier Transform signal
AVG.fBodyBodyGyroMag.mean	| Average of mean of the magnitude of the raw body gyroscope Fast Fourier Transform signal
AVG.fBodyBodyGyroMag.std	| Average of standard deviation of the magnitude of the raw body gyroscope Fast Fourier Transform signal
AVG.fBodyBodyGyroJerkMag.mean	| Average of mean of the magnitude of the body angular velocity Jerk Fast Fourier Transform signal
AVG.fBodyBodyGyroJerkMag.std	| Average of standard deviation of the magnitude of the body angular velocity Jerk Fast Fourier Transform signal

