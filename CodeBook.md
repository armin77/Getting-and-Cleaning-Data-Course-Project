# CodeBook

## Content Description of RAW-Files from the _UCI HAR Dataset_

### Folder _'UHC HAR Dataset'_
* __activity_labels.txt__: ID and associated label for the activities which the subjects performed 
* __features.txt__: ColumnID and associated column Labels for the test- & tainingsets (_including the already processed Data within the 'Inertial Signals' Folders_)
* __README.txt__: 
* __features_info.txt__:

### Folders _'UHC HAR Dataset/test'_ and _'UHC HAR Dataset/train'_
* Folder __'Inertial Signals'__: Contains the processed data from the authors of the study used in their paper
* __X\_[test|train].txt__: 561 columns of floating numbers in the range of [-1 to 1]. The column are ordered 1..561 according to the ColumnNames provided in _features.txt_ 
* __y\_[test|train].txt__: integer which reflects the activity type the subjec carried out.
* __subject\_[test|train].txt__: integer that stands for the Subject providing the data.

## Subsetting the data
As required the data has to be subsetted to only include the measurements on the mean and standard deviation for each measurement.

Afterwards the subsetted data is combined into a whole dataset.
Therefore three new columns are introduced:

* __DataSet__ is introduced which states the origin of the data (Test or Training)
* An other new column is __Activity__ wich describes the activity that was carried out. (_with Levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING_)
* The third new Column is __Subject__ which reflects the subjectID that carried out the activity

## Averaging the Data
A new Tidy-Dataset is created which includes the averages for each feature-column over each subject and each of its activity.