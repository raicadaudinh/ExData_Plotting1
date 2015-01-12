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

png(file="plot2.png", width=480, height=480)
plot2<-plot(DT$Global_active_power, type="l", axes= FALSE, ylab="Global Active Power (kilowatts)", xlab="")
axis(1, at=c(1, 1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6,8),lab=c(0,2,4,6,""))
box() ##border##
dev.off()