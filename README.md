# Getting-and-Cleaning-Data-Course-Project

This repository contains R code that downloads, merges, and cleans a dataset of wearable computing data. The dataset is sourced from the UCI Machine Learning Repository.

The run_analysis.R script performs the following steps:

Downloads and unzips the dataset to a folder named data in the working directory.
Reads in the training and test sets and merges them.
Extracts only the measurements of mean and standard deviation for each feature.
Uses descriptive activity names to name the activities in the dataset.
Labels the dataset with descriptive variable names.
Creates a tidy dataset with the average of each variable for each activity and each subject.
The resulting tidy dataset is saved as a text file named tidy_data.txt in the working directory.

To run the script, simply execute the code in run_analysis.R in an R environment with internet access. The script requires the dplyr package to be installed.

For more information about the variables and data used in this analysis, please refer to the CodeBook.md file.