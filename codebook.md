#Codebook

This code book describes the data, the variables and the transformations performed to clean and tidy up the data.

### Source data

The original dataset is the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

It consists of a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

[More information here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Transformations

The script `run_analysis.R` downloads and extracts the data, and does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Generate a file with the tidy data named `uci_har_means_tidy.txt`.


### Variables

The following is a list of the variables in the tidy dataset:

*	1	subjectId
*	2	activityId
*	3	activityDescription
*	4	timeBodyAcc-mean-X
*	5	timeBodyAcc-mean-Y
*	6	timeBodyAcc-mean-Z
*	7	timeBodyAcc-std-X
*	8	timeBodyAcc-std-Y
*	9	timeBodyAcc-std-Z
*	10	timeGravityAcc-mean-X
*	11	timeGravityAcc-mean-Y
*	12	timeGravityAcc-mean-Z
*	13	timeGravityAcc-std-X
*	14	timeGravityAcc-std-Y
*	15	timeGravityAcc-std-Z
*	16	timeBodyAccJerk-mean-X
*	17	timeBodyAccJerk-mean-Y
*	18	timeBodyAccJerk-mean-Z
*	19	timeBodyAccJerk-std-X
*	20	timeBodyAccJerk-std-Y
*	21	timeBodyAccJerk-std-Z
*	22	timeBodyGyro-mean-X
*	23	timeBodyGyro-mean-Y
*	24	timeBodyGyro-mean-Z
*	25	timeBodyGyro-std-X
*	26	timeBodyGyro-std-Y
*	27	timeBodyGyro-std-Z
*	28	timeBodyGyroJerk-mean-X
*	29	timeBodyGyroJerk-mean-Y
*	30	timeBodyGyroJerk-mean-Z
*	31	timeBodyGyroJerk-std-X
*	32	timeBodyGyroJerk-std-Y
*	33	timeBodyGyroJerk-std-Z
*	34	timeBodyAccMag-mean
*	35	timeBodyAccMag-std
*	36	timeGravityAccMag-mean
*	37	timeGravityAccMag-std
*	38	timeBodyAccJerkMag-mean
*	39	timeBodyAccJerkMag-std
*	40	timeBodyGyroMag-mean
*	41	timeBodyGyroMag-std
*	42	timeBodyGyroJerkMag-mean
*	43	timeBodyGyroJerkMag-std
*	44	functionBodyAcc-mean-X
*	45	functionBodyAcc-mean-Y
*	46	functionBodyAcc-mean-Z
*	47	functionBodyAcc-std-X
*	48	functionBodyAcc-std-Y
*	49	functionBodyAcc-std-Z
*	50	functionBodyAccJerk-mean-X
*	51	functionBodyAccJerk-mean-Y
*	52	functionBodyAccJerk-mean-Z
*	53	functionBodyAccJerk-std-X
*	54	functionBodyAccJerk-std-Y
*	55	functionBodyAccJerk-std-Z
*	56	functionBodyGyro-mean-X
*	57	functionBodyGyro-mean-Y
*	58	functionBodyGyro-mean-Z
*	59	functionBodyGyro-std-X
*	60	functionBodyGyro-std-Y
*	61	functionBodyGyro-std-Z
*	62	functionBodyAccMag-mean
*	63	functionBodyAccMag-std
*	64	functionBodyBodyAccJerkMag-mean
*	65	functionBodyBodyAccJerkMag-std
*	66	functionBodyBodyGyroMag-mean
*	67	functionBodyBodyGyroMag-std
*	68	functionBodyBodyGyroJerkMag-mean
*	69	functionBodyBodyGyroJerkMag-std

### Variables description

*subjectId* is an identifier of the subject who carried out the experiment.

*activityId* and *activityDescription* represent the activity performed by the participants (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS).

The remaining variables are the average of each original variable, grouped by activity and subject.


### Description of the original variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the prefix 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:
* mean(): Mean value
* std(): Standard deviation

[Description of the original dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
