###################################################################################################
###################################################################################################

## You should create one R script called run_analysis.R that does the following. 

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 

## From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

###################################################################################################
###################################################################################################
library(dplyr)

## This file contains the activity names associated to the activity values seen in the y_test and y_train files
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
## This file contains the complete list of variables for the measurements in the x_test and x_train files
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

## This file contains the subject ids for the subjects that performed each activity in the test data set
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
## This file contains the activity measurements for the test data set
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
## This file contains the activity values for the test data set, use activity.labels to get names for these
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

## This file contains the subject ids for the subjects tha performed each activity in the training data set
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
## This file contains the activity measurements for the training data set
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
## This file contains the activity values for the training data set, use activity.labels to get names for these
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

## Combine the test data into one data set
test.data <- cbind(test.subject, test.y, test.x)
colnames(test.data)[1] <- "subject.id"
colnames(test.data)[2] <- "activity.value.id"

## Combine the training data into on data set
train.data <- cbind (train.subject, train.y, train.x)
colnames(train.data)[1] <- "subject.id"
colnames(train.data)[2] <- "activity.value.id"

## Combine the test and training data into a complete data set
complete.data <- rbind(test.data, train.data)
total.rows <- nrow(complete.data)

## Now add in a column with descriptive activity names for the activity value ids in column 2
complete.data <- mutate(complete.data, activity.value = rep(NA,total.rows))

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

