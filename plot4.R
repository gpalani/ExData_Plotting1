##source("plot4.R")

plot4 <- function(){
  # Read the file from the local directory , use setwd() to set it
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

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Graph 1 : x axis = Week data(Thu,Fri,Sat) , y axis = Global active power 
plot(powerdf$Time, powerdf$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Graph 2 : x axis = Week data(Thu,Fri,Sat), y axis = Voltage
plot(powerdf$Time, powerdf$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
# Graph 3 : x axis = Week data(Thu,Fri,Sat), y axis = Sub meter 1,2 & 3 reading
plot(powerdf$Time, powerdf$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(powerdf$Time, powerdf$Sub_metering_2, col="red")
lines(powerdf$Time, powerdf$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)
# Graph 4 : x axis = Week data(Thu,Fri,Sat), y axis = Global reactive power

plot(powerdf$Time, powerdf$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(powerdf$Time, powerdf$Global_reactive_power)

dev.off()

}

