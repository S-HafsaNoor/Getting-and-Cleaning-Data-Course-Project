# Step 0: Download and unzip dataset
if(!file.exists("./data")) {
  dir.create("./data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip", exdir="./data")

# Step 1: Merge training and test sets
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('./data/UCI HAR Dataset/features.txt')
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

train_data <- cbind(y_train, subject_train, x_train)
test_data <- cbind(y_test, subject_test, x_test)
merged_data <- rbind(train_data, test_data)

# Step 2: Extract measurements of mean and standard deviation
colNames <- colnames(merged_data)
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames))

subset_data <- merged_data[ , mean_and_std == TRUE]

# Step 3: Use descriptive activity names
setWithActivityNames <- merge(subset_data, activity_labels,
                              by='activityId',
                              all.x=TRUE)

# Step 4: Label dataset with descriptive variable names (already done)

# Step 5: Create a second tidy data set with the average of each variable for each activity and each subject
tidy_data <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
tidy_data <- tidy_data[order(tidy_data$subjectId, tidy_data$activityId),]

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