## Now rename all of the mean and std columns that we'll be using, using the descriptive names found in "features.text"
colnames(complete.data)[1 + 2] <- "tBodyAcc.mean.X"
colnames(complete.data)[2 + 2] <- "tBodyAcc.mean.Y"
colnames(complete.data)[3 + 2] <- "tBodyAcc.mean.Z"
colnames(complete.data)[4 + 2] <- "tBodyAcc.std.X"
colnames(complete.data)[5 + 2] <- "tBodyAcc.std.Y"
colnames(complete.data)[6 + 2] <- "tBodyAcc.std.Z"
colnames(complete.data)[41 + 2] <- "tGravityAcc.mean.X"
colnames(complete.data)[42 + 2] <- "tGravityAcc.mean.Y"
colnames(complete.data)[43 + 2] <- "tGravityAcc.mean.Z"
colnames(complete.data)[44 + 2] <- "tGravityAcc.std.X"
colnames(complete.data)[45 + 2] <- "tGravityAcc.std.Y"
colnames(complete.data)[46 + 2] <- "tGravityAcc.std.Z"
colnames(complete.data)[81 + 2] <- "tBodyAccJerk.mean.X"
colnames(complete.data)[82 + 2] <- "tBodyAccJerk.mean.Y"
colnames(complete.data)[83 + 2] <- "tBodyAccJerk.mean.Z"
colnames(complete.data)[84 + 2] <- "tBodyAccJerk.std.X"
colnames(complete.data)[85 + 2] <- "tBodyAccJerk.std.Y"
colnames(complete.data)[86 + 2] <- "tBodyAccJerk.std.Z"
colnames(complete.data)[121 + 2] <- "tBodyGyro.mean.X"
colnames(complete.data)[122 + 2] <- "tBodyGyro.mean.Y"
colnames(complete.data)[123 + 2] <- "tBodyGyro.mean.Z"
colnames(complete.data)[124 + 2] <- "tBodyGyro.std.X"
colnames(complete.data)[125 + 2] <- "tBodyGyro.std.Y"
colnames(complete.data)[126 + 2] <- "tBodyGyro.std.Z"
colnames(complete.data)[161 + 2] <- "tBodyGyroJerk.mean.X"
colnames(complete.data)[162 + 2] <- "tBodyGyroJerk.mean.Y"
colnames(complete.data)[163 + 2] <- "tBodyGyroJerk.mean.Z"
colnames(complete.data)[164 + 2] <- "tBodyGyroJerk.std.X"
colnames(complete.data)[165 + 2] <- "tBodyGyroJerk.std.Y"
colnames(complete.data)[166 + 2] <- "tBodyGyroJerk.std.Z"
colnames(complete.data)[201 + 2] <- "tBodyAccMag.mean"
colnames(complete.data)[202 + 2] <- "tBodyAccMag.std"
colnames(complete.data)[214 + 2] <- "tGravityAccMag.mean"
colnames(complete.data)[215 + 2] <- "tGravityAccMag.std"
colnames(complete.data)[227 + 2] <- "tBodyAccJerkMag.mean"
colnames(complete.data)[228 + 2] <- "tBodyAccJerkMag.std"
colnames(complete.data)[240 + 2] <- "tBodyGyroMag.mean"
colnames(complete.data)[241 + 2] <- "tBodyGyroMag.std"
colnames(complete.data)[253 + 2] <- "tBodyGyroJerkMag.mean"
colnames(complete.data)[254 + 2] <- "tBodyGyroJerkMag.std"
colnames(complete.data)[266 + 2] <- "fBodyAcc.mean.X"
colnames(complete.data)[267 + 2] <- "fBodyAcc.mean.Y"
colnames(complete.data)[268 + 2] <- "fBodyAcc.mean.Z"
colnames(complete.data)[269 + 2] <- "fBodyAcc.std.X"
colnames(complete.data)[270 + 2] <- "fBodyAcc.std.Y"
colnames(complete.data)[271 + 2] <- "fBodyAcc.std.Z"
colnames(complete.data)[345 + 2] <- "fBodyAccJerk.mean.X"
colnames(complete.data)[346 + 2] <- "fBodyAccJerk.mean.Y"
colnames(complete.data)[347 + 2] <- "fBodyAccJerk.mean.Z"
colnames(complete.data)[348 + 2] <- "fBodyAccJerk.std.X"
colnames(complete.data)[349 + 2] <- "fBodyAccJerk.std.Y"
colnames(complete.data)[350 + 2] <- "fBodyAccJerk.std.Z"
colnames(complete.data)[424 + 2] <- "fBodyGyro.mean.X"
colnames(complete.data)[425 + 2] <- "fBodyGyro.mean.Y"
colnames(complete.data)[426 + 2] <- "fBodyGyro.mean.Z"
colnames(complete.data)[427 + 2] <- "fBodyGyro.std.X"
colnames(complete.data)[428 + 2] <- "fBodyGyro.std.Y"
colnames(complete.data)[429 + 2] <- "fBodyGyro.std.Z"
colnames(complete.data)[503 + 2] <- "fBodyAccMag.mean"
colnames(complete.data)[504 + 2] <- "fBodyAccMag.std"
colnames(complete.data)[516 + 2] <- "fBodyBodyAccJerkMag.mean"
colnames(complete.data)[517 + 2] <- "fBodyBodyAccJerkMag.std"
colnames(complete.data)[529 + 2] <- "fBodyBodyGyroMag.mean"
colnames(complete.data)[530 + 2] <- "fBodyBodyGyroMag.std"
colnames(complete.data)[542 + 2] <- "fBodyBodyGyroJerkMag.mean"
colnames(complete.data)[543 + 2] <- "fBodyBodyGyroJerkMag.std"

## Now create a smaller data set only containg the subject.id, activity value, and the mean and std variables
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

colnames(mean.std.data)[1] <- "subject.id"
colnames(mean.std.data)[2] <- "activity.type"

