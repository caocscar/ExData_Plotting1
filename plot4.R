library(data.table)
data <- fread("household_power_consumption.txt", na.strings="?")
df <- with(data, data[(Date == "1/2/2007" | Date == "2/2/2007")])
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# Plot 4
par(mfcol = c(2,2) )
par(mar = c(5,4,1,2))
plot(df$datetime, df$Global_active_power, type="l", lwd=2, xlab="", ylab="Global Active Power (kilowatts)")
plot(df$datetime,df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_1, col="red")
lines(df$datetime, df$Sub_metering_2, col="green")
lines(df$datetime, df$Sub_metering_3, col="blue")
legend("topright",legend=colnames(df)[7:9], 
       lty=1, col=c("red","green","blue"), bty="n", cex=0.9, inset=c(0.3,0), y.intersp=2)
plot(df$datetime, df$Voltage, col="orange", type="l", lwd=2, xlab="datetime", ylab="Voltage")
plot(df$datetime, df$Global_reactive_power, col="limegreen", type="l", lwd=2, xlab="datetime", ylab="Global Reactive Power")
dev.copy(png, file = "plot4.png", width =480, height=480)
dev.off()