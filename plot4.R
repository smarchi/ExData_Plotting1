#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#define layout and open device
png("plot4.png")
par(mfrow = c(2,2))

#Global Active Power plot
x <- seq_along(data$Global_active_power)
plot(x, data$Global_active_power, xaxt = "n", yaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(x, data$Global_active_power)
axis(side = 2, at = seq(0,6,2))
axis(side = 1, at = c(1,median(x),length(x)+1), label=c("Thu","Fri","Sat"))

#Voltage plot
x <- seq_along(data$Voltage)
plot(x, data$Voltage, xaxt = "n", yaxt = "n", xlab = "datetime", ylab = "Voltage", type = "n")
lines(x, data$Voltage)
axis(side = 2, at = seq(234,246,4))
axis(side = 1, at = c(1,median(x),length(x)+1), label=c("Thu","Fri","Sat"))

#Energy sub metering plot
x <- seq_along(data$Sub_metering_1)
plot(x, data$Sub_metering_1, xaxt = "n", yaxt = "n", xlab = "", ylab = "Energy sub metering", type = "n")

lines(seq_along(data$Sub_metering_1), data$Sub_metering_1, col = 'black')
lines(seq_along(data$Sub_metering_2), data$Sub_metering_2, col = 'red')
lines(seq_along(data$Sub_metering_3), data$Sub_metering_3, col = 'blue')

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 'solid', bty = "n")

axis(side = 2, at = seq(0,30,10))
axis(side = 1, at = c(1,median(x),length(x)+1), label=c("Thu","Fri","Sat"))

#Global reactive Power plot
x <- seq_along(data$Global_reactive_power)
plot(x, data$Global_reactive_power, xaxt = "n", yaxt = "n", xlab = "datetime", ylab = "Global reactive power (kilowatts)", type = "n")
lines(x, data$Global_reactive_power)
axis(side = 2, at = seq(0.0,0.5,0.1))
axis(side = 1, at = c(1,median(x),length(x)+1), label=c("Thu","Fri","Sat"))

#close device
dev.off()
