library(dplyr)

read_power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

power<-mutate(read_power,NDate=paste(Date,Time))

power$NDate<-as.POSIXct(power$NDate,format="%d/%m/%Y %H:%M:%S")

powerf<-filter(power,NDate<as.POSIXct("2007-02-03",format="%Y-%m-%d") & NDate>=as.POSIXct("2007-02-01",format="%Y-%m-%d"))

powerf$Global_active_power<-as.numeric(powerf$Global_active_power)

png(file="plot1.png")

hist(powerf$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kW)")

dev.off()

