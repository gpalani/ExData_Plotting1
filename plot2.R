## source("plot2.R")

plot2 <- function(){


  ## Read the file from the local directory , use setwd() to set it to working directory
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
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  powerdf <- subset(powerdf, Date %in% dates)
  
  ## set the device to png to write the plot to the PNG file

  png("plot2.png", width=480, height=480)

## type = "l" for lines work on the subset data with time on x axis and power on the y axis

plot(powerdf$Time, powerdf$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
}

