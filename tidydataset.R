
# bind together subjects , activitis, and measurements means and standard deviations
tidyDataSet <- cbind(subject,activity,mean_std)
rm(subject,activity,mean_std)

# format table creating variable measurment which contains measruement name, function applied 
# to the mesaurement and axis for which the measurment was taken when necessary . 
tidyDataSet <- tidyDataSet %>% gather(keys, values, -subject, -activity) %>% 
               extract(keys, c("measurement","func","axis"),"([a-z]*)_(mean|std)(.*)") %>%
               mutate(axis = ifelse(axis=="",NA,axis)) %>% mutate(axis = sub("_","",axis))  

#write dataset to file
write.table(tidyDataSet, output_dataset, row.names = FALSE)