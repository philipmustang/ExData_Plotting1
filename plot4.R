temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header = TRUE, sep = ";",na.strings = "?")
unlink(temp)
data$Time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
df<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(df$Time,df$Global_active_power,
     type="l",
     ylab="Global Active Power",
     xlab="")
plot(df$Time,df$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")
plot(df$Time,df$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, bty="n")
plot(df$Time,df$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")
dev.off()
