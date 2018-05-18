# GettingandCleaningDataCoursera
Getting and Cleaning Data Coursera Project

## Project Description
The purpose is to demonstrate the process to collect, work with, and clean a data set. Prepare a tidy data that can be used for later analysis. 

## Source Information
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The source data files for this project can be found as below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Initial Step
Set the working directory to the location to keep all project work. 

## Details
The R script run_analysis.R does the following. Further details are in CodeBook.R
1.	Downloads the zip file in a project directory – courseprojecttidydata/getdatafiles.zip
2.	Unzips the file in UCI HAR Dataset
3.	Reads the data files (features.txt, activity_labels.txt, subject_train.txt, X_train.txt, y_train.txt,(subject_test.txt, X_test.txt, y_test.txt) 
4.	Merges the training and the test sets to create one data set.
5.	Extracts only the measurements on the mean and standard deviation for each measurement.
6.	Uses descriptive activity names to name the activities in the data set
7.	Appropriately labels the data set with descriptive variable names.
8.	From the data set in above step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
9.	Writes the final tidy data “Coursefinaltidydata.csv” in two directories above the current data set directory.

Further information can be located in the CodeBook.md file.
