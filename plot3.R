# Reading in the data
initial <- read.csv("./household_power_consumption.txt", na.strings="?", 
                    sep=";", header=TRUE, nrows=70000, 
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Making a subset with the desired dates, then converting date/time variables to 
# R date format.
cons <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]
cons$dateTime <- strptime(paste(cons$Date, cons$Time), "%d/%m/%Y %H:%M:%S")


# Opening a PNG device, then drawing a plot base baded on Sub_metering_1.
# Points are not added this time.

png("./plot3.png", width=480, height=480)
plot(cons$dateTime, cons$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", pch=-1)

# Adds lined data of different sub-meterings, each with different colors
lines(cons$dateTime, cons$Sub_metering_1, col="black")
lines(cons$dateTime, cons$Sub_metering_2, col="red")
lines(cons$dateTime, cons$Sub_metering_3, col="blue")

# Adding a legend for the plot
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

# Finally, closing the graphics device.
dev.off()
