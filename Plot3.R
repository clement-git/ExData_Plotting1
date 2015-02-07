#PLOT 3

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

### Check dimensions to make sure the data was correctly loaded:
dim(PowerConData)


## Attach PowerConData and Extract the data for the two days that we need for plot3

attach(PowerConData)

subset <- Date=="1/2/2007" | Date=="2/2/2007"

DataExtract <- PowerConData[subset, ]
attach(DataExtract)

## convert the Date and Time variables to Date/Time classes using strptime()
DT <- paste(Date, Time)
DataExtract$DateTime <- strptime(DT, "%d/%m/%Y %H:%M:%S")

## Set Row Names using row.names(x) <- value
rownames(DataExtract) <- 1:nrow(DataExtract)


## Attach the extracted data


attach(DataExtract)

## Plot a graph of Energy Sub Metering against DateTime
###Note: I set las=1 to rotate the Energy sub metering values 



plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "1", las=1)
lines(DateTime, Sub_metering_2, col = "2") 
lines(DateTime, Sub_metering_3, col = "4") 
legend("topright", col = c("1", "2", "4"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lwd = 2, cex = 0.75)

##Save Graph as plot3.png

dev.copy(png, "plot3.png", height=480, width=480)
dev.off()
