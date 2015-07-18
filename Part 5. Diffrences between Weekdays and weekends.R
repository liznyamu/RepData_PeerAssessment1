## Are there differences in activity patterns between weekdays and weekends?

#1) For this part the weekdays() function may be of some help here. 
# Use the dataset with the filled-in missing values for this part.

# 2) Create a new factor variable in the dataset with two levels – 
# “weekday” and “weekend” indicating whether a given date is a weekday or weekend
# day.

# 3) Make a panel plot containing a time series plot (i.e. type = "l") 
# of the 5-minute interval (x-axis) and the average number of steps taken, 
#averaged across all weekday days or weekend days (y-axis). 
#See the README file in the GitHub repository to see an example of what this 
# plot should look like using simulated data.

# 1)using the imputed data.frame - activityIm_df

# 2a) using the weekdays() function - Create a new factor variable in the 
#  dataset with two levels – “weekday” and “weekend”
dayOfWeek <- sapply(activityIm_df$date, weekdays) #identify day of Week
weekdayTF <- sapply(dayOfWeek, 
                    function(x) 
                     if(x %in% c("Saturday", "Sunday")) "weekend" 
                     else "weekday") # identify day of Week as "weekday" or "weekend"
activityIm_df$dayType <- as.factor(weekdayTF) # create a factor variable

# 3a) create a timeseries grouped on interval and dayType for steps
intervalDayType <- aggregate(steps ~ interval + dayType, 
                                    data = activityIm_df, mean)

# 3b) plot the time series  -- test with ggplot
library(lattice)
xyplot(steps ~ interval | dayType, intervalDayType, 
       type = "l", layout = c(1, 2), 
       xlab = "Interval", ylab = "Number of steps")
