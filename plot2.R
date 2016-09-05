
powerc_raw = read.csv("household_power_consumption.txt", header=TRUE, sep=";")
powerc = powerc_raw[powerc_raw$Date %in% c("1/2/2007", "2/2/2007"), ]
powerc$Date = strptime(paste(powerc$Date, powerc$Time), format="%d/%m/%Y %H:%M:%S")
powerc = subset(powerc, select=-c(Time))
powerc$Global_active_power = as.numeric(as.character(powerc$Global_active_power))
Sys.setlocale("LC_ALL","English")
png(filename="plot2.png")
with(powerc, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
