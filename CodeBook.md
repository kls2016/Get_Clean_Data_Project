### CodeBook:

This CodeBook gives the different Variables in the Data Set.
In all the reading below, a variable starting with 't' indicates a time-domain measurement and a variable
starting with 'f' indicates it's frequency domain value after taking FFT (Fast Fourier Transform)

1. Subject_ID
The subject id number of the person who was used for the test

2. Activity
The "name" of the activity the subject carried out. There are 6 activities:
     WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING having values from 1 to 6 respectively

3. Activity_ID
This gives the values for each of the above activities form 1 to 6

4. tBodyAcc-Mean()-X, Y, Z
These give the mean() of the Body Acceleration, obtained after subtracting the gravity from the total acceleration
There are 3 variables/columns one each for X, Y and Z axis (direction). Each row of this
corresponds to a particular subject's (indicated by Subject_ID) specific activity (given by Activity)
Units: m/s^2

5. tBodyAcc-Std Dev()-X, Y, Z
This is similar to (4.) above, except that, here we measure the Standard Deviation of the Body Acceleration.

6. tGravityAcc-Mean()-X, Y, Z
This is the mean() of the Acceleration due to gravity. This subtracted from the Total Acceleration to obtain the
effective Body Acceleration. This is also given in all 3 directions and for each Subject for a specific activity
Units: m/s^2

7. tGravityAcc-Std Dev()-X, Y, Z
Gives the Standard Deviation of the Acceleration due to gravity. 

8. tBodyAccJerk-Mean()-X, Y, Z
The body linear acceleration and linear velocity were derived in time, to obtain these Jerk signals. These signals
are again in X, Y and Z directions. This variable gives the mean() of the Jerk signal.

9. tBodyAccJerk-Std Dev()-X, Y, Z
The Standard Deviation of the Jerk signal, again, as calculated above. 

10. tBodyGyro-Mean()-X, Y, Z
This gives the mean() of the Gyroscope reading, thus giving the angular component of the motion.
Units: rad/s

11. tBodyGyro-Std Dev()-X, Y, Z
Gives the Standard Deviation of the Gyro reading

12. tBodyGyroJerk-Mean()-X, Y, Z
Gives the mean() of the Jerk Signal in X, Y and Z directions

13. tBodyGyro-Std Dev()-X, Y, Z
Gives the Jerk signal reading in X, Y and Z directions

14. fBodyAcc-Mean()-X, Y, Z
The mean() of the frequency domain Acceleration. 

15. fBodyAcc-Std Dev()-X, Y, Z
The Standard Deviation of the frequency domain Acceleration. 

16. fBodyAcc-MeanFreq()-X, Y, Z
The Mean frequency of the freq domain data for the Body Acceleration.
Units: Hz

17. fBodyAccJerk-Mean()-X, Y, Z
The Mean of the freq domain data for the Jerk signals

18. fBodyAccJerk-Std Dev()-X, Y, Z
The Standard Deviattion of the Jerk signal in X, Y and Z directions

19. fBodyGyro-Mean()-X, Y, Z
The mean of the body gyro data in the freq domain

20. fBodyAccJerkMagnitude-MeanFreq()
The Magnitude of the mean freq of the Jerk Signal

