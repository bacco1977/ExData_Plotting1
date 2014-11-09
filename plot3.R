#plot3.R


#Reading the data, using ";" as separator
#I'm not filtering as my PC has enough memory

epcdata <- read.table (file="household_power_consumption.txt",, header=T,
                       sep=";", stringsAsFactors=F, na.strings="?",
                       colClasses=c("character", "character", "numeric",
                                    "numeric", "numeric", "numeric",
                                    "numeric", "numeric", "numeric"))
names(epcdata)

#filter the dataset with only the rows of the dates
#adding also the time this time

epcdata$timestamputc = strptime(paste(epcdata$Date, epcdata$Time),
                                format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
epcdata = epcdata[epcdata$timestamputc >= startDate & epcdata$timestamputc <= endDate, ]

#drawing the plot
png(filename="plot3.png", width=480, height=480)
plot(epcdata$timestamp, epcdata$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(epcdata$timestamp, epcdata$Sub_metering_2, col="red")
lines(epcdata$timestamp, epcdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off()
