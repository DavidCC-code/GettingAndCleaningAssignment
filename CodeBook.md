---
title: "Code book"
author: "David Contreras Carretero"
date: "24/7/2020"
output: html_document
---

# Original data set

The original is "Human Activity Recognition Using Samrtphons Data Set" [1]


http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

# Output data sets

## Data set: __tidyDataSet__

  * __subject__: Test subject identifier, numeric. Values from 1 to 30. Direct from the originaldata set no transformation required. In the original data set subjects were split into file (train and test) and where sorted to match their corresponding measurments. So the only thing to do was append test file to train file keeping the original order.
  
  * __activity__: Descriptive name of the activity measured. Possible values:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
    
    The original data set had also two files (train and test) containing a sorted list of the activity measured, supossedly sorted in the order that the measurment were taken, but they were codified as numeric. The original data set had a file linking activity codes (labels) and description. So I  joined both files to get the sorted list of activity descriptions.
    
    

  
  