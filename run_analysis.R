# coursera-getting-and-cleaning-data-course-project
# data.table exercise
# Doyoung Chung, 4/10/2016

library(data.table)
library(dplyr)

# get activity and feature labels
activityLabels <- fread(paste0(getwd(), "/activity_labels.txt"), stringsAsFactors = FALSE)
features <- fread(paste0(getwd(), "/features.txt"), stringsAsFactors = FALSE)

# extract only the measurements on the mean and standard deviation for each measurement.
extracted_features <- grep("-mean\\(\\)|-std\\(\\)", features[, V2])
feature_names <- features[extracted_features, V2]
feature_names <- gsub("-mean", "Mean", feature_names)
feature_names <- gsub("-std", "Std", feature_names)
feature_names <- gsub("[-()]", "", feature_names)

# load train data
train <- subset(fread(paste0(getwd(), "/train/X_train.txt")), TRUE, extracted_features)
trainActivities <- fread(paste0(getwd(), "/train/y_train.txt"))
trainSubjects <- fread(paste0(getwd(), "/train/subject_train.txt"))
train <- cbind(trainSubjects, trainActivities, train)

# load test data
test <- subset(fread(paste0(getwd(), "/test/X_test.txt")), TRUE, extracted_features)
testActivities <- fread(paste0(getwd(), "/test/y_test.txt"))
testSubjects <- fread(paste0(getwd(), "/test/subject_test.txt"))
test <- cbind(testSubjects, testActivities, test)

# merge the training and the test sets to create one data set.
# use descriptive activity names to name the activities in the data set
# appropriately label the data set with descriptive variable names.
merged_data <- rbindlist(list(train, test))
setnames(merged_data, c("subject", "activity", feature_names))
merged_data$subject <- as.factor(merged_data$subject)
merged_data$activity <- factor(merged_data$activity, levels = activityLabels[, V1], labels = activityLabels[, V2])
#write.table(merged_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)

# from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data <- merged_data[, lapply(.SD, mean), by=c("subject", "activity")]
write.table(data, "tidy_data_avg.txt", row.names = FALSE, quote = FALSE)
