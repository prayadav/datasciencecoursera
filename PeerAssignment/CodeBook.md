Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./sumsung_data/train" folder and store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./sumsung_data/test" folder and store them in *testData*, *testLabel* and *testsubject* variables respectively.  
 3. Read the features.txt file from the "/sumsung_data" folder and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. 
 4. Extract the columns on mean and standard deviationxtract 
 5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
 6. Merge Testing and Training data
 7. Read the activity_labels.txt file from the "./sumsung_data"" folder and update the activity labels.
 8. In the merged data append activity column as a factor.
 9. In the merged data append subject column as a factor.
 10. Aggregate joined data based on activity anf subject.
 11.Remove the subject and activity column (we dont need mean of these cols)
 12. Write tidy data into  text file. 
 
