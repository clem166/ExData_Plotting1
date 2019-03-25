
library(lubridate)

setwd("C:/Users/theGameTrader/Documents/R/coursera/Exploratory Data/")

#read csv file in
data = read.csv("household_power_consumption.txt", sep =";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
#Date variable
data$Date = as.Date(as.character(data$Date), '%d/%m/%Y')
#subset to period of interest
data2= data[data$Date >=  "2007-02-01" & data$Date <= "2007-02-02", ]

#datetime using lubridate
data2$DateTime = ymd_hms(paste0(data2$Date, data2$Time))


#Plot1
hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()    
