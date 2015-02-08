##PLOT 4

##Set working directory
setwd("C:/Users/Clement/Google Drive/ITC/Post Graduation/Coursera/Exploratory Data Analysis/Exploratory Data Analysis Projects")

## Rough estimate of memory size needed for this data:
## 8 bytes per numeric data
dataSize<-2075259*9*8
dataSize

Megabytes<-dataSize/(2^20)
Megabytes

Gigabytes<- Megabytes/(2^10)
Gigabytes

## LOADING THE ELECTRIC POWER CONSUMPTION DATA
## I used the file.choose() command so that the windows explorer will open automatically for me to choose the file

PowerConData<-read.table(file.choose(), header=TRUE, sep=";", nrows=2075259, colClasses = c("character", "character", rep("numeric",7)), na.strings="?", check.names=TRUE, comment.char="")

PowerConData$Date <- as.Date(PowerConData$Date, format="%d/%m/%Y")

## Subset the data for the two days that we need for plot3
DataExtract <- subset(PowerConData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(DataExtract$Date), DataExtract$Time)
DataExtract$Datetime <- as.POSIXct(datetime)

## Divide the graphic display into 2 rows by 2 columns and Plot the four graphs

par(mfrow=c(2,2), mar=c(4,4,1,1))
with(DataExtract, {
   ## Top left
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  
  ## Top right
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  
  ## Bottom left
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col='2')
  lines(Sub_metering_3~Datetime, col='4')
  legend("topright", col = c("1", "2", "4"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, cex = 0.60)
  
  ##Bottom right
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power", xlab="datetime")
})

##Save Graph as plot4.png

dev.copy(png, "plot4.png", height=480, width=480)
dev.off()
