## source("plot1.R")
plot1 <- function(){


## Read the file from the local directory , use setwd() to set it
data_filename <- "./household_power_consumption.txt"
powerdf <- read.table(data_filename,
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")

# convert date and time variables to Date/Time class
powerdf$Time <- strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")
powerdf$Date <- as.Date(powerdf$Date, "%d/%m/%Y")

# only use data from the dates 2007-02-01 and 2007-02-02
date_range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
powerdf <- subset(powerdf, Date %in% date_range)

## set the device to png to write the plot to the PNG file
png("plot1.png", width=480, height=480)

## hist draws the histogram 
hist(powerdf$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
}
