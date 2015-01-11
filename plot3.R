plot3<-function() {
    ##GETS AND CLEANS DATA
    power<-read.table("power.txt",sep=";",header=TRUE,na.strings="?")
    power2<-power
    power2<-subset(power2,Date=="1/2/2007"|Date=="2/2/2007") #keep only 2 dates
    power2$Time2<-paste(power2$Date,power2$Time) #create time column
    power2<-power2[,-2] #remove old time col
    power2$Date<-as.Date(power2$Date,format="%d/%m/%Y") #reformat date col
    power2$Time2<-strptime(power2$Time2,format="%d/%m/%Y %H:%M:%S") #reformat time col
    
    ##PLOTTING 3
    with(power2,plot(Time2,Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3")))
    with(power2,lines(Time2,Sub_metering_1,col="black"))
    with(power2,lines(Time2,Sub_metering_2,col="red"))
    with(power2,lines(Time2,Sub_metering_3,col="blue"))
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)
    dev.copy(png,file="plot3.png")
    dev.off()
    
}