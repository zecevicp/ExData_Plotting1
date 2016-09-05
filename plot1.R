
powerc_raw = read.csv("household_power_consumption.txt", header=TRUE, sep=";")
powerc = powerc_raw[powerc_raw$Date %in% c("1/2/2007", "2/2/2007"), ]
powerc$Global_active_power = as.numeric(as.character(powerc$Global_active_power))
png(filename="plot1.png")
hist(powerc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

