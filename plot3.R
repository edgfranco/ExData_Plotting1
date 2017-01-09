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
png("plot3.png", width = 480, height = 480)
with(data, {plot(Sub_metering_1~DateTime, type="l",
                 ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
        })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()