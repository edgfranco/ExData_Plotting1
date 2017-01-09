# Read File
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsetting the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


#Converting Date and Time
data$DateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

##Plot
png("plot2.png", width = 480, height = 480)
plot(data$Global_active_power ~ data$DateTime, type= "l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()