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

##draw plot##
## I make axes= falses so I could change later##

png("plot3.png")
plot(DT$Sub_metering_1, type="l", axes=FALSE, ylab="Energy Sub Metering", xlab="")

## Changes axis##
axis(1, at=c(1, 1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
##draw border##
box()

##add the second and third lines##
lines(DT$Sub_metering_2, col="red")
lines(DT$Sub_metering_3, col="blue")

## add legend##
legend("topright",c("sub_metering_1","sub_metering_2", "sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()