plot1<-function() {
    ##GETS AND CLEANS DATA
    power<-read.table("power.txt",sep=";",header=TRUE,na.strings="?")
    power2<-power
    power2<-subset(power2,Date=="1/2/2007"|Date=="2/2/2007") #keep only 2 dates
    power2$Time2<-paste(power2$Date,power2$Time) #create time column
    power2<-power2[,-2] #remove old time col
    power2$Date<-as.Date(power2$Date,format="%d/%m/%Y") #reformat date col
    power2$Time2<-strptime(power2$Time2,format="%d/%m/%Y %H:%M:%S") #reformat time col
    
    ##PLOTTING 1 
    with(power2,hist(Global_active_power,Voltage,breaks=12,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))
    dev.copy(png,file="plot1.png")
    dev.off()

}