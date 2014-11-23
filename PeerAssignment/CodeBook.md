Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Create a conveneince function, which reads data from directory as data.frame
 2. Read X_train.txt, y_train.txt and subject_train.txt from the "./sumsung_data/train" folder and store them in *trainingData*.
 3. Read X_test.txt, y_test.txt and subject_test.txt from the "./sumsung_data/test" folder and store them in *testData*.
 3. Merge training and test data.
 4. Read the features.txt file from the "/sumsung_data" folder and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. 
 5. Merge training and test data.
 6. Extract mean and standard devitation columns form merged data using grep string.
 7. Add activity and subject columns to merged data.
 8. Read the activity_labels.txt file from the "./sumsung_data"" folder and update the activity labels.
 9. In the merged data append activity column as a factor.
 10. In the merged data append subject column as a factor.
 11. Aggregate joined data based on activity and subject.
 12.Remove the subject and activity column (we dont need mean of these cols)
 13. Write tidy data into  text file. 
 
