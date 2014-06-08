## Graph Global Active Power across time for Household Power
## Consumption dataset for 2007-02-01 to 2007-02-02

## Get dataset and subset
hpc<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
hpcS<-subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")
rm(hpc)

## convert data to numeric
hpcS$Sub_metering_1<-as.numeric(hpcS$Sub_metering_1)
hpcS$Sub_metering_2<-as.numeric(hpcS$Sub_metering_2)
hpcS$Sub_metering_3<-as.numeric(hpcS$Sub_metering_3)

## convert time data
hpcS$t<-strptime(paste(hpcS$Date,hpcS$Time), "%Y-%m-%d %H:%M:%S")




## create graph
png("plot3.png", height=480,width=480)

plot(hpcS$t, hpcS$Sub_metering_1, type="l", axes=FALSE, xlab="", ylab="Energy sub metering", col="black")
lines(hpcS$t, hpcS$Sub_metering_2, col="red")
lines(hpcS$t, hpcS$Sub_metering_3, col="blue")

box(which="plot")
r <- as.POSIXct(round(range(hpcS$t), "days"))
axis.POSIXct(1, at=seq(r[1],r[2], by="day"), format="%u", labels=c("Thu","Fri","Sat"))
axis(2,at=c(0,10,20,30))

legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1)
dev.off()
