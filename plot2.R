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


with(limpios,plot(Global_active_power~Temp,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png, file="plot2.png")
dev.off()