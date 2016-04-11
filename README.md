# Getting and Cleaning Data Course Project
==========================================

Submitted Files

- [run_analysis.R](https://github.com/piperid/data-cleaning/blob/master/run_analysis.R)
- [README.md](https://github.com/piperid/data-cleaning/blob/master/README.md)
- [CodeBook.md](https://github.com/piperid/data-cleaning/blob/master/CodeBook.md)

Using "data.table" and "dplyr" packages, the R script, "run_analysis.R", does:

1. merge the training and the test sets to create one data set.
2. extract only the measurements on the mean and standard deviation for each measurement.
3. use descriptive activity names to name the activities in the data set
4. appropriately label the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Output Files
- [tidy_data.txt](https://github.com/piperid/data-cleaning/blob/master/tidy_data.txt): Merged tidy data
- [tidy_data_avg.txt](https://github.com/piperid/data-cleaning/blob/master/tidy_data_avg.txt): tidy data with the average
