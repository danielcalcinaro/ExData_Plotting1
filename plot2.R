library(dplyr)

read_power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

power<-mutate(read_power,NDate=paste(Date,Time))

power$NDate<-as.POSIXct(power$NDate,format="%d/%m/%Y %H:%M:%S")

power$Global_active_power<-as.numeric(power$Global_active_power)

powerf<-filter(power,NDate<as.POSIXct("2007-02-03",format="%Y-%m-%d") & NDate>=as.POSIXct("2007-02-01",format="%Y-%m-%d"))

png(file="plot2.png")

with(powerf,plot(NDate,Global_active_power,type="l",xlab="",ylab="Global Active Power (kW)"))

dev.off()
