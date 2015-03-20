### run_analysis.R 
### Coursera Data Science - Getting and Cleaning Data 
### Course Project 

## Instruction for the project:-
## Data source:- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##  You should create one R script called run_analysis.R that does the following. 
##  Merges the training and the test sets to create one data set.
##  Extracts only the measurements on the mean and standard deviation for each measurement. 
##  Uses descriptive activity names to name the activities in the data set
##  Appropriately labels the data set with descriptive variable names. 
##  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## ==================================================================  


##set working directory. e.g. I set "c:/temp1" as my working dir where data will be downloaded
	setwd("C:/temp1")

##Create  object pointing to the url link of the data.   e.g url1
	url1<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 
# download file into the working directory   in this case "C:/temp1"
	download.file(url1,destfile="Dataset.zip")

## unzip downloaded file into the working directory
	unzip("Dataset.zip")
 
## Read the README file in "/UCI HAR Dataset/" to gain some understanding of the data set

##Load the HAR feature data into table
	d_Xtest<- read.table("C:/temp1/UCI HAR Dataset/test/X_test.txt")
	d_Xtrain<- read.table("C:/temp1/UCI HAR Dataset/train/X_train.txt")

##Load the HAR activity data into table
	d_ytest<- read.table("C:/temp1/UCI HAR Dataset/train/y_test.txt")
	d_ytrain<- read.table("C:/temp1/UCI HAR Dataset/train/y_train.txt")

##Load the HAR subject data into table
	subject_test<- read.table("C:/temp1/UCI HAR Dataset/test/subject_test.txt")
	subject_train<- read.table("C:/temp1/UCI HAR Dataset/train/subject_train.txt")

##Load the HAR feature labels into table
	featuresLabels <- read.table("C:/temp1/UCI HAR Dataset/features.txt")

##Load the HAR activity labels into table
	ActivtyLabels <- read.table("C:/temp1/UCI HAR Dataset/"activity_labels.txt")


## row combined test and train feature data 
## assign column names to the data into a new
	X_features<- rbind(d_Xtest, d_Xtrain)
		colnames(X_features) <- as.character(featuresLabels[,2])

## row combined test and train subject 
## assign column names to the data into a new
	subject <- rbind(subject_test, subject_train)
	    colnames(subject)<- as.character("Subject")

## row combined test and train activity set 
## replace the activity list with a a more descriptive names
## assign column names to the activity data 
   y_activity<- rbind(d_ytest, d_ytrain)
	for (i in 1:6) { 
	  y_activity$V1[y_activity$V1 == i] <- as.character(ActivtyLabels[i,2])  
		     }
		   colnames(y_activity)<- as.character("Activity")


## combine all data X_features, subject and y_activity into one big table
	data_f1<- cbind(subject, y_activity)
      data_f1<- cbind(X_features, data_f1)


## extract the feature labels containing mean and standard deviation
	f_subs<- featuresLabels$V2[grep1("mean\\(\\)|Mean\\(\\)|std\\(\\)", featuresLabels$V2)]

## add the Subject and Activity labels to the list in f_subs
sel_Names<- as.character(f_subs,"Subject", "Activity" )

## subset the combined data to extract only column names containing "mean", "Mean", "std", "Activity" and "Subject"
	data_f2<- subset(data_f1, select=sel_Names)

## replace the acronyms with a descriptive names
	names(data_f2)<-gsub("Acc", "Accelerometer", names(data_f2))
	    names(data_f2)<-gsub("Gyro", "Gyroscope", names(data_f2))
	      names(data_f2)<-gsub("Mag", "Magnitude", names(data_f2))
	           names(data_f2)<-gsub("^f", "frequency", names(data_f2))
	              names(data_f2)<-gsub("^t", "time", names(ddata_f2))

## load reshape2 and plyr library to be able to apply melt and aggregate functions respectively
## New data is formed by aggregating all the occurence of each specific activity-subject pair and computing the mean
	library("reshape2")
        library("plyr")
		data_final<- melt(data_f2, id.vars = c("Subject", "Activity"))
	 	    data_final<- aggregate(. ~Subject + Activity, data_final, mean)

##write new data created to file in the working directory and name it tidy.txt
	write.table(data_final, "tidy.txt", row.name=FALSE)
