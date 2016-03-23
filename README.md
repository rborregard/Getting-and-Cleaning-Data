Getting and Cleaning Data Course Project
This file describes how run_analysis.R script works.

Step 1.   The script reads data for Training data, subject, and label.
          The script reads data for Test data, subject, and label
          The script joins the training and test data
          The script joins the training and test subjects
          The script joins the training and test labels

Step 2.   The script reads in the feature data
          The script scrapes the feature data and finds columns with mean and std
          The script gets the columns in the data file that have mean and std using this lookup
          
Step 3.   The script reads in the activity data
          The script lables/updates the codes to activity names
          
Step 4.   The script takes the subject data and labels subject names

Step 5.   Using the Dplyr function we are able to apply the mean function to the groups activity and subject
