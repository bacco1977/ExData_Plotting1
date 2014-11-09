#plot2.R


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
png(file="plot2.png",width=480,height=480)
plot(epcdata$timestamputc, epcdata$Global_active_power, type="l", xlab="",     ylab="Global Active Power (kilowatts)")
dev.off()
