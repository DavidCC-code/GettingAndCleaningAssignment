
file <- "./UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.csv(file,header=FALSE)

file <- "./UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.csv(file,header=FALSE)

subject <- rbind(subject_train, subject_test)
rm(subject_train)
rm(subject_test)

colnames(subject) <- "subject"
