=================
CodeBook.md
================

Human Activity Recognition Using Smartphones - summarized data set


The dataset includes the following files:

README.md           : description of how the scripts work
CodeBook.md         : variables, the data, and transformations used to process the data set
run_analysis.R      : the R script to transform the data
DSM_HAR_Summary.txt : the summary data file


===================
1. Data set description

The data set summarizes the original dataset by:

Subject_ID  : the identification number of the subject performing the test
Activity    : the activity performed (walking, walking upstairs, walking downstairs, sitting, standing, laying)

The 66 mean and standard deviation variables are means of the original variables by subject id and activity. 
The units are the same as the original dataset. 


=====================
2. Column descriptions 

The original dataset contains 561 measurement variables. This script only extracts the mean and standard eviation variables (66). Listed below are the variables along with the row number from features.txt

1	tBodyAcc-mean()-X       : for each subject and activity, the mean time body acceleration in X direction 
2	tBodyAcc-mean()-Y       : for each subject and activity, the mean time body acceleration in Y direction 
3	tBodyAcc-mean()-Z       : for each subject and activity, the mean time body acceleration in Z direction 
41	tGravityAcc-mean()-X    : for each subject and activity, the mean time gravity acceleration in X direction 
42	tGravityAcc-mean()-Y    : for each subject and activity, the mean time gravity acceleration in Y direction 
43	tGravityAcc-mean()-Z    : for each subject and activity, the mean time gravity acceleration in Z direction 
81	tBodyAccJerk-mean()-X	: for each subject and activity, the mean time body acceleration jerk in X direction 
82	tBodyAccJerk-mean()-Y   : for each subject and activity, the mean time body acceleration jerk in Y direction 
83	tBodyAccJerk-mean()-Z   : for each subject and activity, the mean time body acceleration jerk in Z direction 
121	tBodyGyro-mean()-X      : for each subject and activity, the mean time body gyration in the X direction 
122	tBodyGyro-mean()-Y      : for each subject and activity, the mean time body gyration in the Y direction 
123	tBodyGyro-mean()-Z      : for each subject and activity, the mean time body gyration in the Z direction 
161	tBodyGyroJerk-mean()-X  : for each subject and activity, the mean time body gyration jerk in the X direction 
162	tBodyGyroJerk-mean()-Y  : for each subject and activity, the mean time body gyration jerk in the Y direction 
163	tBodyGyroJerk-mean()-Z  : for each subject and activity, the mean time body gyration jerk in the Z direction 
201	tBodyAccMag-mean()      : for each subject and activity, the mean time body acceleration magnitude 
214	tGravityAccMag-mean()   : for each subject and activity, the mean time body acceleration jerk 
227	tBodyAccJerkMag-mean()  : for each subject and activity, the mean time body acceleration jerk magnitude  
240	tBodyGyroMag-mean()     : for each subject and activity, the mean time body gyration magnitude  
253	tBodyGyroJerkMag-mean() : for each subject and activity, the mean time body gyration jerk magnitude  
266	fBodyAcc-mean()-X       : for each subject and activity, the mean frequency domain signals body acceleration in X direction 
267	fBodyAcc-mean()-Y       : for each subject and activity, the mean frequency domain signals body acceleration in Y direction 
268	fBodyAcc-mean()-Z       : for each subject and activity, the mean frequency domain signals body acceleration in Z direction 
345	fBodyAccJerk-mean()-X   : for each subject and activity, the mean frequency domain signals body acceleration jerk in X direction 
346	fBodyAccJerk-mean()-Y   : for each subject and activity, the mean frequency domain signals body acceleration jerk in Y direction 
347	fBodyAccJerk-mean()-Z   : for each subject and activity, the mean frequency domain signals body acceleration jerk in Z direction 
424	fBodyGyro-mean()-X      : for each subject and activity, the mean frequency domain signals body gyration in the X direction 
425	fBodyGyro-mean()-Y      : for each subject and activity, the mean frequency domain signals body gyration in the Y direction 
426	fBodyGyro-mean()-Z      : for each subject and activity, the mean frequency domain signals body gyration in the Z direction 
503	fBodyAccMag-mean()      : for each subject and activity, the mean frequency domain signals body acceleration jerk magnitude  
516	fBodyBodyAccJerkMag-mean() :  for each subject and activity, the mean frequency domain signals body acceleration jerk magnitude  
529	fBodyBodyGyroMag-mean()    :  for each subject and activity, the mean frequency domain signals body gyration jerk 
542	fBodyBodyGyroJerkMag-mean():  for each subject and activity, the mean frequency domain signals body gyration jerk magnitude
4	tBodyAcc-std()-X        : for each subject and activity, the standard deviation time body acceleration in X direction 
5	tBodyAcc-std()-Y        : for each subject and activity, the standard deviation time body acceleration in Y direction 
6	tBodyAcc-std()-Z        : for each subject and activity, the standard deviation time body acceleration in Z direction 
44	tGravityAcc-std()-X     : for each subject and activity, the standard deviation time gravity acceleration in X direction 
45	tGravityAcc-std()-Y     : for each subject and activity, the standard deviation time gravity acceleration in Y direction 
46	tGravityAcc-std()-Z     : for each subject and activity, the standard deviation time gravity acceleration in Z direction 
84	tBodyAccJerk-std()-X	: for each subject and activity, the standard deviation time body acceleration jerk in X direction 
85	tBodyAccJerk-std()-Y	: for each subject and activity, the standard deviation time body acceleration jerk in Y direction 
86	tBodyAccJerk-std()-Z	: for each subject and activity, the standard deviation time body acceleration jerk in Z direction 
124	tBodyGyro-std()-X      : for each subject and activity, the standard deviation time body gyration in the X direction 
125	tBodyGyro-std()-Y      : for each subject and activity, the standard deviation time body gyration in the Y direction 
126	tBodyGyro-std()-Z      : for each subject and activity, the standard deviation time body gyration in the Z direction 
164	tBodyGyroJerk-std()-X  : for each subject and activity, the standard deviation time body gyration jerk in the X direction 
165	tBodyGyroJerk-std()-Y  : for each subject and activity, the standard deviation time body gyration jerk in the Y direction 
166	tBodyGyroJerk-std()-Z  : for each subject and activity, the standard deviation time body gyration jerk in the Z direction 
202	tBodyAccMag-std()      : for each subject and activity, the standard deviation time body acceleration magnitude 
215	tGravityAccMag-std()   : for each subject and activity, the standard deviation time body acceleration jerk 
228	tBodyAccJerkMag-std()  : for each subject and activity, the standard deviation time body gyration jerk magnitude  
241	tBodyGyroMag-std()     : for each subject and activity, the standard deviation time body gyration magnitude  
254	tBodyGyroJerkMag-std() : for each subject and activity, the standard deviation time body gyration jerk magnitude  
269	fBodyAcc-std()-X       : for each subject and activity, the standard deviation frequency domain signals body acceleration in X direction 
270	fBodyAcc-std()-Y       : for each subject and activity, the standard deviation frequency domain signals body acceleration in Y direction 
271	fBodyAcc-std()-Z       : for each subject and activity, the standard deviation frequency domain signals body acceleration in Z direction 
348	fBodyAccJerk-std()-X   : for each subject and activity, the standard deviation frequency domain signals body acceleration jerk in X direction 
349	fBodyAccJerk-std()-Y   : for each subject and activity, the standard deviation frequency domain signals body acceleration jerk in Y direction 
350	fBodyAccJerk-std()-Z   : for each subject and activity, the standard deviation frequency domain signals body acceleration jerk in Z direction 
427	fBodyGyro-std()-X      : for each subject and activity, the standard deviation frequency domain signals body gyration in the X direction 
428	fBodyGyro-std()-Y      : for each subject and activity, the standard deviation frequency domain signals body gyration in the X direction 
429	fBodyGyro-std()-Z      : for each subject and activity, the standard deviation frequency domain signals body gyration in the X direction 
504	fBodyAccMag-std()      : for each subject and activity, the standard deviation frequency domain signals body acceleration jerk magnitude  
517	fBodyBodyAccJerkMag-std()  :  for each subject and activity, the standard deviation frequency domain signals body acceleration jerk magnitude  
530	fBodyBodyGyroMag-std()     :  for each subject and activity, the standard deviation frequency domain signals body gyration jerk 
543	fBodyBodyGyroJerkMag-std() :  for each subject and activity, the standard deviation frequency domain signals body gyration jerk magnitude


================
3. Input data set

This dataset is a summarized version of the Human Activity Recognition Using Smartphones data set. 
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
