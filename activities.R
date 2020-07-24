
#load labels data from files
labels_train <- read.csv(labels_train_file,header=FALSE)
labels_test <- read.csv(labels_test_file,header=FALSE)

# bind together train and test data
labels <- rbind(labels_train, labels_test)
rm(labels_train, labels_test)

#rename column properly
colnames(labels) <- "label"

# Add activity name to each label

#   load activity name \ label link file 
activity_labels <- read.delim(activity_label_file, header = FALSE, sep=" ")
colnames(activity_labels) <- c("label","activity")

#   Join activity lables and names and keep only activity name
activity <- select(join(labels,activity_labels),activity)
rm(activity_labels, labels)
