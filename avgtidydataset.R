
# group by all columns except values and summirize usign mean function
# dataset avgTidyDataSet cotains 1 row * subject * measurment * function * axis(when there's
# measurement for each one of three axies), that's 696 rows per subject, total 11880 rows.

avgTidyDataSet <- tidyDataSet %>% group_by(subject, activity, measurement,func,axis) %>%
                  summarize_all(mean)

# rename "values2 column to "mean", more descriptive of the content
names(avgTidyDataSet)[names(avgTidyDataSet)=="values"] <- "mean"

# writes to second output file
write.table(tidyDataSet,output_avg_dataset, row.names=FALSE)
