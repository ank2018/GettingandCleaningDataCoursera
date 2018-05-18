#run_analysis.R
# Below script will download the UCI HAR Dataset from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# the script does the following steps to get a tidy data set
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# check if the directory exists else create it
print("Creating directory courseprojecttidydata..")
if (!file.exists("courseprojecttidydata")){dir.create("courseprojecttidydata")}

# set the current working directory to the location where the zip file will be stored
print("Setting current working directory courseprojecttidydata..")
setwd("courseprojecttidydata")

# download the zip file from the fileURL location and store it in the destfile
print("Downloading the zip file..")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "getdatafiles.zip", mode = "wb")

# unzip the zip file in the current location
print("Unzipping the zip file..")
unzip("getdatafiles.zip")

# set the current working directory to the location where the zip file is downloaded
print("Setting the working directory where source files reside..")
setwd("UCI HAR Dataset")

# read the data files from the features, activity info and data files in the train folder 
# and assign colnames to each of the files by referring to the README.txt file which provides details regarding the files contents
print("Reading the features, activity and train data files..")
readfeatures <- read.table("features.txt",header = FALSE)

readactivitylabels <- read.table("activity_labels.txt",header = FALSE)
colnames(readactivitylabels) <- c("activityid","activityname")

readsubjecttrain <- read.table("./train/subject_train.txt",header = FALSE)
colnames(readsubjecttrain) <- c("subjectid")

readXtrain <- read.table("./train/X_train.txt",header = FALSE)
colnames(readXtrain) <- readfeatures[,2]

readytrain <- read.table("./train/y_train.txt",header = FALSE)
colnames(readytrain) <- c("activityid")

#merge the data from all files in the train folder
print("Merging the train data files..")
traindata <- cbind(readsubjecttrain,readXtrain,readytrain)

# read the data files in the test folder 
# and assign colnames to each of the files by referring to the README.txt file which provides details regarding the files contents
print("Reading the test data files..")
readsubjecttest <- read.table("./test/subject_test.txt",header = FALSE)
colnames(readsubjecttest) <- c("subjectid")

readXtest <- read.table("./test/X_test.txt",header = FALSE)
colnames(readXtest) <- readfeatures[,2]

readytest <- read.table("./test/y_test.txt",header = FALSE)
colnames(readytest) <- c("activityid")

#merge the data from all files in the test folder
print("Merging the test data files..")
testdata <- cbind(readsubjecttest,readXtest,readytest)

# 1. Merges the training and the test sets to create one data set.
print("Merging the test and train data files..")
mtraintestdata <- rbind(traindata,testdata)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
print("Extracting the mean and standard deviation for each measurement..")
meanstddata <- mtraintestdata[grepl("activityid", colnames(mtraintestdata)) | grepl("subjectid", colnames(mtraintestdata)) | grepl("-mean..", colnames(mtraintestdata)) | grepl("-std..", colnames(mtraintestdata))]

# 3. Merge to Use descriptive activity names to name the activities in the data set
print("Merging the activity names to name the activities")
meanstddata <- merge(meanstddata,readactivitylabels,by = "activityid",all.x = TRUE)

# 4. Appropriately label the data set with descriptive variable names by removing/substituting readable variable names 
# Referred to the features_info.txt for the set of variables that were estimated from these signals are
print("Labelling the data set with descriptive variable names")
colnames(meanstddata) <- gsub("^t","time",colnames(meanstddata))
colnames(meanstddata) <- gsub("^f","frequency",colnames(meanstddata))
colnames(meanstddata) <- gsub("mean","MeanValue",colnames(meanstddata))
colnames(meanstddata) <- gsub("std","StndDev",colnames(meanstddata))
colnames(meanstddata) <- gsub("\\()","",colnames(meanstddata))
colnames(meanstddata) <- gsub("-","",colnames(meanstddata))
colnames(meanstddata) <- gsub("BodyBody","Body",colnames(meanstddata))
colnames(meanstddata) <- gsub("Mag","Magnitude",colnames(meanstddata))
colnames(meanstddata) <- gsub("Acc","Acceleration",colnames(meanstddata))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
print("Creating a clean tidy data set with average for each variable for each activity and each subject")
avgcoldata <- meanstddata[, colnames(meanstddata) != "activityname"]

# Using dot notation find the average of each variable for each activity and each subject
avgcoldataagg <- aggregate(.~ activityid+subjectid,avgcoldata,FUN = mean)

# Merge to Use descriptive activity names to the tidy data set having average information
finaltidydata <- merge(readactivitylabels,avgcoldataagg,by = "activityid",all.y = TRUE)

# write the final tidy data set to a file
print("writing the tidy data to Coursefinaltidydata.txt in one directory above the data set directory")
setwd("../..")
write.table(finaltidydata,file="Coursefinaltidydata.txt", row.names = FALSE)


