# Download Zip file from the given URL and unzip files in a folder
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "Dataset.zip")
unzip(zipfile = "Dataset.zip",exdir = "Dataset")
list.files(path = "/Users/diptendraghanti/Dataset")
pathdata = file.path("/Users/diptendraghanti/Dataset","UCI HAR Dataset")
files = list.files(pathdata, recursive = TRUE)
# Read Training Data
xtrain = read.table(file.path(pathdata,"train","X_train.txt"), header = FALSE)
ytrain = read.table(file.path(pathdata,"train","y_train.txt"), header = FALSE)
subject_train = read.table(file.path(pathdata,"train","subject_train.txt"), header = FALSE)
# Read Test Data
xtest = read.table(file.path(pathdata,"test","X_test.txt"), header = FALSE)
ytest = read.table(file.path(pathdata,"test","y_test.txt"), header = FALSE)
subject_test = read.table(file.path(pathdata,"test","subject_test.txt"), header = FALSE)
# Read features
features = read.table(file.path(pathdata,"features.txt"), header = FALSE)
# Read Activity
activity_labels = read.table(file.path(pathdata,"activity_labels.txt"), header = FALSE)
# Setting Column header for Training Data
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"
# Setting Column header for Activity Data
colnames(activity_labels) <- c("activityId","activityType")
# Merge Training Data
merge_train = cbind(ytrain,subject_train,xtrain)
# Setting Column header for Test Data
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"
# Setting Column header for Activity Data
colnames(activity_labels) <- c("activityId","activityType")
# Merge Test Data
merge_test = cbind(ytest,subject_test,xtest)
# Merge Training & Test Data into single data set
allmerge = rbind(merge_train,merge_test)
colNames = colnames(allmerge) 
meanstd = (grepl("activityId",colNames)|grepl("subjectId",colNames)|grepl("mean..",colNames)|grepl("std..",colNames))
set4meanstd <- allmerge[,meanstd == TRUE]
set_activityname = merge(set4meanstd, activity_labels, by = "activityId",all.x = TRUE)
secTidySet <- aggregate (. ~subjectId + activityId, set_activityname, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId,secTidySet$activityId),]
write.table(secTidySet,"secTidySet.txt",row.names = FALSE)