library(dplyr)

read_power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

power<-mutate(read_power,NDate=paste(Date,Time))

power$NDate<-as.POSIXct(power$NDate,format="%d/%m/%Y %H:%M:%S")

powerf<-filter(power,NDate<as.POSIXct("2007-02-03",format="%Y-%m-%d") & NDate>=as.POSIXct("2007-02-01",format="%Y-%m-%d"))

powerf$Sub_metering_1<-as.numeric(powerf$Sub_metering_1)

powerf$Sub_metering_2<-as.numeric(powerf$Sub_metering_2)


png(file="plot3.png")

with(powerf,plot(NDate,Sub_metering_1,col="green",xlab="",ylab="Energy sub metering",type="l"))

with(powerf,lines(NDate,Sub_metering_2,col="red"))

with(powerf,lines(NDate,Sub_metering_3,col="blue"))

legend("topright",col=c("green","red","blue"),lty=c("solid","solid","solid"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()