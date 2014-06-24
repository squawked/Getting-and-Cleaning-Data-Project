Codebook
========

Data Source
-----------
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]



Tidy Data
----------
* Tidy file: HumanActivityRecognitionAverage.txt
* 180 observations, 68 variables
* The tidy data set contains the averages for the standard deviation and mean values from the data source.
* Variables from the original data source were renamed as the following:
    - mean()-X -> MeanX
    - mean()-Y -> MeanY
    - mean()-Z -> MeanZ
    - std()-X-> StdX
    - std()-Y-> StdY
    - std()-Z-> StdZ

Variable name    | Notes
-----------------|------------
SubjectID        | Subject Identifier from 1-30
ActivityName     | Activity name : Laying, Walking, Walking downstairs, Walking upstairs, Sitting, Standing
tBodyAccMeanX	|   The values in each of the columns  is the average value for each SubjectID and ActivityName  for this variable
tBodyAccMeanY	|
tBodyAccMeanZ	|
tGravityAccMeanX	|
tGravityAccMeanY	|
tGravityAccMeanZ	|
tBodyAccJerkMeanX	|
tBodyAccJerkMeanY	|
tBodyAccJerkMeanZ	|
tBodyGyroMeanX	|
tBodyGyroMeanY	|
tBodyGyroMeanZ	|
tBodyGyroJerkMeanX	|
tBodyGyroJerkMeanY	|
tBodyGyroJerkMeanZ	|
tBodyAccMagMean	|
tGravityAccMagMean	|
tBodyAccJerkMagMean	|
tBodyGyroMagMean	|
tBodyGyroJerkMagMean	|
fBodyAccMeanX	|
fBodyAccMeanY	|
fBodyAccMeanZ	|
fBodyAccJerkMeanX	|
fBodyAccJerkMeanY	|
fBodyAccJerkMeanZ	|
fBodyGyroMeanX	|
fBodyGyroMeanY	|
fBodyGyroMeanZ	|
fBodyAccMagMean	|
fBodyBodyAccJerkMagMean	|
fBodyBodyGyroMagMean	|
fBodyBodyGyroJerkMagMean	|
tBodyAccStdX	|
tBodyAccStdY	|
tBodyAccStdZ	|
tGravityAccStdX	|
tGravityAccStdY	|
tGravityAccStdZ	|
tBodyAccJerkStdX	|
tBodyAccJerkStdY	|
tBodyAccJerkStdZ	|
tBodyGyroStdX	|
tBodyGyroStdY	|
tBodyGyroStdZ	|
tBodyGyroJerkStdX	|
tBodyGyroJerkStdY	|
tBodyGyroJerkStdZ	|
tBodyAccMagStd	|
tGravityAccMagStd	|
tBodyAccJerkMagStd	|
tBodyGyroMagStd	|
tBodyGyroJerkMagStd	|
fBodyAccStdX	|
fBodyAccStdY	|
fBodyAccStdZ	|
fBodyAccJerkStdX	|
fBodyAccJerkStdY	|
fBodyAccJerkStdZ	|
fBodyGyroStdX	|
fBodyGyroStdY	|
fBodyGyroStdZ	|
fBodyAccMagStd	|
fBodyBodyAccJerkMagStd	|

### Description of script

1. Pre-requisites
  * library(data.table)
2. Get data
  * Download data
  * Unizip data
3. Read data
  * Read test, train, subject, activity and feature data
4. Merge data
  * Combine test, train, subject, activity data
    * resulting data set has 10299 observations and 563 variables
5. Get standard deviation and mean 
  * From the feature data, extract the standard deviation and mean column names
  * Extract the respective column values for the std deviation and mean columns from the combined data
    * The resulting data set has 10299 observations and 68 variables
6. Clean up the column names, removing parenthesis, minus characters
7. Calculate the averages for the standard deviation and mean by subject ID for each activity
  * resulting data set has 180 observatios and 68 variables.
8. Write tidy data set to 'HumanActivityRecognitionAverage.txt'

  




