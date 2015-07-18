##Imputing missing values

# Note that there are a number of days/intervals where there are missing values 
#  (coded as NA). The presence of missing days may introduce bias into some 
#  calculations or summaries of the data.

#1) Calculate and report the total number of missing values in the dataset 
#  (i.e. the total number of rows with NAs)

# Devise a strategy for filling in all of the missing values in the dataset. 
#  The strategy does not need to be sophisticated. For example, you could use 
#  the mean/median for that day, or the mean for that 5-minute interval, etc.

# Create a new dataset that is equal to the original dataset but with the
#  missing data filled in.

# Make a histogram of the total number of steps taken each day and Calculate 
#  and report the mean and median total number of steps taken per day.
#  Do these values differ from the estimates from the first part of the assignment?
#  What is the impact of imputing missing data on the estimates of the total 
#  daily number of steps?

#1) Calculate number of row with NA
# with reference to http://stackoverflow.com/questions/14369554/count-rows-of-a-data-frame-which-do-not-contain-na
# complete.cases takes a data frame and returns a data frame with the same columns
#   , but with all the rows which contain at least one NA thrown out.
suppressMessages(library(dplyr))
activity_df <- tbl_df(activity) # Create a data frame tbl.
numberOfRowNAs <- nrow(activity_df[!complete.cases(activity_df), ])

# 2)impute NA with prevously created means on intervals
#timeSeriesSteps <- with(activity_df, tapply(steps, interval, mean, 
#                                            na.rm = TRUE))
activityNAs <-  activity_df[!complete.cases(activity_df), ]
for(i in 1:numberOfRowNAs){
  activityNAs[i, "steps"] <- timeSeriesSteps[as.character(activityNAs[i, "interval"])]
}
## turn this into a sapply loop---

# 3) Create a new dataset that is equal to the original dataset but with the 
#  missing data filled in
## nonNA rows
activityNonNAs <-  activity_df[complete.cases(activity_df), ] 
# rbind with imputed NA dataset
activityImputed <- rbind(activityNAs, activityNonNAs)

# 4) Create a histogram of total steps per day , calculate the Mean and Median 
# total steps per day
#1a) total number of steps taken per day
suppressMessages(library(dplyr))
activityIm_df <- tbl_df(activityImputed) #Create a data frame tbl
# find sum/total steps over each day
imputedSumStepsByDay <- activityIm_df %>%
  group_by(date) %>% summarise(totalSteps = sum(steps))

#1b) Make a histogram of the total number of steps taken each day
with(imputedSumStepsByDay, hist(totalSteps))

#2) Mean and Median
options(digits=12)
# 2a) Get Mean - Total number of Steps (taken per day)
meanImputed <- mean(imputedSumStepsByDay$totalSteps, na.rm = TRUE)
# 2b) Get Median - Total number of Steps (taken per day)
medianImputed <- median(imputedSumStepsByDay$totalSteps, na.rm = TRUE)

##Do these values differ from the estimates from the first part 
# of the assignment? What is the impact of imputing missing data 
#on the estimates of the total daily number of steps?
## the mean is the same
## the median has slightly increased -- can calulate as a percentage change