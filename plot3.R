library(data.table)
data <- fread("household_power_consumption.txt", na.strings="?")
df <- with(data, data[(Date == "1/2/2007" | Date == "2/2/2007")])
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# Plot 3
plot(df$datetime,df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_1, col="red")
lines(df$datetime, df$Sub_metering_2, col="green")
lines(df$datetime, df$Sub_metering_3, col="blue")
legend("topright",legend=colnames(df)[7:9], 
       lty=1, col=c("red","green","blue"), bty="n", inset=c(0.15,0), y.intersp=2)
dev.copy(png, file = "plot3.png", width =480, height=480)
dev.off()