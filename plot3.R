#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Construct the plot
png(filename = "plot3.png")
x <- seq_along(data$Sub_metering_1)
plot(x, data$Sub_metering_1, xaxt = "n", yaxt = "n", xlab = "", ylab = "Energy sub metering", type = "n")

#lines for each submetering column
lines(seq_along(data$Sub_metering_1), data$Sub_metering_1, col = 'black')
lines(seq_along(data$Sub_metering_2), data$Sub_metering_2, col = 'red')
lines(seq_along(data$Sub_metering_3), data$Sub_metering_3, col = 'blue')

#Add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 'solid')

#Put ticks in axis
axis(side = 2, at = seq(0,30,10))
axis(side = 1, at = c(1,median(x),length(x)+1), label=c("Thu","Fri","Sat"))
dev.off()