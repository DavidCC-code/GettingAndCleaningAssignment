## run_analysis.R


library(plyr)
library(dplyr)
library(stringr)
library(tidyr)

#    
#  Using UCI HAR Dataset creates two tidy data sets:
#    1st Containing the only variables for mean and standard deviation of the each measurement and, of course, the corresponding 
#    test subject and activity.
#    2nd Cotaining the mean of each of the variables in the firs dataset, fore each subject and activity.
#
#  The second  data sets will be saved as tidydataset.txt and avgtidydataset.txt to the working directory, also will remain loaded in 
#  the session environment avgTidyDataSet

  output_avg_dataset  <- "./avgtidydataset.txt"

#  Orginal UCI HAR Dataset is divided in two sets, train and test data, each set is composed of three files.
#  Dimensions activity label and subject are in a separate file each one, and the actual observations are in the third file.

#  Load test and train datafiles and bind rows, frist train second test
#  each script creates a single data frame  

#Subjects 
  subject_train_file <- "./UCI HAR Dataset/train/subject_train.txt"
  subject_test_file  <- "./UCI HAR Dataset/test/subject_test.txt"
  
  source("./subjects.R")
  
#Labels
  
  labels_train_file <- "./UCI HAR Dataset/train/y_train.txt"
  labels_test_file <- "./UCI HAR Dataset/test/y_test.txt"
  activity_label_file <- "./UCI HAR Dataset/activity_labels.txt"
  
  source("./activities.R")
  
# load calculated features from original data set and keep only
# mean() and std() variables data
  
  x_train_file <- "./UCI HAR Dataset/train/X_train.txt"
  x_test_file <- "./UCI HAR Dataset/test/X_test.txt"
  features_file <- "./UCI HAR Dataset/features.txt"
  source("./mean_std_var_data.R")

# Bind togheter in a single table subjects, labels, mean() a std()
  source("./tidydataset.R")

# Group by subject and activity to summarize average means and stds for
# each subject and activity into another data set
# creates data frame and writes it to output file

  source("./avgtidydataset.R")

# clean all character values used leaving only the avgTidyDataSet loaded in the environment.  
  rm(list=ls.str(mode='character'))


