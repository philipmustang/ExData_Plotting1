temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header = TRUE, sep = ";",na.strings = "?")
unlink(temp)
data$Time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
df<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
png("plot2.png", width=480, height=480)
plot(df$Time,df$Global_active_power,
     type="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")
lines(df$Time,df$Global_active_power)
dev.off()