## Lastly, create a tidy data set with the average of each variable for each activity and each subject
subject.act.grouped <- group_by(mean.std.data, subject.id, activity.type)
final.tidy.data <- summarize(subject.act.grouped, 
                             AVG.tBodyAcc.mean.X = mean(tBodyAcc.mean.X, na.rm = TRUE),
                             AVG.tBodyAcc.mean.Y = mean(tBodyAcc.mean.Y, na.rm = TRUE),
                             AVG.tBodyAcc.mean.Z = mean(tBodyAcc.mean.Z, na.rm = TRUE),
                             AVG.tBodyAcc.std.X = mean(tBodyAcc.std.X, na.rm = TRUE),
                             AVG.tBodyAcc.std.Y = mean(tBodyAcc.std.Y, na.rm = TRUE),
                             AVG.tBodyAcc.std.Z = mean(tBodyAcc.std.Z, na.rm = TRUE),
                             AVG.tGravityAcc.mean.X = mean(tGravityAcc.mean.X, na.rm = TRUE),
                             AVG.tGravityAcc.mean.Y = mean(tGravityAcc.mean.Y, na.rm = TRUE),
                             AVG.tGravityAcc.mean.Z = mean(tGravityAcc.mean.Z, na.rm = TRUE),
                             AVG.tGravityAcc.std.X = mean(tGravityAcc.std.X, na.rm = TRUE),
                             AVG.tGravityAcc.std.Y = mean(tGravityAcc.std.Y, na.rm = TRUE),
                             AVG.tGravityAcc.std.Z = mean(tGravityAcc.std.Z, na.rm = TRUE),
                             AVG.tBodyAccJerk.mean.X = mean(tBodyAccJerk.mean.X, na.rm = TRUE),
                             AVG.tBodyAccJerk.mean.Y = mean(tBodyAccJerk.mean.Y, na.rm = TRUE),
                             AVG.tBodyAccJerk.mean.Z = mean(tBodyAccJerk.mean.Z, na.rm = TRUE),
                             AVG.tBodyAccJerk.std.X = mean(tBodyAccJerk.std.X, na.rm = TRUE),
                             AVG.tBodyAccJerk.std.Y = mean(tBodyAccJerk.std.Y, na.rm = TRUE),
                             AVG.tBodyAccJerk.std.Z = mean(tBodyAccJerk.std.Z, na.rm = TRUE),
                             AVG.tBodyGyro.mean.X = mean(tBodyGyro.mean.X, na.rm = TRUE),
                             AVG.tBodyGyro.mean.Y = mean(tBodyGyro.mean.Y, na.rm = TRUE),
                             AVG.tBodyGyro.mean.Z = mean(tBodyGyro.mean.Z, na.rm = TRUE),
                             AVG.tBodyGyro.std.X = mean(tBodyGyro.std.X, na.rm = TRUE),
                             AVG.tBodyGyro.std.Y = mean(tBodyGyro.std.Y, na.rm = TRUE),
                             AVG.tBodyGyro.std.Z = mean(tBodyGyro.std.Z, na.rm = TRUE),
                             AVG.tBodyGyroJerk.mean.X = mean(tBodyGyroJerk.mean.X, na.rm = TRUE),
                             AVG.tBodyGyroJerk.mean.Y = mean(tBodyGyroJerk.mean.Y, na.rm = TRUE),
                             AVG.tBodyGyroJerk.mean.Z = mean(tBodyGyroJerk.mean.Z, na.rm = TRUE),
                             AVG.tBodyGyroJerk.std.X = mean(tBodyGyroJerk.std.X, na.rm = TRUE),
                             AVG.tBodyGyroJerk.std.Y = mean(tBodyGyroJerk.std.Y, na.rm = TRUE),
                             AVG.tBodyGyroJerk.std.Z = mean(tBodyGyroJerk.std.Z, na.rm = TRUE),
                             AVG.tBodyAccMag.mean = mean(tBodyAccMag.mean, na.rm = TRUE),
                             AVG.tBodyAccMag.std = mean(tBodyAccMag.std, na.rm = TRUE),
                             AVG.tGravityAccMag.mean = mean(tGravityAccMag.mean, na.rm = TRUE),
                             AVG.tGravityAccMag.std = mean(tGravityAccMag.std, na.rm = TRUE),
                             AVG.tBodyAccJerkMag.mean = mean(tBodyAccJerkMag.mean, na.rm = TRUE),
                             AVG.tBodyAccJerkMag.std = mean(tBodyAccJerkMag.std, na.rm = TRUE),
                             AVG.tBodyGyroMag.mean = mean(tBodyGyroMag.mean, na.rm = TRUE),
                             AVG.tBodyGyroMag.std = mean(tBodyGyroMag.std, na.rm = TRUE),
                             AVG.tBodyGyroJerkMag.mean = mean(tBodyGyroJerkMag.mean, na.rm = TRUE),
                             AVG.tBodyGyroJerkMag.std = mean(tBodyGyroJerkMag.std, na.rm = TRUE),
                             AVG.fBodyAcc.mean.X = mean(fBodyAcc.mean.X, na.rm = TRUE),
                             AVG.fBodyAcc.mean.Y = mean(fBodyAcc.mean.Y, na.rm = TRUE),
                             AVG.fBodyAcc.mean.Z = mean(fBodyAcc.mean.Z, na.rm = TRUE),
                             AVG.fBodyAcc.std.X = mean(fBodyAcc.std.X, na.rm = TRUE),
                             AVG.fBodyAcc.std.Y = mean(fBodyAcc.std.Y, na.rm = TRUE),
                             AVG.fBodyAcc.std.Z = mean(fBodyAcc.std.Z, na.rm = TRUE),
                             AVG.fBodyAccJerk.mean.X = mean(fBodyAccJerk.mean.X, na.rm = TRUE),
                             AVG.fBodyAccJerk.mean.Y = mean(fBodyAccJerk.mean.Y, na.rm = TRUE),
                             AVG.fBodyAccJerk.mean.Z = mean(fBodyAccJerk.mean.Z, na.rm = TRUE),
                             AVG.fBodyAccJerk.std.X = mean(fBodyAccJerk.std.X, na.rm = TRUE),
                             AVG.fBodyAccJerk.std.Y = mean(fBodyAccJerk.std.Y, na.rm = TRUE),
                             AVG.fBodyAccJerk.std.Z = mean(fBodyAccJerk.std.Z, na.rm = TRUE),
                             AVG.fBodyGyro.mean.X = mean(fBodyGyro.mean.X, na.rm = TRUE),
                             AVG.fBodyGyro.mean.Y = mean(fBodyGyro.mean.Y, na.rm = TRUE),
                             AVG.fBodyGyro.mean.Z = mean(fBodyGyro.mean.Z, na.rm = TRUE),
                             AVG.fBodyGyro.std.X = mean(fBodyGyro.std.X, na.rm = TRUE),
                             AVG.fBodyGyro.std.Y = mean(fBodyGyro.std.Y, na.rm = TRUE),
                             AVG.fBodyGyro.std.Z = mean(fBodyGyro.std.Z, na.rm = TRUE),
                             AVG.fBodyAccMag.mean = mean(fBodyAccMag.mean, na.rm = TRUE),
                             AVG.fBodyAccMag.std = mean(fBodyAccMag.std, na.rm = TRUE),
                             AVG.fBodyBodyAccJerkMag.mean = mean(fBodyBodyAccJerkMag.mean, na.rm = TRUE),
                             AVG.fBodyBodyAccJerkMag.std = mean(fBodyBodyAccJerkMag.std, na.rm = TRUE),
                             AVG.fBodyBodyGyroMag.mean = mean(fBodyBodyGyroMag.mean, na.rm = TRUE),
                             AVG.fBodyBodyGyroMag.std = mean(fBodyBodyGyroMag.std, na.rm = TRUE),
                             AVG.fBodyBodyGyroJerkMag.mean = mean(fBodyBodyGyroJerkMag.mean, na.rm = TRUE),
                             AVG.fBodyBodyGyroJerkMag.std = mean(fBodyBodyGyroJerkMag.std, na.rm = TRUE))

final.tidy.data <- as.data.frame(final.tidy.data)

## Finally, export the data to a text file
write.table(final.tidy.data, file = "FinalTidyData.txt", row.name = FALSE, sep = " ")
