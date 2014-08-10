
# Reading in the data
initial <- read.csv("./household_power_consumption.txt", na.strings="?", 
                    sep=";", header=TRUE, nrows=70000, 
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Making a subset with the desired dates, then converting date/time variables to 
# R date format.
cons <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]
cons$dateTime <- strptime(paste(cons$Date, cons$Time), "%d/%m/%Y %H:%M:%S")


# Opening a PNG device, then drawing the plot of Global active power over time.
# Points are not added this time.
png("./plot2.png", width=480, height=480)
plot(cons$dateTime, cons$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", pch=-1)

# Adds lined data of Global active power
lines(cons$dateTime, cons$Global_active_power)

# Finally, closing the graphics device.
dev.off()
