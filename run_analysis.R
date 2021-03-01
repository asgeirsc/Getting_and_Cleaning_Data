## Read the activity labels into a data table
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Read the features into a data tables
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
features_meanstd <- grepl("mean|std", features)

## Read the files for the 'training' data set
## X_train: observations (561 measurements)
## Y_train: activities (values 1-6)
## subject_train: subjects (values 1-30)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Add activity name to X_test
Y_train[,2] = activities[Y_train[,1]]

## Rename the columns of the data tables
names(X_train) <- features
names(Y_train) <- c("activity", "activityname")
names(subject_train) <- "subject"

## Bind the X_train data (only mean and std measurements) with the subject and activity name
training <- cbind(subject_train, Y_train, X_train[,features_meanstd])

## Read the files for the 'test' data set
## X_train: observations (561 measurements)
## Y_train: activities (values 1-6)
## subject_train: subjects (values 1-30)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt") 
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Add activityname to Y_test
Y_test[,2] = activities[Y_test[,1]]

## Rename the columns of the data tables
names(X_test) <- features
names(Y_test) <- c("activity", "activityname")
names(subject_test) <- "subject"

## Bind the X_tests data (only mean and std measurements) with the subject and activity name
test <- cbind(subject_test, Y_test, X_test[,features_meanstd])

## Merge the 'training' and 'test' data sets, write result to a csv file
merged <- rbind(training, test)
write.csv(merged, file = "merged.csv")

## Reshape the data set in order to perform calculations for each subject/activityname combination
ids <- c("subject", "activity", "activityname")
measures <- setdiff(names(merged),ids)
melted <- melt(merged, id = ids, measure.vars = measures)

## Calcuate the mean of each measurement, per subject/activityname
means <- dcast(melted, subject + activityname ~ variable, mean)
write.csv(means, file = "means.csv")
