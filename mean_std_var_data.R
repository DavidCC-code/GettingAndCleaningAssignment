

file <- "./UCI HAR Dataset/train/X_train.txt"
X_train <- read.table(file)

file <- "./UCI HAR Dataset/test/X_test.txt"
X_test <- read.table(file)

X <- rbind(X_train, X_test)
rm(X_train, X_test)

#  Read all variables and assing them as column names of X
file <- "./UCI HAR Dataset/features.txt"
variables <- read.table(file)

# remove special characters from variable names and
# change to lowercase to use them as proper column names
variables$V2 <- str_replace_all(variables$V2,"[,-]","_")
variables$V2 <- str_replace_all(variables$V2,"[\\(\\)]","")
variables$V2 <- tolower(variables$V2)

colnames(X) <-  variables$V2
rm(variables)

# Select only mean and std functions variables,there are 66 of them
mean_std <- select(X, matches("_mean$|_std$|_mean_[xyz]$|_std_[xyz]$"))
#rm(X)
