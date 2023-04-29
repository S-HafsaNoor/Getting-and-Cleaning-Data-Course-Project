## Data Transformation Process
This project involved transforming the original "Human Activity Recognition Using Smartphones Data Set" into a tidy dataset. The following steps were performed to achieve this:

1. Merge the training and test datasets to create a single dataset
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the dataset
4. Label the dataset with descriptive variable names
5. Create a second, independent tidy dataset with the average of each variable for each activity and each subject.

## About the R Script
The R script "run_analysis.R" performs the aforementioned data transformation process in five steps, as required by the project instructions. The script uses the following variables:

x_train, y_train, x_test, y_test, subject_train, and subject_test contain data from the downloaded files.
x_data, y_data, and subject_data merge the previous datasets for further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in


## Variables
The features_info.txt file contains information on the variables in the dataset, including the variable names, data types, and measurement units. The dataset consists of 561 variables, including time and frequency domain variables.

In addition, the activity_labels.txt file contains the labels for each activity in the dataset, while the subject_train.txt and subject_test.txt files contain subject IDs for each observation.

The final tidy dataset, tidy_data.txt, contains the average of each variable for each subject and each activity, as required by the project instructions.