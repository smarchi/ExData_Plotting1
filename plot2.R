#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Construct the plot
png(filename = "plot2.png")
x <- seq_along(data$Global_active_power)
plot(x, data$Global_active_power, xaxt = "n", yaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(x, data$Global_active_power)

#Put ticks in axis
axis(side = 2, at = c(0,2,4,6))
axis(side = 1, at = c(1,median(x),length(x)+1), label=c("Thu","Fri","Sat"))
dev.off()
