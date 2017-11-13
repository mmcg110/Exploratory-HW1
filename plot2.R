#### Exploratory Data Analysis - Week 1 HW

## 1. Download the Data. BE SURE TO UPDATE THE "directory" OBJECT BELOW WITH LOCAL LOCATION OF "UCI Electric Power Consumption" DATASET

library(tidyr)
directory <- "C:/Users/mike.mcgroddy/Desktop/Coursera/Stats with R/Exploratory Data/Week 1/HW1"
setwd(directory)

##2. Load the data into R. Read first 100,000 lines which contain data for the desired dates.  Convert Date column to date format and subset for desired dates 2007-02-02 and 2007-02-03

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 100000)
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
data2 <- subset(data1, (Date > "2007-01-31") & (Date < "2007-02-03"))

##3. Generate Plot2. Create a "Date_time" column using "strptime" to convert to date format. Convert "Global Active Power" variable to numeric for plotting. Generate plot and save as PNG

data3 <- unite(data2, "Date_time", Date, Time)
data3$Date_time <- strptime(data3$Date_time, format = "%Y-%m-%d_%H:%M:%S")
data3$Global_active_power <- as.numeric(data3$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)

plot(data3$Date_time, data3$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(data3$Date_time, data3$Global_active_power)

dev.off()
