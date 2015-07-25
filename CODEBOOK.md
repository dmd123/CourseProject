Code Book for run_analysis.r
=============================

The objective of the code is to produce 2 tidy data sets from 3-axial signals obtained from a 
smartphone accelerometer and expressed as standard gravity units. These 2 tidy data sets are:
1) training and testing data for 30 subjects for 561 data points & computations from data points,
and 2) averages of a subset of the data points that inlcude only the mean and standard deviations
for each of the 30 subjects and for each of the 3 activities.

The code was created in R version 3.2.1, using RStudio 99.447.

Required packages include plyr, data.table and reshape.

Variables utilized in the code are:
   1. activitylabels -- the 6 activities recorded for each of the 30 subjects
   2. features -- 561 data points and computations provided for each subject and each activity
   3. temp -- variable used to store data temporarily in various places of the code
   4. test -- testing data for each of the subjects doing the various activities
   5. testlabels -- activity labels that correspond to activity numbers in test
   6. testsubjects -- subject numbers that correspond to test
   7. train -- testing data for each of the subjects doing the various activities
   8. trainlabels -- activity labels that correspond to activity numbers in train
   9. trainsubjects -- subject numbers that correspond to train
   10.traintest -- vertical combination of test and train
   11.meanstd -- subset of variable #__ with only mean & standard deviation columns
   12.meanstdcols -- variable used to assign column names to meanstdave
   13.meanstdave -- the tidy data set mentioned as #2 in the 1st paragraph of this document

The code is organized into the following sections:
   1. load required packages
   2. download & unzip files, create dataframe of activities
   3. produce dataframe of test data
   4. produce dataframe of training data
   5. combine test data & training data
   6. produce dataframe of combined data with only mean & average columns
   7. create dataframe of average by subject & activity and write to csv file
