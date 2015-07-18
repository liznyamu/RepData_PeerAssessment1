## Loading and preprocessing the data
#Show any code that is needed to
#1) Load the data (i.e. read.csv())
#2) Process/transform the data (if necessary) into a format suitable for your analysis

setwd("/home/cel00586/projAss1Data/RepData_PeerAssessment1")
# 1a) unzip the data
unzip("activity.zip")
# 1b) read data into R
activity <- read.csv("activity.csv", stringsAsFactors = F)

# 2) change the "date" column to date class 
activity$date <- as.Date(activity$date)


