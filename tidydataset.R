tidyDataSet <- cbind(subject,activity,mean_std)
rm(subject,activity,mean_std)
write.table(tidyDataSet,output_dataset)