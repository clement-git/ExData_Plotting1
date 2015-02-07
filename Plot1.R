## Plot 1
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


## Attach PowerConData and Extract the data for the two days that we need for plot1

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

## Plot the histogram using the hist command
###Note: I set las=1 to rotate the frequency values 

hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0, 1200), breaks=11, col="red", las=1)

##Save Histogram as as plot1.png

dev.copy(png, "plot1.png", height=480, width=480)
dev.off()
