#set parameters
library(lubridate)

#folder needs to contain household_power_consumption.txt file with full data set from the
#following location: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
setwd("~/R/ExData_Plotting1")

#Load and format data
hpc<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
hpcsubset<-hpc[hpc$Date =="1/2/2007"|hpc$Date =="2/2/2007",]
hpcsubset$Date<-dmy(hpcsubset$Date)
hpcsubset$Global_active_power<-as.numeric(hpcsubset$Global_active_power)
hpcsubset$Global_reactive_power<-as.numeric(hpcsubset$Global_reactive_power)
hpcsubset$Voltage<-as.numeric(hpcsubset$Voltage)
hpcsubset$Global_intensity<-as.numeric(hpcsubset$Global_intensity)

hpcsubset$Sub_metering_1<-as.numeric(hpcsubset$Sub_metering_1)
hpcsubset$Sub_metering_2<-as.numeric(hpcsubset$Sub_metering_2)
hpcsubset$Sub_metering_3<-as.numeric(hpcsubset$Sub_metering_3)

hpcsubset$DateTime = paste(as.character(hpcsubset$Date),hpcsubset$Time,sep=" ")
hpcsubset$DateTime <- ymd_hms(hpcsubset$DateTime)

#Plot 4
png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(hpcsubset$DateTime,hpcsubset$Global_active_power,type="l", ylab="Global Active Power (kilowatt)",xlab="")
plot(hpcsubset$DateTime,hpcsubset$Voltage,type="l", ylab="Voltage",xlab="")
plot(hpcsubset$DateTime,hpcsubset$Sub_metering_1,type="n", ylab="Energy sub metering",xlab="")
points(hpcsubset$DateTime,hpcsubset$Sub_metering_1,col="black",type="l")
points(hpcsubset$DateTime,hpcsubset$Sub_metering_2,col="red",type="l")
points(hpcsubset$DateTime,hpcsubset$Sub_metering_3,col="blue",type="l")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
plot(hpcsubset$DateTime,hpcsubset$Global_reactive_power,type="l", ylab="Global Reactive Power",xlab="")

#close the file
dev.off(which=dev.cur())