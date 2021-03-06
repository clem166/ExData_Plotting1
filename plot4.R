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

#All Plots
par(mfrow = c(2,2))
    #Plot1
    with(data2, {
      plot(Global_active_power ~ DateTime, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
    })
    #Plot2
    with(data2, {
      plot(Voltage ~ DateTime, type ="l", ylab = "Voltage")
    })
    
    #Plot3
    with(data2, {
      plot(Sub_metering_1 ~ DateTime, type = "l", col="black", ylab="Global Active Power (kilowatts)", xlab="")
      lines(Sub_metering_2 ~ DateTime, col="red")
      lines(Sub_metering_3 ~ DateTime, col="blue")
      legend("topright", lty=1, bty= "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })
    #plot4
    
    with(data2, {
      plot(Global_reactive_power ~ DateTime, type ="l")
    })
    
    
    dev.copy(png, file="plot4.png", width=480, height=480)
    
    dev.off()    
