# Johns Hopkins Data Science Coursera
# Course 4 Week 1
# Programming assignment 1: Exploratory Graphing
# Plot 1: Histogram of Global Active Power, Feb 1 and 2, 2007

library(readr)


fn <- 'household_power_consumption.txt' # note: this file ignored by git
ct <- list(col_date('%d/%m/%Y'), col_time('%H:%M:%S'), col_double(), col_double(), col_double(), col_double(), col_double(), col_double(), col_double())
my_data <- read_delim(fn, delim=';', col_names = T, col_types = ct, na='?')
my_subset <- subset(my_data, Date == '2007-02-01' | Date == '2007-02-02')

png('plot1.png')
hist(my_subset$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.off()
