# Reading in the data

tmp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", tmp)
initial <- read.csv(unz(tmp, "household_power_consumption.txt"), na.strings="?", 
                    sep=";", header=TRUE, nrows=70000, 
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))


# Making a subset with the desired dates, then converting date/time variables to 
# R date format.
cons <- initial[initial$Date %in% c("1/2/2007","2/2/2007"),]
cons$dateTime <- strptime(paste(cons$Date, cons$Time), "%d/%m/%Y %H:%M:%S")


# Opening a PNG device
png("./plot4.png", width=480, height=480)
# Saving the 'par' parameter list so we can revert it later
oldpar <- par()

# Setting layout to 2x2
par(mfrow=c(2,2))

# Part 1: Global Active Power over time (See Plot2)
plot(cons$dateTime, cons$Global_active_power, xlab="", 
     ylab="Global Active Power", pch=-1)
lines(cons$dateTime, cons$Global_active_power)


# Part 2: Voltage over time
plot(cons$dateTime, cons$Voltage, xlab="datetime", 
     ylab="Voltage", pch=-1)
lines(cons$dateTime, cons$Voltage)


# Part 3: Energy sub meterings over time (See Plot3)

plot(cons$dateTime, cons$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", pch=-1)

lines(cons$dateTime, cons$Sub_metering_1, col="black")
lines(cons$dateTime, cons$Sub_metering_2, col="red")
lines(cons$dateTime, cons$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))


# Part 4: Global Reactive Power over time

plot(cons$dateTime, cons$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", pch=-1)
lines(cons$dateTime, cons$Global_reactive_power)

# Finally, closing the graphics device.
dev.off()
