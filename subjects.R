# Gets test and train subjects into the dataset keeping the order of observations. 

#load subjects from files
subject_train <- read.csv(subject_train_file,header=FALSE)
subject_test <- read.csv(subject_test_file,header=FALSE)

# bind test and train data
subject <- rbind(subject_train, subject_test)
rm(subject_train)
rm(subject_test)

#rename column properly
colnames(subject) <- "subject"
