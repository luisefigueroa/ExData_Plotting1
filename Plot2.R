url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination <- "./r/downloads/PowerConsumption.zip"
download.file(url, destination, method = "curl")
PC <- read.table(unz(destination, filename="household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
PC$DateTime = paste(PC$Date, PC$Time, sep = " ")
PC$DateTime = strptime(PC$DateTime, format = "%d/%m/%Y %H:%M:%S")
PC <- subset(PC, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
png(file = "./R/ExData_Plotting1/Plot2.png", width = 480, height = 480)
plot(PC$DateTime, PC$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()  
