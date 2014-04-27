# Initialization
library(reshape2)
xtest <- read.table(".\\test\\X_test.txt")
xtrain <- read.table(".\\train\\X_train.txt")
ytest <- read.table(".\\test\\Y_test.txt")
ytrain <- read.table(".\\train\\Y_train.txt")
feat <- read.table(".\\features.txt")
acts <- read.table(".\\activity_labels.txt")
subjecttrain <- read.table(".\\train\\subject_train.txt")
subjecttest <- read.table(".\\test\\subject_test.txt")
# Merge training and test sets
xres <- rbind(xtrain,xtest)
# Set features names
colnames(xres) <- feat[,2]
# Get mean and std columns.
xres <- xres[, grep("\\.*(mean|std)\\.*", names(xres) )]
# Set names for activity set
colnames(acts) <- c("id", "activityname")
# Merge activities with measurements
res <- cbind(yres, xres, sort=FALSE)
# Set column name
colnames(res)[1] <- "activityid"
# Form result set for subjects
subjectres <- rbind(subjecttrain,subjecttest)
# Merge subject with main set
res <- cbind(subjectres, res)
# Set column name
colnames(res)[1] <- "subjectid"
# Merge activities labels with main set
res <- merge(res, acts, by.x = "activityid", by.y = "id", all.x = TRUE, sort=FALSE)
# Grouping by subject and activity name.
res <- melt(res,id=c("subjectid", "activityname"))
res <- dcast(res, subjectid + activityname ~ variable, mean)
# Remove activityid column.
res <- res[, -which(names(res) == "activityid")]
# Save result
res
