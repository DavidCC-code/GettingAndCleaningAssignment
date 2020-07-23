
file <- "./UCI HAR Dataset/train/X_train.txt"
X_train <- read.table(file)

file <- "./UCI HAR Dataset/test/X_test.txt"
X_test <- read.table(file)

X <- rbind(X_train, X_test)
rm(X_train, X_test)

#  Read all variables and assing them as column names of X
file <- "./UCI HAR Dataset/features.txt"
variables <- read.table(file)

colnames(X) <- grep( "([a-z.a-z])", variables$V2, value=TRUE)
rm(variables)

# Select only mean and std functions variables,there are 66 of them
mean_std <- select(X, matches("-mean\\(\\)|-std\\(\\)"))
rm(X)
