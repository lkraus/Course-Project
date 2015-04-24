#**README**

The purpose of this analysis is to use the smartphone dataset "Human Activity Recognition Using Smartphones Dataset, Version 1.0" by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto, take the mean and standard deviation estimates of accelerometer and gyroscope sensor signals they collected and create a tidy data set by combining the test and training data sets.  Then, another tidy set is created that gives the average of each variable for each activity and each subject.

##The Data

This analysis uses the "Human Activity Recognition Using Smartphones Dataset, Version 1.0" data set by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.  Their experiment involved a group of 30 volunteers within the ages of 19 and 48.  Each person performed six different activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) waeing a Samsung Galaxy S II smartphone on their waist.  They then captured 3-axial linear acceleration and 3-axial angular velocity at a contant rate of 50Hz using the phone's embedded accelerometer and gyroscope.

They pre-processed the accelerometer and gyroscope sensor signals by applying noise filters and then sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap.  The sensor acceleration signal was separated into gravitational and body motion components using a Butterworth low-pass filter.  They assumed the gravitational force had only low frequency components, and therefore used a filter with a 0.3 Hz cuttoff frequency.  From each fixed-width sliding window they obtained a vector of features calculating variables form the time and frequency domain.  We will be using the mean and standard deviation estimates of the signals they recorded.  As a last step, they randomly partitioned their dataset into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Once we have merged the test and training data sets and limited our data set to only the mean and standard deviation estimates, our final tidy data set will be created.  This data set will give the average of each variable for each activity and subject.  See 'CodeBook.md' for details on the variables found in the this final tidy data set.


##Finding and Downloading the Data

The data for this analysis can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

After downloading the file, unzip it and store the folder (called "UCI HAR Dataset") in your working directory.  This folder contains many different files and folders, the files that we will be using are:

- 'activity_labels.txt': Links the class labels with their activity name.
- 'features.txt': List of all features.

- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

##Analysis

The analysis performed can be found in the flie 'run_analysis.R'.  This analysis follows five steps, starting by reading in the downloaded data, and ending with the creation of a final tidy data set.

**1) Merging the Data:**

First, the eight .txt files listed above are read into R using `read.table(header = FALSE`).  Before running this analysis make sure that the downloaded folder ("UCI HAR Dataset") is in your working directory.  The code is constructed so that it can get all of the necessary files from the folders within "UCI HAR Dataset", you do not need to put the individual .txt files into your working directory.  As an example, here is how the test data set is read into R:

```{r}
## This file contains the subject ids for the subjects that performed each activity in the test data set
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
## This file contains the activity measurements for the test data set
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
## This file contains the activity values for the test data set, use activity.labels to get names for these
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
```

After reading the files into R, the next step is to combine the X, Y, and subject files to create single test and training datasets.  This is done useing `cbind()`.  After merging the X, Y, and subject data, `colnames()[]` is used to name the subject ID and activity value ID columns from the subject and Y data.  The test data will by 2,947 rows by 563 columns, and the training data will be 7,352 rows by 563 columns.  As an example, here is how the complete test data set is created:


```{r}
## Combine the test data into one data set
test.data <- cbind(test.subject, test.y, test.x)
colnames(test.data)[1] <- "subject.id"
colnames(test.data)[2] <- "activity.value.id"
```

Finally, the test and training data sets are merged to create a complete data set using `rbind()`.  The resulting complete data set will be 10,299 rows by 563 columns.  This data set is created with the following code:

```{r}
## Combine the test and training data into a complete data set
complete.data <- rbind(test.data, train.data)
```

**2) Use Descriptive Activity Names to Name Activities in the Data Set**

Next, we will add a column to the data set that contains descriptives of the activities represented by the "activity.value.id" column.  The activity descriptions for each activity value ID can be found in the "activity_labels.txt" file.  First, the `mutate()` function from the *dplyr* package is used to add a column of null values to the complete data set.  This column is called "activity.value".  Next, a for loop is used to insert the correct activity desxriptives into this column using the following code:

