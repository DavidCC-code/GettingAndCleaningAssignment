tidyDataSet <- cbind(subject,activity,mean_std)
rm(subject,activity,mean_std)

tidyDataSet <- tidyDataSet %>% gather(keys, values, -subject, -activity) %>% 
               extract(keys, c("measurement","func","axis"),"([a-z]*)_(mean|std)(.*)") %>%
               mutate(axis = ifelse(axis=="",NA,axis)) %>% mutate(axis = sub("_","",axis))  
write.table(tidyDataSet,output_dataset)