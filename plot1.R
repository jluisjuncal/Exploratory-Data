require(dplyr)
require(data.table)
require(lubridate)
household <- read.csv("~/R/Exploratory Data/household_power_consumption.txt", sep=";", na.strings="?")

household$Date<-dmy(household$Date)
limpios<-subset(household,Date>=ymd("2007-02-01"))
limpios<-subset(limpios,Date<=ymd("2007-02-02"))

hist(limpios$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()
