

# Project for Data Cleaning
rm(list = ls())

dat_train = read.table("./train/X_train.txt", header = FALSE)
label_train = read.table("./train/y_train.txt", header = FALSE)  # 
sub_train = read.table("./train/subject_train.txt", header = FALSE) # subject index

dat_test = read.table("./test/X_test.txt",  header = FALSE)
label_test = read.table("./test/y_test.txt", header = FALSE)
sub_test = read.table("./test/subject_test.txt", header = FALSE)

feature = read.table("features.txt", header = FALSE) # used for column names 
act_label = read.table("activity_labels.txt", header = FALSE) # labels for activites


# Tasks:
#
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
# 5 From the data set in step 4, creates a second, independent tidy data 
#   set with the average of each variable for each activity and each subject.


# Preprocess
names(feature) = c("index", "names")
names(dat_train) = feature$names
names(dat_test) = feature$names

# Add the columns --- subjects, label --- to the training and testing data
dat_train2 = cbind(dat_train, sub_train, label_train)
dat_test2 = cbind(dat_test, sub_test, label_test)




# Task 1 
# 1 Merges the training and the test sets to create one data set.
# merge the revised training and testing data
dat_tot2 = rbind(dat_train2, dat_test2)
names(dat_tot2)[562:563] = c("subject","label")


# Task 2
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.

log_ind = grepl("mean", names(dat_tot2)) | grepl("std", names(dat_tot2)) |
          grepl("subject", names(dat_tot2)) | grepl("label", names(dat_tot2))

dat_tot3 = dat_tot2[log_ind]



# Task 3
# 3 Uses descriptive activity names to name the activities in the data set
colnames = colnames(dat_tot3)


colnames = gsub('^[t]', 'time', colnames)
colnames = gsub('^f', 'freq', colnames)
colnames = gsub('Acc', 'Acceleration', colnames)
colnames = gsub('Mag', 'Magnitude', colnames)


# Task 4
# 4 Appropriately labels the data set with descriptive variable names.

dat_tot3$label = factor(dat_tot3$label, labels = as.character(act_label[,2]))





# Task 5
# 5 From the data set in step 4, creates a second, independent tidy data 
#   set with the average of each variable for each activity and each subject.

agg_res = aggregate(x = dat_tot3[-(80:81)], by = dat_tot3[c("subject", "label")], FUN = 'mean')


write.table(agg_res, 'tidyData.txt', sep = '\t')

