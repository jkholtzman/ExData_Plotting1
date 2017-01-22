# Johns Hopkins Data Science Coursera
# Course 4 Week 1
# Programming assignment 1: Exploratory Graphing
# Plot 2: Time Based Utilization of Global Active Power, Feb 1 and 2, 2007

library(readr)
library(lubridate)

fn <- 'household_power_consumption.txt' # note: this file ignored by git
ct <- list(col_character(), col_character(), col_double(), col_double(), col_double(), col_double(), col_double(), col_double(), col_double())
my_data <- read_delim(fn, delim=';', col_names = T, col_types = ct, na='?')
my_data$dt <- dmy_hms(paste(my_data$Date, my_data$Time))

# the directions say to use data from 2007-02-01 and 02
# however, to get the graph timescale to match that in the assignment,
# had to shift the timescale left by 6 hours
x_min <- as.POSIXct('2007-01-31 18:00:00', format = '%Y-%m-%d %H:%M:%S')
x_max <- as.POSIXct('2007-02-02 18:00:00', format = '%Y-%m-%d %H:%M:%S')
my_subset <- subset(my_data, dt >= x_min & dt < x_max)

png('plot2.png')
plot(my_subset$Global_active_power ~ my_subset$dt, type='s', xlim=c(x_min, x_max), 
     xlab='', ylab='Global Active Power (kilowatts)')
dev.off()



