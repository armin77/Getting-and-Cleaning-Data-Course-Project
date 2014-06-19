# Create a Tidy Dataset from the '_UCI HAR Dataset_'

# Getting the Data
the following link provides the dataset used in this analysis:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
After downloading the data needs to be unzipped. this can be done via the terminal command: <code>unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip</code>
This creates a folder containing all the RAW-Files and the associated Descriptions.

# Running the Script
The Script relies on the RAW-Datafolder to __be present__ and named __UCI HAR Dataset__

The provided R-script __'run_analysis.R'__ reads all neccessary data Files within the RAW-DataFolder.
These are:

* UCI HAR Dataset//features.txt
* UCI HAR Dataset//activity_labels.txt
* UCI HAR Dataset//train//X_train.txt
* UCI HAR Dataset//train//y_train.txt
* UCI HAR Dataset//train//subject_train.txt
* UCI HAR Dataset//test//X_test.txt
* UCI HAR Dataset//test//y_test.txt
* UCI HAR Dataset//test//subject_test.txt

A combined dataset is created (named __tidy_test_and_training.txt__). This includes all data from the Training- and the Test-set. It also includes also three new columns described in the associated [CodeBook](./CodeBook.md])

A second dataset is created containing the averages for each column for the subjects and their activities. (named __tidy_averages.txt__)

