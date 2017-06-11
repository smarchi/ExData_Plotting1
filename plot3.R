#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#Construct the plot
png(filename = "plot3.png")
plot(datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")

#lines for each submetering column
lines(datetime, data$Sub_metering_1, col = 'black')
lines(datetime, data$Sub_metering_2, col = 'red')
lines(datetime, data$Sub_metering_3, col = 'blue')

#Add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 'solid')

dev.off()