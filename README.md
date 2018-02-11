### README.md

### Basic Idea
The basic idea is to take the given dataset and create a new tidy data setn, renaming a few variable names to be
more meaningful, along the say
For this, zip file is downloaded offline and unzipped on a local folder
This has 2 major data sets, the Training and Test data sets
It also has the Subject information (subjects used in test) and the different activity lables

### what is done by the code
First, the activity lables and, Subject information and the actual Training data set are merged
The above activity is done with the Test data set also

Meaningful column headings are given to the columns of the Activity Labels and Subject information data sets

Post this, the Training and Test Data tables are merged to obtain the first output reqiured
This merging is done by rbind(). I tried merge(), but it seemed to hang and was not able to load 28 MB, it said.
Due to this, I used rbind()

### Obtain only the Mean and Std Dev data
Now, the columns, Activity ID, Subject ID and all the columns containing the mean the Std Deviation are are extracted using 
a combination of grepl() and merged_training_test[, mean_std_cols == TRUE]. This gives the mean_std_set.

Now, in order to label the Activity ID properly, the mean_std_set and the acitivity_labels set are both merged
with the Activity_ID being the unique key.

### Create and write a tidy dataset from the above
First, the tidy data set, as per the requirements, is obtained from the mean_std_set_with_labels. The Activity_ID, 
the Subject_ID and the mean and std dev set with labels, are "aggregrated" using the aggregate() function

Then, names of some of the columns, which need change to be more meaningful, is done.
This data set is finally written to the file, "tidyDataSet.txt.

### Some doubts/anomalies
The code also contains the following:

1. Comments describing what a particular portion of code does
2. A number of commented lines of code, that I tried out to achieve the different requirements, but did not work.
   I have purposefully lef them there, so that the reviewer could, if he has time, give any help on why they did
   not work
