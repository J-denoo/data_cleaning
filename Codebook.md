Codebook for Getting and Cleaning Data obtain from HAR data set into tidy data

This codebook describes the variables, data and the transformation perform to on the data acquired from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The original data was collected from the accelerometers study from the Samsung Galaxy S smartphone. 
A full description of the original data is available at the site "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

This code book also includes:
Summary choices: Information about the summary choices
Study Design: Information about the experimental study design

===============================================
a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

==================================================

The dataset is an extract of the mean and standard deviation data and variables from the HAR study. 
The names and descriptions of each feature and variables were obtain from the original HAR files "README.txt", "features.txt", "activity_labels.txt", and "feature_info.txt"

Base
The HAR test and train features data set were selected, combined.

The combined features data was properly labeled with the corresponding name from the feaures.txt file.
The test and train activity list were combined and updated with a more descriptive names from the activity_labels.txt
The subject data was then combined with the combined activity and features data set to form one big data

The combined data was the subsetted to extract data prescribed by the assignment..
Subsetting criteria is to select only features containing "mean", "Mean" and "std" in their column names.

The data was then updated with a more descriptive names by replacing 
"t", "f","Acc", "Gyro", and "Mag" with their full names "time", "frequency", "Accelerometer",  "Gyroscope", and "Magnitude" respectively. 

The new data formed from the subsetting and renaming with the descriptive names was then 
reshape by combining all the instances of each activity for each subject and computing the mean
value of all the instances of each activity/subject pair.


This is a selection of variables from the HAR data, which are described in detail in the file features_info.txt in the data set. See the quote below from the HAR "features_info.txt" 

Summary Choices
The course instruction for the summary choices of the new data is:-
Create tidy dataset based on the HAR data.   
New tidy data set is form from the averaging each variable activity, and subject.
The resulting new tidy data formed from the HAR data by averaging all obvervations for each
subject-activity pair, resulting in a total of 180 observations (30 subjects each having 6 activities each).

Study Design
The study design for was dictated by the requirement of the course project: 
  - obtain data HAR project
  - clean data
  - aggregates data
  - extract mean and std from original data


Quoting from that "features_info.txt" file in the HAR data set:

beginning of quote "
Feature Selection 
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
 " end of quote 

==========
The original  study design HAR project is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

