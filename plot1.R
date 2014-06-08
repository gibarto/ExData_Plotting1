## Graph Global Active Power vs. Frequency for Household Power
## Consumption dataset for 2007-02-01 to 2007-02-02

## Get dataset and subset
hpc<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
hpcS<-subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")
rm(hpc)

## convert data to numeric
hpcS$Global_active_power<-as.numeric(hpcS$Global_active_power)

## make plot in PNG form
png(filename="plot1.png", width=480, height=480, units="px")
hist(hpcS$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts", ylab="Frequency", col="red", axes=FALSE)
axis(1, at=c(0,2,4,6))
axis(2, at=c(0,200,400,600,800,1000,1200))
dev.off()
