## Graph Global Active Power across time for Household Power
## Consumption dataset for 2007-02-01 to 2007-02-02

## Get dataset and subset
hpc<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
hpcS<-subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")
rm(hpc)

## convert data to numeric
hpcS$Global_active_power<-as.numeric(hpcS$Global_active_power)

## convert time data
hpcS$t<-strptime(paste(hpcS$Date,hpcS$Time), "%Y-%m-%d %H:%M:%S")

## create graph
png("plot2.png", height=480,width=480)
plot(hpcS$t,hpcS$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", axes=FALSE, type="l")
box(which="plot")
r <- as.POSIXct(round(range(hpcS$t), "days"))
axis.POSIXct(1, at=seq(r[1],r[2], by="day"), format="%u", labels=c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
dev.off()