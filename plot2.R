#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#Construct the plot
png(filename = "plot2.png")
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#Close device
dev.off()
