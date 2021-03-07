# R Script to plot graphs for Project 1 - Exploratory Data Analysis
# Gumer Freire
# The plots are exported to "myownplots" subfolder.
# Original data file deleted due to large size to upload to Github.

library(dplyr)
library(lubridate)


data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- dmy(data$Date)

filtered <- data[data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"),]



filtered$Global_active_power <- as.numeric(filtered$Global_active_power)
filtered$Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
filtered$Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
filtered$Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)

# First plot
png(filename="myownplots/plot01.png", width=480, height=480)
hist(filtered$Global_active_power, col="red", main="Global active power", xlab="Global active power (kwats)", ylab = "Frequency")
dev.off()

# Second plot
png(filename="myownplots/plot02.png", width=480, height=480)

plot(filtered$Global_active_power, type="l", lty=1, xaxt="none", xlab="", ylab="Global active power (kwats)")
axis(1, at=c(1,length(filtered$Date)/2,length(filtered$Date)), labels=c("jue","vie","sab"))
dev.off()

# Third plot
png(filename="myownplots/plot03.png", width=480, height=480)

plot(filtered$Sub_metering_1, type="l", lty=1, xaxt="none", col="red", xlab="", ylab="Energy submetering")
lines(filtered$Sub_metering_2, type="l", lty=1, xaxt="none", col="green")
lines(filtered$Sub_metering_3, type="l", lty=1, xaxt="none", col="blue")
legend("topright", legend = c("Sub_meter_1","Sub_meter_2","Sub_meter_3"), pch="l", col=c("red","green","blue"))

axis(1, at=c(1,length(filtered$Date)/2,length(filtered$Date)), labels=c("jue","vie","sab"))
dev.off()

# Fourth plot
png(filename="myownplots/plot04.png", width=480, height=480)
par(mfrow=c(2,2))
#subplot 1
plot(filtered$Global_active_power, type="l", lty=1, xaxt="none", xlab="", ylab="Global active power")
axis(1, at=c(1,length(filtered$Date)/2,length(filtered$Date)), labels=c("jue","vie","sab"))

#subplot 2
plot(filtered$Voltage, type="l", lty=1, xaxt="none", xlab="", ylab="Voltage")
axis(1, at=c(1,length(filtered$Date)/2,length(filtered$Date)), labels=c("jue","vie","sab"))

#subplot 3
plot(filtered$Sub_metering_1, type="l", lty=1, xaxt="none", col="red", xlab="", ylab="Energy submetering")
lines(filtered$Sub_metering_2, type="l", lty=1, xaxt="none", col="green")
lines(filtered$Sub_metering_3, type="l", lty=1, xaxt="none", col="blue")
legend("topright", legend = c("Sub_meter_1","Sub_meter_2","Sub_meter_3"), pch="l", col=c("red","green","blue"))
axis(1, at=c(1,length(filtered$Date)/2,length(filtered$Date)), labels=c("jue","vie","sab"))

#subplot 4
plot(filtered$Global_reactive_power, type="l", lty=1, xaxt="none", xlab="", ylab="Global reactive power")
axis(1, at=c(1,length(filtered$Date)/2,length(filtered$Date)), labels=c("jue","vie","sab"))

dev.off()
