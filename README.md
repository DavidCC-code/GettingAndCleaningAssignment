---
title: "Getting and cleaning programming assignment"
author: "David Contreras Carretero"
date: "24/7/2020"
output: html_document
---

This repo contains a programming assingment for the course _"Getting and Cleaning Data"_  for the  _"Data Science Program"_ by John Hopkins University thourgh Coursera. Instructors Jeff Leek,PhD; Roger D. Peng, PhD; Brian Caffo, PhD.

The assigment is to deliver one tidy data sets derived from "Human Activity Recognition Using Samrtphons Data Set" [1], and the scipts that perform the transformations.

The  data set should contain tidy information for each subject and activity on the mean and standard deviation calculated in the original data set for the different variables, the new data set shoud summarize average from each subject, activity and measurement.

Original data set and information about it:

[Human Activity Recognition Using Smartphones data set info](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Human Activity Recognition Using Smartphones data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


__Contents:__
---
  * __README.md:__          This file.
  
  * __CodeBook.md:__        Output data sets description.
  
  * __run_analysis.R:__     Main script wich will call subseqüent scripts to get the task done. The scripts are called in the
                            same orther as that list. 
                            
  * __subjects.R:__         Gets test and train subjects into the dataset keeping the order of observations.  
    * _Input:_ 
      - ./UCI HAR Dataset/train/subject_train.txt   
      - ./UCI HAR Dataset/test/subject_test.txt  
    * _Output:_  Temporary  data frame called "subjects" loaded into the R enviroment.  
    
                            
  * __activities.R:__       Creates a temporary data frame called "activity" containing descriptive name of the activity                                     performed by the subject. Uses the names provided by the original data set.  
    * _Input:_  
      - ./UCI HAR Dataset/train/y_train.txt  
      - ./UCI HAR Dataset/test/y_test.txt  
      - ./UCI HAR Dataset/activity_labels.txt
    * _Output:_   Temporary  data frame called "activity" loaded into the R enviroment.             
                            
  * __mean_std_var_data.R:__ Creates temporary data set contining the measurement on mean and standard deviation on each measurment.
    * _Input:_
      - ./UCI HAR Dataset/train/X_train.txt  
      - ./UCI HAR Dataset/test/X_test.txt  
      - ./UCI HAR Dataset/features.txt  
    * _Output:_   Temporary  data frame called "mean_std" loaded into the R enviroment.    
                            
  * __tidydataset.R:__     Bind together all 3 temporary data frame into one and transform it to be understandable a ready to perform the later summariztion to get the final requested output. 
    * _Input:_ 
      - "subject" data frame from enviroment.  
      - "activity" data frame from enviroment.  
      - "mean_std" data frame from enviroment.
      - *_Output:_ Temporary data frame called "tidyDataSet" loaded into the R enviroment and written to working directory as "./tidyDataSet.txt" .    
                            
  * __avgtidydataset.R:__   Creates the second requested tidy data set summarizing from "tidyDataSet". IT groups by all columns except values and summirize usign mean function, dataset avgTidyDataSet cotains 1 row * subject * measurment * measurement_type * function * axis(when there's measurement for each one of three axies), that's 696 rows per subject, total 11880 rows.

    * _Input:_  tidyDataSet from R environment
    * _Output:_ Dataset avgTidyDataSet cotaining 1 row * subject * measurment * measurement_type * function * axis(when there's measurement for each one of three axes), that's 696 rows per subject, total 11880 rows. Outputs to R enviroment and writes to file in working directory as "./avgTidyDataSet"
                       
                        
__Script Use:__
---

Download the original data set and unzip it to your working directory. It will create the directory "./UCI HAR Data set"

Source the main script "run_analysis.R" it will run all the scripts. 

__Script output:__
---
Data set in your R enviroment ready to work with, avgTidyDataSet.
Data set written to a text file in your working directori ./avgTidyDataSet.txt.


__Uses:__
The script will try to load the following libraries, you'll need to have them intalled.

library(plyr)  
library(dplyr)  
library(stringr)  
library(tidyr)  


[1] _Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_