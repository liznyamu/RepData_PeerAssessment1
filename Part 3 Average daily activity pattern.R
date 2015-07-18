##What is the average daily activity pattern?
#1) Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis)
# and the average number of steps taken, averaged across all days (y-axis)
#2) Which 5-minute interval, on average across all the days in the dataset,
# contains the maximum number of steps?

# with reference to https://class.coursera.org/repdata-036/forum/thread?thread_id=29
# 1) Calculate the mean of steps grouped by interval
activity_df <- tbl_df(activity) # Create a data frame tbl
timeSeriesSteps <- with(activity_df, tapply(steps, interval, mean, 
                                            na.rm = TRUE))
#optionA - with intervals -- chosen
plot(x = rownames(timeSeriesSteps), y = timeSeriesSteps, type = "l") ## interval values -  (0, 5, 10, ..., 2355)

#optionB - with sequence values
sequenceIntervals <- seq_along(timeSeriesSteps) 
plot(x = sequenceIntervals, y = timeSeriesSteps, type = "l") ## sequence (1, 2, 3,..., 288)

# 2) Which 5-minute interval, on average 
# across all the days in the dataset, 
# contains the maximum number of steps?
maxInterval <- names(which.max(timeSeriesSteps))
maxValue <- timeSeriesSteps[which.max(timeSeriesSteps)]
