#Read data file, format data column as Data object and select the two days used for plotting
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Construct the plot
png(filename = "plot1.png")
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col = "red", main = "Global Active Power")

#Close device
dev.off()
