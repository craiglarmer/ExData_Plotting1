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

#Plot1
png(filename="plot1.png", width=480, height=480)
hist(hpcsubset$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

#close the file
dev.off(which=dev.cur())

