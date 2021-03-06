
powerc_raw = read.csv("household_power_consumption.txt", header=TRUE, sep=";")
powerc = powerc_raw[powerc_raw$Date %in% c("1/2/2007", "2/2/2007"), ]
powerc$Date = strptime(paste(powerc$Date, powerc$Time), format="%d/%m/%Y %H:%M:%S")
powerc = subset(powerc, select=-c(Time))
powerc$Sub_metering_1 = as.numeric(as.character(powerc$Sub_metering_1))
powerc$Sub_metering_2 = as.numeric(as.character(powerc$Sub_metering_2))
powerc$Sub_metering_3 = as.numeric(as.character(powerc$Sub_metering_3))
Sys.setlocale("LC_ALL","English")
png(filename="plot3.png")
with(powerc, plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", yaxt="n", ylim=c(-1, 40)))
axis(2, at=c(0, 10, 20, 30))
with(powerc, lines(Date, Sub_metering_2, col="red"))
with(powerc, lines(Date, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2)
dev.off()
