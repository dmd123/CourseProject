courseproject <- function(x){
## This function produces a csv file in the user's R working directory of the averages 
##      for each subject and activity for average and standard deviation of the recorded data.
##      The name of the file produced by the function as passed to the funcation by the user
##      as a character variable.
##
## The function works by completing the following tasks:
##  1. load required packages
##  2. download & unzip files, create dataframe of activities
##  3. produce dataframe of test data
##  4. produce dataframe of training data
##  5. combine test data & training data
##  6. produce dataframe of combined data with only mean & average columns
##  7. create dataframe of average by subject & activity and write to csv file
##
##  1. load required packages
##
        library(plyr)
        library(data.table)
        library(reshape)
##
##  2. download & unzip files, create dataframe of activities
##
        
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "temp.zip", method = "internal", mode = "wb")
        unzip("temp.zip")
        activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
##
##  3. produce dataframe of test data
##
        test <- read.table("UCI HAR Dataset/test/X_test.txt")
        testlabels <- read.table("UCI HAR Dataset/test/Y_test.txt")
        testlabels <- join(testlabels,activitylabels)
        testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
        test <- cbind(testsubjects$V1,testlabels$V2,test)
        test <- rename(test, c("testsubjects$V1"="subject","testlabels$V2"="activity"))
##
##  4. produce dataframe of training data
##
        train <- read.table("UCI HAR Dataset/train/X_train.txt")
        trainlabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
        trainlabels <- join(trainlabels,activitylabels)
        trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
        train <- cbind(trainsubjects$V1,trainlabels$V2,train)
        train <- rename(train, c("trainsubjects$V1"="subject","trainlabels$V2"="activity"))
##
##  5. combine test data & training data
##
        traintest <- rbind(train, test)
        features <- read.table("UCI HAR Dataset/features.txt")
        temp <- c("subject","activity",as.character(features$V2))
        traintest <- setnames(traintest,temp)
##
##  6. produce dataframe of combined data with only mean & average columns
##
        meanstdcols <- c(grep("mean",names(traintest)),grep("std",names(traintest)))
        meanstdcols <- c(1,2,meanstdcols)
        meanstd <- traintest[,meanstdcols]
##
##  7. create dataframe of average by subject & activity and write to csv file
##
        meanstdave <- as.data.table(melt(data = meanstd, measure.vars = colnames(meanstd[,grep("mean|std",colnames(meanstd))])))
        meanstdave <- dcast.data.table(meanstdave, subject+activity ~ variable, fun=mean)
        write.table(meanstdave,x ,quote = FALSE,sep=",",row.name=FALSE)
}