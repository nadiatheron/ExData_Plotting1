#Set working directory as required
setwd("~/Coursera - EDA/Project 1")
power <- read.table("./household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")
str(power)
#Select required dates
power$Date <- as.Date(power$Date, "%d/%m/%Y")
subset <- power[power$Date %in% as.Date(c("01/02/2007","02/02/2007"), "%d/%m/%Y"),]
#Format dates for plots
subset$DateTime = paste(subset$Date, subset$Time,sep=" ")
subset$DateTimefmt = strptime(subset$DateTime, "%d/%m/%Y %H:%M:%S")
#Open device
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
#Create line plots
par(mfrow=c(1,1))
plot(x=subset$DateTimefmt,y=subset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=subset$DateTimefmt,y=subset$Sub_metering_2,type="l",col="red")
lines(x=subset$DateTimefmt,y=subset$Sub_metering_3,type="l",col="blue")
legend("topright",col=c('black','red','blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
#Turn device off
dev.off()