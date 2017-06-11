#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#define layout and open device
png("plot4.png")
par(mfrow = c(2,2))

#Global Active Power plot
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#Voltage plot
plot(datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#Energy sub metering plot
plot(datetime, data$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "n")
lines(datetime, data$Sub_metering_1, col = 'black')
lines(datetime, data$Sub_metering_2, col = 'red')
lines(datetime, data$Sub_metering_3, col = 'blue')

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 'solid', bty = "n")

#Global reactive Power plot
plot(datetime, data$Global_reactive_power, xlab = "datetime", ylab = "Global reactive power (kilowatts)", type = "l")

#close device
dev.off()
