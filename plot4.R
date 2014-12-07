require(dplyr)
require(data.table)
require(lubridate)
household <- read.csv("~/R/Exploratory Data/household_power_consumption.txt", sep=";", na.strings="?")

household$Date<-dmy(household$Date)
limpios<-subset(household,Date<=ymd("2007-02-02"))
limpios<-subset(limpios,Date>=ymd("2007-02-01"))


##
limpios$Temp<-paste(as.Date(limpios$Date),limpios$Time)

limpios$Temp<-as.POSIXct(limpios$Temp)


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(limpios, {
        plot(Global_active_power~Temp, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Temp, type="l",
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Temp, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Temp,col='Red')
        lines(Sub_metering_3~Temp,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Temp, type="l",
             ylab="Global Rective Power (kilowatts)",xlab="")
})
## Saving to file
dev.copy(png, file="plot4.png")
dev.off()