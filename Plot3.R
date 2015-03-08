##############################################################################################
# Script written by: Luis Figueroa
#
# This script was produced for the first assignment of the reproducible research course of the  
# Johns Hopkins University's Data Science specialization track in Coursera
#
##############################################################################################

########## Download the raw data ##########
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination <- "./r/downloads/PowerConsumption.zip"
download.file(url, destination, method = "curl")

########## Read the raw data into memory and subset the data set to include only data for 2007-02-01 and 2007-02-02 ##########
PC <- read.table(unz(destination, filename="household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
PC$DateTime = paste(PC$Date, PC$Time, sep = " ")
PC$DateTime = strptime(PC$DateTime, format = "%d/%m/%Y %H:%M:%S")
PC <- subset(PC, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

######### Creates plot ##########
png(file = "./R/ExData_Plotting1/Plot3.png", width = 480, height = 480)
plot(PC$DateTime, PC$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(PC$DateTime, PC$Sub_metering_2, type = "l", col = "red")
lines(PC$DateTime, PC$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"),  legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()  
