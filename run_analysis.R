# Reading the RAW Data
    
    # Read the Column Names for the Test / Training Sets
    colNames <- read.table("UCI HAR Dataset//features.txt", col.names=c("ColumnID", "ColumnName"))
    
    # Read the Labels for the Different Activities
    activityLabels <- read.table("UCI HAR Dataset//activity_labels.txt", col.names=c("ActivityID", "ActivityLabel"))
    
# Processing the 'Training-Set' of Data
{
    # Read the Training-Set and Naming the Columns according to the colNames
    trainingSet <- read.table("UCI HAR Dataset//train//X_train.txt")
    names(trainingSet) <- as.vector(colNames$ColumnName)

    # Read the subjects associated with each row of data
    trainingSubjects <- read.table("UCI HAR Dataset//train//subject_train.txt", col.names="SubjectID")

    # Read the subjects associated with each row of data and setting the Assctiated Activity-Name
    trainingActivities <- read.table("UCI HAR Dataset//train//y_train.txt", col.names="ActivityID")
    trainingActivities <- merge(trainingActivities, activityLabels)[,2]

    # Subselecting all *mean and *std columns and merging in all additional columns (activity-Type & SubjectID)
    colSelection <- grepl("mean\\(\\)", colNames$ColumnName) | grepl("std\\(\\)", colNames$ColumnName)
    trainingSubset <- cbind(DataSet="Training", Subject=trainingSubjects, Activity=trainingActivities, trainingSet[, colSelection])
    
    write.table(trainingSubset, "tidy_training.txt")
}
    
    
# Processing the 'Test-Set' of Data
{
    # Read the Training-Set and Naming the Columns according to the colNames
    testSet <- read.table("UCI HAR Dataset//test//X_test.txt")
    names(testSet) <- as.vector(colNames$ColumnName)
    
    # Read the subjects associated with each row of data
    testSubjects <- read.table("UCI HAR Dataset//test//subject_test.txt", col.names="SubjectID")
    
    # Read the subjects associated with each row of data and setting the Assctiated Activity-Name
    testActivities <- read.table("UCI HAR Dataset//test//y_test.txt", col.names="ActivityID")
    testActivities <- merge(testActivities, activityLabels)[,2]
    
    # Subselecting all *mean and *std columns and merging in all additional columns (activity-Type & SubjectID)
    colSelection <- grepl("mean\\(\\)", colNames$ColumnName) | grepl("std\\(\\)", colNames$ColumnName)
    testSubset <- cbind(DataSet="Test", Subject=testSubjects, Activity=testActivities, testSet[, colSelection])
    
    write.table(testSubset, "tidy_test.txt")
}
    
# merging the both data-sets with new IDs reflecting the origin of the data
trainingSubset <- cbind(DataSet=rep("Training", nrow(trainingSubset)), trainingSubset)
testSubset <- cbind(DataSet=rep("Test", nrow(testSubset)), testSubset)

#Combinig both subsets into one
mergedData <- rbind(trainingSubset, testSubset)
write.table(mergedData, "tidy_test_and_training.txt") 

# Creating additional dataset with the avereages for each activity within each subject (DataSet should not be averaged!)
averagesData <- aggregate(. ~ SubjectID + Activity - DataSet, data=mergedData, FUN=mean)
write.table(averagesData, "tidy_averages.txt") 
