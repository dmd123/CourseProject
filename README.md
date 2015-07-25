# This readme markdown file describes how my course project code works

I constructed a single function to perform the project.

The function uses the fulling packages: plyr, data.table, and reshape.


The user invokes the function by typing "run_analysis()" at the R prompt.
A file name can be included in the brackets. If no file name is inserted,
then the program will default to create tidydata.txt in the working
directory. The user is required to have the .zip file in their working
directory for the function the work.

These 7 tasks are completed by the function:
 1. load required packages
 2. download & unzip files, create dataframe of activities
 3. produce dataframe of test data
 4. produce dataframe of training data
 5. combine test data & training data
 6. produce dataframe of combined data with only mean & average columns
 7. create dataframe of average by subject & activity and write to text file

The data fields in the output file is separated by commas.