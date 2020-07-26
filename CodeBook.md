---
title: "Code book"
author: "David Contreras Carretero"
date: "24/7/2020"
output: html_document
---

# Original data set

Original data set:  "Human Activity Recognition Using Samrtphons Data Set" [1]

You can find it and all the information about it in the links below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


[1] _Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_

# Output data set

## Data set: __avgTidyDataSet__

Is an assigment requirment to deliver a tidy data set containing the average measurements (only for means and standard deviations) for each subject and activity. So this data set contains a row per each subject, activity and measurement. 

This dataset is derived from  a temporary data set named "tiydDataSet" by grouping by subject, activity, measurement, measurement_type, func and axis, and summarizing using  mean()

  * __subject__: Test subject identifier, numeric. Values from 1 to 30. Direct from the originaldata set no transformation required. In the original data set subjects were split into file (train and test) and where sorted to match their corresponding measurments. So the only thing to do was append test file to train file keeping the original order.
  
  * __activity__: Descriptive name of the activity measured. Possible values:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
    
    The original data set had also two files (train and test) containing a sorted list of the activity measured, supossedly sorted in the order that the measurment were taken, but they were codified as numeric. The original data set has a file linking activity codes (labels) and description. So I  joined both files to get the list of activity descriptions keeping the order of the labels.
    
  
  * __measurment__: Each basic measurment taken in the original data set,  as described in  /UCI HAR Dataset/features_info.txt, there are 17 basic measurment:
  
      * tBodyAcc-XYZ
      * tGravityAcc-XYZ
      * tBodyAccJerk-XYZ
      * tBodyGyro-XYZ
      * tBodyGyroJerk-XYZ
      * tBodyAccMag
      * tGravityAccMag
      * tBodyAccJerkMag
      * tBodyGyroMag
      * tBodyGyroJerkMag
      * fBodyAcc-XYZ
      * fBodyAccJerk-XYZ
      * fBodyGyro-XYZ
      * fBodyAccMag
      * fBodyAccJerkMag
      * fBodyGyroMag
      * fBodyGyroJerkMag
      
Those with the sufix XYZ are actually one measurement for each axis. Upon those basic measurements the original dataset caculates a serie of variables applying different functions, 561 variables in total, as per assignment requirement I keep those corresponding to mean() and std() function (66 observations). 

Among these 17 basic measurements there are 10 with the prefix "t" and 7 with prefix "f".

In these column I keep only the measurement name without prefixes nor sufixes, it makes it 10 different values:
      * bodyacc
      * gravityacc
      * bodyaccjerk
      * bodygyro
      * bodygyrojerk
      * bodyaccmag
      * gravityaccmag
      * bodyaccjerkmag
      * bodygyromag
      * bodygyrojerkmag

If the aim where to built a relational database it could be broken down further, starting with two big categories regarding 
the origin of the measurment acceleroment o gyroscope ("Acc" /"Gyro"), but for  the porpouse of the assignment I dont't think it would facilitate the analisis.

  * __measurement_type__: Here I keep the prefix "t" or "f"  as "time" and "frequency" respectively. This variables allow to 
the subsequent analists to easily study each type.
    
  * __func__:  "mean" or "std", as explained above, is an assigment requierment to keep only mean and standar deviation measurements from the original data set. Originaly function where part of the variables names as a suffix. As each relevant observation would be either mean or std I created this new variable.
  
  * __axis__: values "x","y","z" or NA. 5 of the basic measurments are taken in each of the axes for the rest which are not axis realated the value is NA.
  
  * __mean__: average of the actual a measurements as they where in the original data set.
  
  

  
  