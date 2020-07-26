# Creates the second a tidy data set summarizing from "tidyDataSet"

# group by all columns except values and summirize usign mean function
# dataset avgTidyDataSet cotains 1 row * subject * measurment * measurement_type * function * axis(when there's
# measurement for each one of three axies), that's 696 rows per subject, total 11880 rows.

avgTidyDataSet <- tidyDataSet %>% group_by(subject, activity, measurement, measurement_type,func,axis) %>%
                  summarize_all(mean)
rm(tidyDataSet)

# rename "values2 column to "mean", more descriptive of the content
names(avgTidyDataSet)[names(avgTidyDataSet)=="values"] <- "mean"

# writes to second output file
write.table(avgtidyDataSet,output_avg_dataset, row.names=FALSE)
