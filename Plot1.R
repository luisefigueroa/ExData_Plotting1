url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination <- "./r/downloads/PowerConsumption.zip"
download.file(url, destination, method = "curl")
PC <- read.table(unz(destination, filename="household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
PC$Date = as.Date(as.character(PC$Date), format = "%d/%m/%Y")
PC <- subset(PC, Date >= "2007-02-01" & Date <= "2007-02-02")
png(file = "./R/ExData_Plotting1/Plot1.png", width = 480, height = 480)
hist(PC$Global_active_power, freq = TRUE, breaks = 12 , main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
