# Create a Tidy Dataset from the '_UCI HAR Dataset_'

The provided R-script 'run_analysis.R' reads all neccessary data Files within the RAW-DataFolder.
These are:

* UCI HAR Dataset//features.txt
* UCI HAR Dataset//activity_labels.txt
* UCI HAR Dataset//train//X_train.txt
* UCI HAR Dataset//train//y_train.txt
* UCI HAR Dataset//train//subject_train.txt
* UCI HAR Dataset//test//X_test.txt
* UCI HAR Dataset//test//y_test.txt
* UCI HAR Dataset//test//subject_test.txt

A combined dataset is created. This includes all data from the Training- and the Test-set. It also includes also three new columns described in the associated [CodeBook](./CodeBook.md])

