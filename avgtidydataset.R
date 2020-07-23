
avgTidyDataSet <- tidyDataSet %>% group_by(subject, activity) %>% summarize_all(mean)

# Finally rename columns adding prefix "avg_" to indicate that there's been further
# summarization from the original values.

oldnames <- colnames(avgTidyDataSet[3:68])
newnames <- paste("avg_",colnames(avgTidyDataSet[3:68]), sep="")
avgTidyDataSet <- avgTidyDataSet %>% rename_at(vars(all_of(oldnames)),~newnames)
