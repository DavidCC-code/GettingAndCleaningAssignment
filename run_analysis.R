## run_analysis.R
#    
#  Using UCI HAR Dataset creates two tidy data sets:
#    1st Containing the only variables for mean and standard deviation of the each measurement and, of course, the corresponding 
#    test subject and activity.
#    2nd Cotaining the mean of each of the variables in the firs dataset, fore each subject and activity.
#
#  Both dats sets will be saved as tidydataset.txt and avgtidydataset.txt to the working directory, also will remain loaded in 
#  the session environment as tidyDataSet and avgTidyDataSet

output_dataset <- "./tidydataset.txt"
output_avg_dataset  <- "./avgtidydataset.txt"

#  Orginal UCI HAR Dataset is divided in two sets, train and test data, each set is composed of three files.
#  Dimensions activity label and subject are in a separate file each one, and the actual observations are in the third file.


#  Load test and train datafiles and bind rows, frist train second test


#Subjects 


  source("./subjects.R")
  
#Labels
  
  source("./activities.R")

# mean and std variables data

  source("./mean_std_var_data.R")

# Bind togheter in a single table subjects, labels, mean() a std()
  tidyDataSet <- cbind(subject,activity,mean_std)
  rm(subject,activity,mean_std)

# Group by subject and activity to summarize average means and stds for
# each subject and activity into another data set
  
  avgTidyDataSet <- tidyDataSet %>% group_by(subject, activity) %>% summarize_all(mean)
  
# Finally rename columns adding prefix "avg-" to indicate that there's been further
# summarization from the original values.
  
  oldnames <- colnames(AvgTidyDataSet[3:68])
  newnames <- paste("avg-",colnames(AvgTidyDataSet[3:68]), sep="")
  avgTidyDataSet <- AvgTidyDataSet %>% rename_at(vars(oldnames),~newnames)
  
  
  


