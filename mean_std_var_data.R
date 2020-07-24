
#load variable data from file
X_train <- read.table(x_train_file)
X_test <- read.table(x_test_file)

# bind train and test together
X <- rbind(X_train, X_test)
rm(X_train, X_test)

#  Read all variables and assing them as column names of X
variables <- read.table(features_file)

# remove special characters from variable names and
# change to lowercase to use them as proper column names
variables$V2 <- str_replace_all(variables$V2,"[,-]","_")
variables$V2 <- str_replace_all(variables$V2,"[\\(\\)]","")
variables$V2 <- tolower(variables$V2)

colnames(X) <-  variables$V2
rm(variables)

# Select only mean and std functions variables,there are 66 of them
mean_std <- select(X, matches("_mean$|_std$|_mean_[xyz]$|_std_[xyz]$"))
rm(X)