```{r}
for(i in 1:total.rows){
        if(complete.data[i,2] == 1){
              complete.data[i,564] <- "WALKING"
        } else if (complete.data[i,2] == 2){
              complete.data[i,564] <- "WALKING_UPSTAIRS"
        } else if (complete.data[i,2] == 3){
              complete.data[i,564] <- "WALKING_DOWNSTAIRS"
        } else if (complete.data[i,2] == 4){
              complete.data[i,564] <- "SITTING"
        } else if (complete.data[i,2] == 5){
              complete.data[i,564] <- "STANDING"
        } else {
              complete.data[i,564] <- "LAYING"
        }
}
```

**3) Label with Data Set with Descriptive Variable Names**

Next, descriptive variable names are given to the columns for the measurements on the  mean and standard deviation for each measurement.  We only give descriptive column names to these columns because they are the only ones we will be using to create our final tidy data set.  The descriptive names come from the "features.txt" files from the downloaded folder.  Very small changes were made to the column names to make them more R friendly.  For example, "tBodyAcc-mean()-X" was changed to "tBodyAcc.mean.X".  As an example, here is how a few of the columns were renamed:

```{r}
colnames(complete.data)[1 + 2] <- "tBodyAcc.mean.X"
colnames(complete.data)[2 + 2] <- "tBodyAcc.mean.Y"
colnames(complete.data)[3 + 2] <- "tBodyAcc.mean.Z"
```

**4) Extract Measurements on the Mean and Standard Deviation for each Measurement**

Next a smaller data set is created by extracting only the measurements on the mean and standard deviation for each measurement.  The resulting smaller data set will be 10,2999 rows by 68 columns.  This data set is created using `cbind()` as follows:

```{r}
mean.std.data <- cbind(complete.data[,1], complete.data[,564],
                       complete.data[,(1+2):(6+2)],complete.data[,(41+2):(46+2)],complete.data[,(81+2):(86+2)],
                       complete.data[,(121+2):(126+2)],
                       complete.data[,(161+2):(166+2)],complete.data[,(201+2):(202+2)],
                       complete.data[,(214+2):(215+2)],complete.data[,(227+2):(228+2)],
                       complete.data[,(240+2):(241+2)],complete.data[,(253+2):(254+2)],
                       complete.data[,(266+2):(271+2)],complete.data[,(345+2):(350+2)],
                       complete.data[,(424+2):(429+2)],complete.data[,(503+2):(504+2)],
                       complete.data[,(516+2):(517+2)],complete.data[,(529+2):(530+2)],
                       complete.data[,(542+2):(543+2)])
```

**5) Create Final Tidy Data Set**

The last step is to create a final, independent tidy data set that gives the average of each variable for each activity and each subject.  To do this `group_by` and `summarize` from the *dplyr* package are used.  This step creates a tidy data set, following the basic rules for tidy data:


    1. All columns have descriptive headings
    2. Each measured variable is in a separate column
    3. Each different observation of a variable is in a different row

This final tidy data set will by 180 rows by 68 columns, and is created using the following code:

```{r}
## Lastly, create a tidy data set with the average of each variable for each activity and each subject
subject.act.grouped <- group_by(mean.std.data, subject.id, activity.type)
final.tidy.data <- summarize(subject.act.grouped, 
                             AVG.tBodyAcc.mean.X = mean(tBodyAcc.mean.X, na.rm = TRUE),
                             AVG.tBodyAcc.mean.Y = mean(tBodyAcc.mean.Y, na.rm = TRUE),
                             AVG.tBodyAcc.mean.Z = mean(tBodyAcc.mean.Z, na.rm = TRUE),
                             AVG.tBodyAcc.std.X = mean(tBodyAcc.std.X, na.rm = TRUE),
                             AVG.tBodyAcc.std.Y = mean(tBodyAcc.std.Y, na.rm = TRUE),
                             .
                             .
                             .
                             AVG.fBodyBodyGyroJerkMag.mean = mean(fBodyBodyGyroJerkMag.mean, na.rm = TRUE),
                             AVG.fBodyBodyGyroJerkMag.std = mean(fBodyBodyGyroJerkMag.std, na.rm = TRUE))
```

Finally, a text file containing the final tidy data set is created using `write.table()`:

```{r}
## Finally, export the data to a text file
write.table(final.tidy.data, file = "FinalTidyData.txt", row.name = FALSE, sep = " ")
```

To read this text file back into R, use `read.table(header = TRUE)`
