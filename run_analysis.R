#Step1 - Merges the training and the test sets to create one data set.
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(trainData)
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(trainLabel)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(trainSubject)
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(testData)
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(testLabel)
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(testSubject)
joinData <- rbind(trainData, testData)
joinSubject <- rbind(trainSubject, testSubject)
joinLabel <- rbind(trainLabel, testLabel)

#Step2 - Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("./UCI HAR Dataset/features.txt")
names(features)
meanStdCol <- grep("mean\\(\\)|std\\(\\)", features[, 2]) #get column locations of mean and std data
joinData <- joinData[, meanStdCol] #get only Columns that store mean and std

#Step3 - Uses descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

#Step4 - Appropriately labels the data set with descriptive variable names
names(joinSubject) <- "subject"
completeData <- cbind(joinSubject, joinLabel, joinData)
write.table(completeData, "complete_data.txt") 

#Step5 - From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
library(dplyr)
SummaryData <- completeData%>% group_by(activity,subject) %>% summarise_each(funs(mean))
write.table(SummaryData, "summary_data.txt") 


