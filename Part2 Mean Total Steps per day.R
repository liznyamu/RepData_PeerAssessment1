## What is mean of , total number of steps taken per day?
#1)For this part of the assignment, you can ignore the missing values in the dataset.
#Make a histogram of the total number of steps taken each day
#Calculate and report the mean and median total number of steps taken per day

#1a) total number of steps taken per day
suppressMessages(library(dplyr))
activity_df <- tbl_df(activity) #Create a data frame tbl
# find sum/total steps over each day
sumStepByDay <- activity_df %>%
  group_by(date) %>% summarise(totalSteps = sum(steps))

#1b) Make a histogram of the total number of steps taken each day
with(sumStepByDay, hist(totalSteps))

#2) Mean and Median
options(digits=12)
# 2a) Get Mean - Total number of Steps (taken per day)
meanTotals <- mean(sumStepByDay$totalSteps, na.rm = TRUE)
# 2b) Get Median - Total number of Steps (taken per day)
medianTotals <- median(sumStepByDay$totalSteps, na.rm = TRUE)