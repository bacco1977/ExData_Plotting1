#plot1.R


#Reading the data, using ";" as separator
#I'm not filtering as my PC has enough memory

epcdata <- read.table (file="household_power_consumption.txt",, header=T,
                       sep=";", stringsAsFactors=F, na.strings="?",
                       colClasses=c("character", "character", "numeric",
                                    "numeric", "numeric", "numeric",
                                    "numeric", "numeric", "numeric"))
names(epcdata)

#filter the dataset with only the rows of the dates
epcdata$Date = as.Date(epcdata$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
epcdata = epcdata[epcdata$Date >= startDate & epcdata$Date <= endDate, ]

#drawing the histogram
png(file="plot1.png",width=480,height=480)
hist(epcdata$Global_active_power, col='red', main = "Global Active Power" , xlab = 'Global Active Power (kilowatts)')
dev.off()
