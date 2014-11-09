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

#drawing the plot, I'm using the function with this time

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par (mfrow = c(2,2))
with(epcdata, {
  plot(timestamputc, Global_active_power, xlab="", ylab="Global Active Power", type="l")
  plot(timestamputc, Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  
  plot(timestamputc, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(timestamputc, Sub_metering_2, type="l", col="red")
  lines(timestamputc, Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  
  plot(timestamputc, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
})    
dev.off()
