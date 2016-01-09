library(data.table)
data <- fread("household_power_consumption.txt", na.strings="?")
df <- with(data, data[(Date == "1/2/2007" | Date == "2/2/2007")])
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# Plot 2
plot(df$datetime, df$Global_active_power, type="l", lwd=2, xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width =480, height=480)
dev.off()