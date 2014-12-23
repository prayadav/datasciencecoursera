
# Convenience function to read file and return a data frame

read_data_asTable <- function(dest_file_loc,location="./samsung_data/"){
  data = paste(location,dest_file_loc,sep="")
  read.table(data)
}

# Reading Training data
trainingData <- read_data_asTable("train/X_train.txt")
trainingData[,562] <- read_data_asTable("train/Y_train.txt")
trainingData[,563] <- read_data_asTable("train/subject_train.txt")


#  Reads TestData and TestLabel and store them in respective variables.

testData <- read_data_asTable("test/X_test.txt")
testData[,562] <- read_data_asTable("test/Y_test.txt")
testData[,563] <- read_data_asTable("test/subject_test.txt")
testLabel <- read_data_asTable("test/y_test.txt") 

#Merge Training and Test data
joinData <- rbind(trainingData, testData)

# read activity labels
activityLabel <- read_data_asTable("activity_labels.txt")


# Step2. Extracts  the mean and standard deviation for each measurement.
#Read features
features <- read_data_asTable("features.txt")

features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#Join mean and standard deviation
joinData <- rbind(trainingData, testData)

# Extract the columns on mean and standard deviation

mean_And_Std <- grep(".*Mean.*|.*Std.*", features[,2])
#reduce features to ones only containing grep string
features <- features[mean_And_Std,]
# add subject and activity columns
mean_And_Std <- c(mean_And_Std,562,563)

joinData <- joinData[,mean_And_Std]
# Add the column names (features) to merged data
colnames(joinData) <- c(features$V2, "Activity", "Subject")
colnames(joinData) <- tolower(colnames(joinData))

# set the matching activity labels
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  joinData$activity <- gsub(currentActivity, currentActivityLabel, joinData$activity)
  currentActivity <- currentActivity + 1
}
# Transform activity and subject as factors
joinData$activity <- as.factor(joinData$activity)
joinData$subject <- as.factor(joinData$subject)


tidy_data = aggregate(joinData, by=list(activity = joinData$activity, subject=joinData$subject), mean)
# Remove the subject and activity column (we dont need mean of these cols)
tidy_data[,90] = NULL
tidy_data[,89] = NULL
write.table(tidy, "tidy_data.txt", sep="\t")
