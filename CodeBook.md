---
title: "Getting and Cleaning Data Course Project"
output: word_document
---

## R Markdown CodeBook Description

CodeBook for Getting and Cleaning Data Project. This Codebook describes the variables, the data and any work performed to cleanup the data.

## Source Information
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:
For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body
* acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

The R script run_analysis.R does the following. 
1.	On Windows machine, downloads the zip file in a project working directory:  courseprojecttidydata/getdatafiles.zip
2.	Unzips the zip file to UCI HAR Dataset. 
3.	Reads the data files (features.txt, activity_labels.txt, subject_train.txt, X_train.txt, y_train.txt) 
4.	Add columns names to each of these files.
5.	Using cbind merges the files subject_train.txt, X_train.txt, y_train.txt.
6.	Reads the data files (subject_test.txt, X_test.txt, y_test.txt) 
7.	Add columns names to each of these files.
8.	Using cbind merges the files subject_test.txt, X_test.txt, y_test.txt).
9.	Using rbind merges the training and the test data sets to create one master data set.
10.	Using grepl extracts only the measurements on the mean and standard deviation for each measurement.
11.	Merges to uses descriptive activity names to name the activities in the data set via data read from activity_labels.txt.
12.	Using gsub appropriately labels the data set with descriptive variable names. Remove unwanted characters/strings from the variable names and provide more readable names.
13.	From the data set in above step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
14.	Writes the final tidy data to a file - Coursefinaltidydata.txt in two directories above the current data set directory.
It also prints messages to show the progress made during the script execution.
* "Creating directory courseprojecttidydata.."
* "Setting current working directory courseprojecttidydata.."
* "Downloading the zip file.."
* "Unzipping the zip file.."
* "Setting the working directory where source files reside.."
* "Reading the features, activity and train data files.."
* "Merging the train data files.."
* "Reading the test data files.."
* "Merging the test data files.."
* "Merging the test and train data files.."
* "Extracting the mean and standard deviation for each measurement.."
* "Merging the activity names to name the activities"
* "Labelling the data set with descriptive variable names"
* "Creating a clean tidy data set with average for each variable for each activity and each subject"
* "writing the tidy data to Coursefinaltidydata.txt in one directory above the data set directory"

## Final set of columns as below:
	activityid  
	activityname 
	subjectid                                          
	timeBodyAccelerationMeanValueX
	timeBodyAccelerationMeanValueY                     
	timeBodyAccelerationMeanValueZ
	timeBodyAccelerationStndDevX 
	timeBodyAccelerationStndDevY
	timeBodyAccelerationStndDevZ                       
	timeGravityAccelerationMeanValueX
	timeGravityAccelerationMeanValueY 
	timeGravityAccelerationMeanValueZ	
	timeGravityAccelerationStndDevX
	timeGravityAccelerationStndDevY
	timeGravityAccelerationStndDevZ                  
	timeBodyAccelerationJerkMeanValueX
	timeBodyAccelerationJerkMeanValueY                 
	timeBodyAccelerationJerkMeanValueZ
	timeBodyAccelerationJerkStndDevX
	timeBodyAccelerationJerkStndDevY
	timeBodyAccelerationJerkStndDevZ"                   
	timeBodyGyroMeanValueX
	timeBodyGyroMeanValueY 
	timeBodyGyroMeanValueZ
	timeBodyGyroStndDevX
	timeBodyGyroStndDevY
	timeBodyGyroStndDevZ                            
	timeBodyGyroJerkMeanValueX
	timeBodyGyroJerkMeanValueY 
	timeBodyGyroJerkMeanValueZ
	timeBodyGyroJerkStndDevX                          
	timeBodyGyroJerkStndDevY
	timeBodyGyroJerkStndDevZ"                           
	timeBodyAccelerationMagnitudeMeanValue
	timeBodyAccelerationMagnitudeStndDev 
	timeGravityAccelerationMagnitudeMeanValue
	timeGravityAccelerationMagnitudeStndDev 
	timeBodyAccelerationJerkMagnitudeMeanValue
	timeBodyAccelerationJerkMagnitudeStndDev 
	timeBodyGyroMagnitudeMeanValue
	timeBodyGyroMagnitudeStndDev                    
	timeBodyGyroJerkMagnitudeMeanValue
	timeBodyGyroJerkMagnitudeStndDev 
	frequencyBodyAccelerationMeanValueX
	frequencyBodyAccelerationMeanValueY 
	frequencyBodyAccelerationMeanValueZ
	frequencyBodyAccelerationStndDevX                 
	frequencyBodyAccelerationStndDevY
	frequencyBodyAccelerationStndDevZ 
	frequencyBodyAccelerationMeanValueFreqX
	frequencyBodyAccelerationMeanValueFreqY 
	frequencyBodyAccelerationMeanValueFreqZ
	frequencyBodyAccelerationJerkMeanValueX 
	frequencyBodyAccelerationJerkMeanValueY
	frequencyBodyAccelerationJerkMeanValueZ 
	frequencyBodyAccelerationJerkStndDevX
	frequencyBodyAccelerationJerkStndDevY 
	frequencyBodyAccelerationJerkStndDevZ
	frequencyBodyAccelerationJerkMeanValueFreqX 
	frequencyBodyAccelerationJerkMeanValueFreqY
	frequencyBodyAccelerationJerkMeanValueFreqZ 
	frequencyBodyGyroMeanValueX
	frequencyBodyGyroMeanValueY 
	frequencyBodyGyroMeanValueZ
	frequencyBodyGyroStndDevX 
	frequencyBodyGyroStndDevY
	frequencyBodyGyroStndDevZ 
	frequencyBodyGyroMeanValueFreqX
	frequencyBodyGyroMeanValueFreqY 
	frequencyBodyGyroMeanValueFreqZ
	frequencyBodyAccelerationMagnitudeMeanValue 
	frequencyBodyAccelerationMagnitudeStndDev
	frequencyBodyAccelerationMagnitudeMeanValueFreq 
	frequencyBodyAccelerationJerkMagnitudeMeanValue
	frequencyBodyAccelerationJerkMagnitudeStndDev"      
	frequencyBodyAccelerationJerkMagnitudeMeanValueFreq
	frequencyBodyGyroMagnitudeMeanValue 
	frequencyBodyGyroMagnitudeStndDev
	frequencyBodyGyroMagnitudeMeanValueFreq 
	frequencyBodyGyroJerkMagnitudeMeanValue
	frequencyBodyGyroJerkMagnitudeStndDev 
	frequencyBodyGyroJerkMagnitudeMeanValueFreq
