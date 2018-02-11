library(dplyr)

rm(list = ls(all = TRUE))

# Path of downloaded file (downloaded offline)
paths1 <- file.path("./getdata_projectfiles_UCI HAR Dataset", "UCI HAR Dataset")


print(paths1)
files1 <- list.files(paths1, recursive = TRUE)

# Read training set, training labels, training subjects
file_train_set <- paste0(paths1, "/train/X_train.txt")
training_set <- read.table(file_train_set, header = FALSE)
file_train_label <- paste0(paths1, "/train/y_train.txt")
training_labels <- read.table(file_train_label, header = FALSE)
file_sub_train <- paste0(paths1, "/train/subject_train.txt")
sub_train <- read.table(file_sub_train, header = FALSE)
#edit(sub_train)

# Read test set, test labels and test subjects
file_test_set <- paste0(paths1, "/test/X_test.txt")
test_set <- read.table(file_test_set, header = FALSE)
file_test_labels <- paste0(paths1, "/test/y_test.txt")
test_labels <- read.table(file_test_labels, header = FALSE)
file_sub_test <- paste0(paths1, "/test/subject_test.txt")
sub_test <- read.table(file_sub_test, header = FALSE)

# Read feature vector
file_feature_vec <- paste0(paths1, "/features.txt")
feature_vec <- read.table(file_feature_vec, header = FALSE)

# Read activity labels
file_activity_labels <- paste0(paths1, "/activity_labels.txt")
activity_labels <- read.table(file_activity_labels, header = FALSE)

# Set the column names for the different Data Frames
colnames(test_set) <- feature_vec$V2
colnames(test_labels) <- "Activity_ID"
colnames(sub_test) <- "Subject_ID"

colnames(training_set) <- feature_vec$V2
colnames(training_labels) <- "Activity_ID"
colnames(sub_train) <- "Subject_ID"

colnames(activity_labels) <- c("Activity_ID", "Activity")

# Merge the Training Labels, Training Subjects and Training Set data sets
merged_training_set <- cbind(training_labels, sub_train, training_set)
# Do the same for the test sets too
merged_test_set <- cbind(test_labels, sub_test, test_set)

# MERGE THE TRAINING AND TEST DATA SETS
merged_training_test <- rbind(merged_training_set, merged_test_set)

# Get col names of the merged data set 
colnames_merged <- colnames(merged_training_test)
#mean_std_cols <- c(grep("Activity_ID", colnames_merged), grep("Subject_ID", colnames_merged), grep("mean...", colnames_merged), grep("std...", colnames_merged))
mean_std_cols = (grepl("Activity_ID", colnames_merged) | grepl("Subject_ID", colnames_merged) | grepl("mean...", colnames_merged) | grepl("std...", colnames_merged))
#merged_training_test <- merge(merged_training_set, merged_test_set, by.x = "Activity_ID", by.y = "Activity_ID")
#mean_std_set <- select(merged_training_test, mean_std_cols)
#mean_std_set <- select(merged_training_test, contains("Activity_ID")) #, "Subject_ID", "mean"))


# Find only the Mean and Std Deviation from the merged Data Set
mean_std_set <- merged_training_test[, mean_std_cols == TRUE]
print(nrow(mean_std_set))
print(ncol(mean_std_set))

#mean_std_set_with_labels <- rbind(mean_std_set, activity_labels)
#edit(mean_std_set_with_labels)
#activity_factors <- as.factor(activity_labels$Activity)
#class(activity_factors)
#print(levels(activity_factors))

#mean_std_set$Activity_ID <- as.factor(mean_std_set$Activity_ID)
#levels(mean_std_set$Activity_ID) <- levels(activity_factors)
#mean_std_set_with_labels <- merge(mean_std_set, activity_labels, by.x = "Activity_ID", by.y = "Activity", all.y = TRUE)

# Put the proper labels for the different activities
mean_std_set_with_labels <- merge(mean_std_set, activity_labels, by = "Activity_ID", all.x = TRUE)
edit(mean_std_set_with_labels)
mean_std_set_with_labels$Activity <- as.character(mean_std_set_with_labels$Activity) ##!!

# Create the other tidy data set - with avg for each var, for each activity and each subject
tidyDataSet2 <- aggregate(. ~Subject_ID - Activity, data = mean_std_set_with_labels, mean)
tidyDataSet <- tbl_df(arrange(tidyDataSet2, Subject_ID, Activity))


names(tidyDataSet) <- gsub("std()", "Std Dev", names(tidyDataSet))
names(tidyDataSet) <- gsub("mean()", "Mean", names(tidyDataSet))
names(tidyDataSet) <- gsub("Mag", "Magnitude", names(tidyDataSet))
names(tidyDataSet) <- gsub("BodyBody", "Body", names(tidyDataSet))

# Write the above data into a tidy data set
write.table(tidyDataSet, "tidyDataSet.txt", row.name = FALSE)
tidy_data_set1 <- read.table("tidyDataSet.txt")
edit(tidy_data_set1)
