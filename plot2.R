## define data origin

archivo <- "household_power_consumption.txt"

## read in data

datos <- read.table(archivo, header=T, sep=";", na.strings = "?")

## reformat date data

datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")

## subset data for relevant dates

misdatos <- subset(datos,Date=="2007-02-01"| Date=="2007-02-02")

## create new column for Date Time

misdatos$DateTime <- paste(misdatos$Date, misdatos$Time)
misdatos$DateTime <- strptime(misdatos$DateTime, "%Y-%m-%d %H:%M:%S")

## Convert consumption data to numeric

misdatos$Global_active_power <- as.numeric(as.character(misdatos$Global_active_power))

## send plot to file

png(file="plot2.png")

## Plot data

plot(misdatos$DateTime,misdatos$Global_active_power, type="l",
	main="",
	xlab="Global Active Power (kilowatts)",
	ylab="")

## Close file

dev.off()


