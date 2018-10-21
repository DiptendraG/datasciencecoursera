# datasciencecoursera
The program run_analysis.R performs the following steps:

Step 1:  Downloads the zipped file from the url provided (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Step 2:  The downloaded file is then unzipped in a folder called “Dataset”. 
28 txt files are then available for further analysis.

Step 3: Data from the  file x_train.txt is stored in a data frame “xtrain”

Step 4: Data from the file y_train.txt is stored in a data frame “ytrain”

Step 5: Data from the file subject_train.txt is stored in a data frame “subject_train”

Step 6: Data from the  file x_test.txt is stored in a data frame “xtest”

Step 7: Data from the file y_test.txt is stored in a data frame “ytest”

Step 8: Data from the file subject_test.txt is stored in a data frame “subject_test”

Step 9: Data from the file features.txt is stored in a data frame “features”

Step10:Data from the file activity_labels.txt is stored in a data frame “activity_labels”

Step11:Column Names are set for features, subject ID and activity ID for both Training and Test data

Step12:Merge the Training and Test data to form a common data set

Step13:Extract as a separate data frame “set4meanstd” only the measurements on the mean and standard deviation for each measurement.

Step14:Finally creates a second tidy data set (secTidySet) with the average of each variable for each activity and each subject
