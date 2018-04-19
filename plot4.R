data <- read.csv("C:\\Users\\8.1\\Documents\\data\\household_power_consumption.txt", header=TRUE, sep = ";" , na.strings='?', colClasses = c('character','character','numeric' ,'numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
needed<-subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02" ))
needed<- mutate(needed, datetime = paste(as.Date(needed$Date), needed$Time))
needed$datetime <- as.POSIXct(needed$datetime)

png(filename = "C:\\Users\\8.1\\Documents\\data\\Plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

plot(needed$Global_active_power ~ needed$datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(needed$Voltage ~ needed$datetime, type = "l", ylab = "Voltage", xlab = "datetime")

plot(needed$Sub_metering_1 ~ needed$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(needed$Sub_metering_2 ~ needed$datetime, col= "red")
lines(needed$Sub_metering_3 ~ needed$datetime, col= "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(needed$Global_reactive_power ~ needed$datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
