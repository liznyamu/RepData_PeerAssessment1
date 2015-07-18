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
activity_df <- tbl_df(activity)
numberOfRowNAs <- nrow(activity_df[!complete.cases(activity_df), ])

# 2)impute NA with 
