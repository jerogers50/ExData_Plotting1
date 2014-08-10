# Read electric power consumption data into R
# Correctly format Date column
EPC<-read.csv2("household_power_consumption.txt", header = TRUE, sep = ";")
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

# Subset data in Date column to range between 2007-02-01 and 2007-02-02
data <- subset(EPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Change class of Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# Name each of the plot files as plot1.png, plot2.png, etc.
png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
