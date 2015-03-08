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
PC$Date = as.Date(as.character(PC$Date), format = "%d/%m/%Y")
PC <- subset(PC, Date >= "2007-02-01" & Date <= "2007-02-02")

######### Creates plot ##########
png(file = "./R/ExData_Plotting1/Plot1.png", width = 480, height = 480)
hist(PC$Global_active_power, freq = TRUE, breaks = 12 , main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
