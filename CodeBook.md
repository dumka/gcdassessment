# Sources
\test\X_test.txt
\train\X_train.txt
\test\Y_test.txt
\train\Y_train.txt
\features.txt
\activity_labels.txt
\train\subject_train.txt
\test\subject_test.txt

# Short desription
Data from ..._test.txt and ..._train.txt files are merged together and stored to ...res variables. xres is combined with yres by column. Column names are obtained from features.txt, row names - from activity_labels.txt (after binding by activityid that is obtained from yres). Subjects are obtained from subjectres. More information you can get from comments in run_analysis.R script.
