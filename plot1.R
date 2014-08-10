
# Reading in the data
initial <- read.csv("./household_power_consumption.txt", na.strings="?", 
                      sep=";", header=TRUE, nrows=70000, 
                      colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Making a subset with the desired dates, then converting date/time variables to 
# R date format.
cons <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]
cons$dateTime <- strptime(paste(cons$Date, cons$Time), "%d/%m/%Y %H:%M:%S")


# Opening a PNG device, then drawing the histohram of Global active power.
png("./plot1.png", width=480, height=480)
hist(cons$Global_active_power, col="red", main="Global Active Power", 
      xlab="Global Active Power (kilowatts)")

# Finally, closing the graphics device.
dev.off()


