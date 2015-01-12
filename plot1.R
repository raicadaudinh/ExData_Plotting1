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

## draw histogram##

png(file="plot1.png", height=480, width=480 )
plot1<-hist(DT$Global_active_power, freq=T, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0, 1200), col="red")
dev.off()

