
library(plyr)
library(dplyr)

file <- "./UCI HAR Dataset/train/y_train.txt"
labels_train <- read.csv(file,header=FALSE)

file <- "./UCI HAR Dataset/test/y_test.txt"
labels_test <- read.csv(file,header=FALSE)

labels <- rbind(labels_train, labels_test)
rm(labels_train, labels_test)

colnames(labels) <- "label"

# Add activity name to each label

#   load activity name \ label link file 
file <- "./UCI HAR Dataset/activity_labels.txt"
activity_labels <- read.delim(file, header = FALSE, sep=" ")
colnames(activity_labels) <- c("label","activity")

#   Join activity lables and names and keep only activity name
activity <- select(join(labels,activity_labels),activity)
rm(activity_labels, labels)
