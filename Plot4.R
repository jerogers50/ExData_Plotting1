# Read electric power consumption data into R
# Correctly format Date column
EPC<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

# Subset data in Date column to range between 2007-02-01 and 2007-02-02 
data <- subset(EPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Join data from Date and Time columns into new column
# Change class of new column to date/time
# Change class of Global_active_power to numeric
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
data$Global_active_power <- as.numeric(data$Global_active_power)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# Name each of the plot files as plot1.png, plot2.png, etc.
png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(Datetime, Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(Datetime, Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Datetime, Sub_metering_2,col='Red')
  lines(Datetime, Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Datetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()