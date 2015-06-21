###########################################################################################################################################
## Script Name: run_analysis.R
##
## This script:
## 1. Downloads files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (manual download)
## 2. Reads the files into data frames
## 3. Add descriptive activity names and name column
## 4. Keep the mean and standard deviations columns from the X data frames
## 5. Join the training and test data frames
## 6. Combine test and training data sets into one data set
## 7. Determine of average for each variable by subject and activity
## 8. writes a file called: DSM_HAR_Summary.txt
###########################################################################################################################################

run_analysis <- function () {
  
  ##------------------------
  ##  Read in files 
  ##-----------------------
  
  ## read common files
  
  actlbl_df   <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Activity_ID","Activity_Nme"))
  features_df <- read.table("./UCI HAR Dataset/features.txt", sep = " ")
  colnmes     <- features_df [[2]]
  
  ## read test files 
  
  tst_x_df    <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=colnmes)
  tst_y_df    <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity_ID" )
  tst_sbjt_df <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject_ID" )
  
  ## read training files 
  
  trn_x_df    <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=colnmes)
  trn_y_df    <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity_ID" )
  trn_sbjt_df <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject_ID" )
  
  ##-----------------------------------------------------------------------------------
  ## Add descriptive activity name column to y dfs and add column names to features_df
  ##-----------------------------------------------------------------------------------
  
  tst_y_df = join (tst_y_df, actlbl_df, by='Activity_ID')   ## add column with activity name
  trn_y_df = join (trn_y_df, actlbl_df, by='Activity_ID')   ## add column with activity name
  
  colnames(features_df) <- c("ID","Feature_Nme")
  
  ##--------------------------------------------------------------------------
  ## Keep the mean() and std (standard deviations) columns from the X data frames 
  ## Create a logical vector with the grepl'ed (filtered) column names and 
  ## subset tst and trn x dataframes based on it
  ##---------------------------------------------------------------------------
  
  keep <- grepl ( "std|mean\\(\\)", features_df$Feature_Nme ) ### columns with 'std' or 'mean()'
  
  tst_x_df <- tst_x_df [keep] 
  trn_x_df <- trn_x_df [keep]
  
  ##-------------------------------------------------------
  ## Add Obs_ID to the data frames, used in the Join_all
  ##-------------------------------------------------------
  
  tst_x_df$Obs_ID <- rownames(tst_x_df)
  tst_y_df$Obs_ID <- rownames(tst_y_df)
  tst_sbjt_df$Obs_ID <- rownames(tst_sbjt_df)
  
  trn_x_df$Obs_ID <- rownames(trn_x_df)
  trn_y_df$Obs_ID <- rownames(trn_y_df)
  trn_sbjt_df$Obs_ID <- rownames(trn_sbjt_df)
  
  ##-----------------------------------------------------
  ## Join the training and test data frames 
  ## 1. create lists of the test and training data frames
  ## 2. create joined test and training data frames
  ##-----------------------------------------------------
  
  tst_df_list = list (tst_x_df, tst_y_df, tst_sbjt_df)
  trn_df_list = list (trn_x_df, trn_y_df, trn_sbjt_df)
        
  tst_joined_df = join_all (tst_df_list, by="Obs_ID")
  trn_joined_df = join_all (trn_df_list, by="Obs_ID")
  
  ##---------------------------------------------------------
  ## Combine test and training data sets into one dataframe
  ##---------------------------------------------------------
  
  complete_df <- rbind (tst_joined_df, trn_joined_df)
  
  ##----------------------------------------------------------------
  ## Determine of average for each variable by subject and activity
  ## Melt the complete_df - one row per observation, subject and activity
  ## then Dcast into the final df, taking the mean for each observation
  ## by subject and activity. 
  ##-----------------------------------------------------------------
  
  melt_df <- melt (complete_df, id.vars=c("Subject_ID","Activity_Nme"), measure.vars=seq(1:66))
  
  mean_act_subj_df <- dcast(melt_df, Subject_ID + Activity_Nme ~ variable, mean)
  
  ##------------------------------
  ## Write results to txt file 
  ##------------------------------
  
  if (!file.exists("assigment1")) {
    dir.create("assigment1")
  }
  
  write.table (mean_act_subj_df, "./assigment1/DSM_HAR_Summary.txt", row.name=FALSE)
  
}

############## E N D ##############


