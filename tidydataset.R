# Bind together all 3 temporary data frame into one and transform it to be understandable a ready to perform the later
#summariztion to get the final requested output

# bind together subjects , activitis, and measurements means and standard deviations

tidyDataSet <- cbind(subject,activity,mean_std)
rm(subject,activity,mean_std)

# format table creating variable measurment which contains measruement name, measurement_type which indcates
# whethere it's a measurement of time or frequency, function applied  to the mesaurement and axis for which 
# the measurment was taken when necessary . 

tidyDataSet <- tidyDataSet %>% gather(keys, values, -subject, -activity) %>% 
               extract(keys, c("measurement_type", "measurement","func","axis"),"(f|t)([a-z]*)_(mean|std)(.*)") %>%
               mutate(axis = ifelse(axis=="",NA,axis)) %>% mutate(axis = sub("_","",axis)) %>%
               mutate(measurement_type = ifelse(measurement_type == "f","frequency", ifelse(measurement_type == "t","time",NA )))

