# Johns Hopkins Data Science Coursera
# Course 4 Week 1
# Programming assignment 1: Exploratory Graphing
# Plot 4: Combined Plot, Feb 1 and 2, 2007

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

png('plot4.png')

# set up plot framework
par(mfrow=c(2,2))

# Global Active Power
plot(my_subset$Global_active_power ~ my_subset$dt, type='s', xlim=c(x_min, x_max), 
     xlab='', ylab='Global Active Power')

# Voltage
plot(my_subset$Voltage ~ my_subset$dt, type='s', xlim=c(x_min, x_max), 
     xlab='datetime', ylab='Voltage')

# Energy Sub Metering
plot(my_subset$Sub_metering_1 ~ my_subset$dt, type='l', xlim=c(x_min, x_max), 
     xlab='', ylab='Energy Sub Metering')
points(my_subset$Sub_metering_2 ~ my_subset$dt, type='l', col='red')
points(my_subset$Sub_metering_3 ~ my_subset$dt, type='l', col='blue')
legend('topright', lty=c(1,1,1), pch=c(NA,NA,NA), col=c('black', 'red', 'blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n')

# Global Reactive Power
plot(my_subset$Global_reactive_power ~ my_subset$dt, type='s', xlim=c(x_min, x_max), 
     xlab='datetime', ylab='Global_reactive_power')

dev.off()

