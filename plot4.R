library(dplyr)

read_power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

power<-mutate(read_power,NDate=paste(Date,Time))

power$NDate<-as.POSIXct(power$NDate,format="%d/%m/%Y %H:%M:%S")

powerf<-filter(power,NDate<as.POSIXct("2007-02-03",format="%Y-%m-%d") & NDate>=as.POSIXct("2007-02-01",format="%Y-%m-%d"))

powerf$Sub_metering_1<-as.numeric(powerf$Sub_metering_1)

powerf$Sub_metering_2<-as.numeric(powerf$Sub_metering_2)

powerf$Voltage<-as.numeric(powerf$Voltage)

powerf$Global_active_power<-as.numeric(powerf$Global_active_power)

powerf$Global_reactive_power<-as.numeric(powerf$Global_reactive_power)

png(file="plot4.png")

par(mfrow=c(2,2),mar=c(4,4,2,1),cex=0.7)

with(powerf,plot(NDate,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

with(powerf,plot(NDate,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(powerf,plot(NDate,Sub_metering_1,col="green",xlab="",ylab="Energy sub metering",type="l"))

with(powerf,lines(NDate,Sub_metering_2,col="red"))

with(powerf,lines(NDate,Sub_metering_3,col="blue"))

legend("topright",col=c("green","red","blue"),lty=c("solid","solid","solid"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(powerf,plot(NDate,Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power"))

dev.off()

