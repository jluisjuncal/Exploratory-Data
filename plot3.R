require(dplyr)
require(data.table)
require(lubridate)
household <- read.csv("~/R/Exploratory Data/household_power_consumption.txt", sep=";", na.strings="?")


household$Date<-dmy(household$Date)
limpios<-subset(household,Date<=ymd("2007-02-02"))
limpios<-subset(limpios,Date>=ymd("2007-02-01"))

      
        
        
     
        ## Converting dates
limpios$Temp<-paste(as.Date(limpios$Date),limpios$Time)

limpios$Temp<-as.POSIXct(limpios$Temp)


## Plot 3
        with(limpios, {
                plot(Sub_metering_1~Temp, type="l",
                     ylab="Global Active Power (kilowatts)", xlab="")
                lines(Sub_metering_2~Temp,col='Red')
                lines(Sub_metering_3~Temp,col='Blue')
        })
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ## Saving to file
        dev.copy(png, file="plot3.png", height=480, width=480)
        dev.off()