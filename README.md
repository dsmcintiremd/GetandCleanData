=================
README.md
================

Human Activity Recognition Using Smartphones - summarized data set


The dataset includes the following files:

README.md           : description of how the scripts work
CodeBook.md         : variables, the data, and transformations used to process the data set
run_analysis.R      : the R script to transform the data
DSM_HAR_Summary.txt : the summary data file

================
1. Input data set

This dataset is a summarized wide format version of the Human Activity Recognition Using Smartphones data set. 
Details on the input data set can be found here:

   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The input dataset can be found here:

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files used to create the summary data set are:

features.txt
activity_label.txt
X_test.txt
y_test.txt
subject_test.txt
X_train.txt
y_train.txt
subject_test.txt


========================
2. Transformations

The script run_analysis.R creates a wide data set and performs the following transformations:

- Creates reference data frames from the following files:
features.txt
activity_label.txt

- Creates one test data frame from the following files:
X_test.txt
y_test.txt
subject_test.txt

- Created one training data frame from the following files:
X_train.txt
y_train.txt
subject_test.txt

- Keeps the mean and standard devitation variables from the test and training data sets. 
Searches the column names for: mean() and std

- Adds observation id (Obs_ID) to the test and training sets

- Add activity name to the activity data frame

- Combines the test and training data into one data set

- Finally, summarizes the single data frame by subject_id and activity_name


The detailed script processing is below:

1. Downloads files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (manual download)
2. Reads the files into data frames
3. Add descriptive activity names and name column
4. Keep the mean and standard deviations columns from the X data frames
5. Join the training and test data frames
6. Combine test and training data sets into one data set
7. Determine of average for each variable by subject and activity
8. writes a file called: DSM_HAR_Summary.txt

========================
3. Output data set

The transformations outlined above creates a summarized wide format dataset:

   DSM_HAR_Summary.txt
