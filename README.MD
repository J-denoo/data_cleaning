
Course Project for "Getting and Cleaning Data"
offered online by John Hopkins Bloomberg School of Public Health
through Coursera
==================================================================
Original data was obtained as part of a project by
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
HAR project dataset description is at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The raw data is at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

===============================================================
This Readme file is for the tidy data created as an exercise in cleaning the 
raw data from Human Activity Recognition Using Smartphones Dataset Version 1.0.

Assignment objective:
i.   Create one R script called run_analysis.R that does the following. 
ii.  Merges the training and the test sets to create one data set.
iii. Extracts only the measurements on the mean and standard deviation for each measurement. 
iv.  Uses descriptive activity names to name the activities in the data set
v.   Appropriately labels the data set with descriptive variable names. 
vi.  From the data set in step 4, creates a second, independent tidy data set with the average of      each variable for each activity and each subject.
 
Submission for the course project includes:
README.md : This file
The Codebook contains a description of each of the variables, summary choices and the experimental study design.
run_analysis.R :- the r script detailing  codes written to obtain and clean the data, generate a tidy data base on the assignment objectives and to write the tidy data to file.

Readme for the data cleaning and tidy data creation
==================================================
Change the preferred directory where you want to download and store you work related to the project
using the setwd() command.

Create  object pointing to the url1 link of the data
example:- url1<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Download the data set files into the working directory using download.file()
Unzip downloaded file into the working directory using unzip()

Load all the individual tables in the HAR folder and subfolders using read.table()
the tables include: 
~/UCI HAR Dataset/test/X_test.txt
~/UCI HAR Dataset/train/X_train.txt
~/UCI HAR Dataset/test/y_test.txt
~/UCI HAR Dataset/train/y_train.txt
~/UCI HAR Dataset/test/subject_test.txt
~/UCI HAR Dataset/train/subject_train.txt
~UCI HAR Dataset/features.txt
~/UCI HAR Dataset/activity_labels.txt

Row combined test and train feature data read from X_test.txt and X_train.txt using rbind() and 
assign the appropriate column from the features.txt file for the combined data.

Row combined test and train subjects data read from subject_test.txt and subject_train.txt using rbind()
and label the column name as "Subject".

Perform similar operation on the activity data in y_test.txt and y_train.txt by using rbind() and
and replace the activity list with a more descriptive names in the table read from activity_labels.txt 
label column name of the activity list as "Activity".

Column combine the 3 resulting tables from above i.e. features, subject, and activity into one big table
using cbind() command.

Extract the all the names containing any one of the following words, (mean, Mean, std) in the features.txt
data read and concatenate with "Subject", and "Activity".

Subset the combined data obtained by combining the features, subject and activity data using the criteria
(column names containing "mean", "Mean", "std", "Activity" and "Subject") with the subset()

Replace the acronyms with a descriptive names "Accelerometer" for "Acc",  "Gyroscope" for "Gyro",
 "Magnitude" for "Mag", "frequency" for "f", and "time" for "t".

Reshape the data by combining all the instances of each activity for each subject and computing the mean
using melt() and aggregate() commands. Remember to load the appropriate libraries to execute this commands
namely library("reshape2") and library("plyr")
 
Save the resulting data to file as txt file using write.table() command.

Executable file run_analysis.R  is known to work well on  R 3.1.2 (codename "Pumpkin Helmet") on windows 7 platform.


Acknowlegdement
================
I acknowledge the source of this dataset as the publications  referenced below: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
