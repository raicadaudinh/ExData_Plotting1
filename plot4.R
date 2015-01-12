## I'll use the data.table package. you must load the package before use ##
## Load the data, I just keep the part that I'm intereted to.##
##Then, I name the columm##
library(data.table)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", 
            nrows = 2880, na.strings = c("?", ""))

## changes names##
v<- colnames(DT)
names<- c("Date", "Time", "Global_active_power", 
          "Global_reactive_power", "Voltage", 
          "Global_intensity", "Sub_metering_1", 
          "Sub_metering_2", "Sub_metering_3")
setnames(DT,old=v, new= names)

##Draw plot##
png(file="plot4.png")

##Create multiple plot##
par(mfrow=c(2,2))


##the first##
plot1<-plot(DT$Global_active_power, type="l", axes= FALSE, ylab="Global Active Power (kilowatts)", xlab="")
axis(1, at=c(1, 1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6,8),lab=c(0,2,4,6,""))
box() ##border##

##the second##
plot2<-plot(DT$Voltage, type="l", axes= FALSE, ylab="Voltage", xlab="datetime")
axis(1, at=c(1, 1440,2880), lab=c("Thu","Fri","Sat"))
axis(2)
box() ##border##



##the third##
plot3<-plot(DT$Sub_metering_1, type="l", axes=FALSE, ylab="Energy Sub Metering", xlab="")
axis(1, at=c(1, 1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
box()
lines(DT$Sub_metering_2, col="red")
lines(DT$Sub_metering_3, col="blue")
legend("topright",c("sub_metering_1","sub_metering_2", "sub_metering_3"), 
       col=c("black","red","blue"), lty=1, 
       bty = "n")

##the forth##
plot4<-plot(DT$Global_reactive_power, type="l", axes= FALSE, 
            ylab="Global_reactive_power", xlab="datetime")
axis(1, at=c(1, 1440,2880), lab=c("Thu","Fri","Sat"))
axis(2,at=c(0,0.1,0.2,0.3,0.4,0.5), lab=c("0","0.1","0.2","0.3","0.4","0.5"))


dev.off()
