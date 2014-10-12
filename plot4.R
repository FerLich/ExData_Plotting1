## define data origin

archivo <- "household_power_consumption.txt"

## read in data

##datos <- read.table(archivo, header=T, sep=";", na.strings = "?")

## reformat date data

datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")

## subset data for relevant dates

misdatos <- subset(datos,Date=="2007-02-01"| Date=="2007-02-02")

## create new column for Date Time

misdatos$DateTime <- paste(misdatos$Date, misdatos$Time)
misdatos$DateTime <- strptime(misdatos$DateTime, "%Y-%m-%d %H:%M:%S")

## Convert plot data to numeric


misdatos$Global_active_power <- as.numeric(as.character(misdatos$Global_active_power))
misdatos$Global_reactive_power <- as.numeric(as.character(misdatos$Global_reactive_power))
misdatos$Voltage <- as.numeric(as.character(misdatos$Voltage))
misdatos$Sub_metering_1 <- as.numeric(as.character(misdatos$Sub_metering_1))
misdatos$Sub_metering_2 <- as.numeric(as.character(misdatos$Sub_metering_2))
misdatos$Sub_metering_3 <- as.numeric(as.character(misdatos$Sub_metering_3))

## define plot format

png(file="plot4.png", width=480, height=480)

old.par <- par(mfrow = c(2,2))

## Plot data

plot(misdatos$DateTime, misdatos$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

# Plot Voltage
plot(misdatos$DateTime, misdatos$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(misdatos$DateTime,misdatos$Sub_metering_1, type="l",
	main="",
	xlab="",
	ylab="Energy sub metering",
	col="black")


lines(misdatos$DateTime,misdatos$Sub_metering_2, type="l", col="red")

lines(misdatos$DateTime,misdatos$Sub_metering_3, type="l", col="blue")

legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)

# Plot Global_reactive_power
plot(misdatos$DateTime, misdatos$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


## Close file

dev.off()

par(old.par)
