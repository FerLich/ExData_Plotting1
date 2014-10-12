archivo <- "household_power_consumption.txt"

## read in data

datos <- read.table(archivo, header=T, sep=";", na.strings = "?")

## convert format of Date column

datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")

## select relevant data

misdatos <- subset(datos,Date=="2007-02-01"|Date=="2007-02-02")

## convert data column to numeric

misdatos$Global_active_power <- as.numeric(as.character(misdatos$Global_active_power))

## plot to file

png(file="plot1.png")

## plot histogram

hist(misdatos$Global_active_power,
	col="red", 
	main="Global Active Power",
	xlab="Global Active Power (kilowatts)")

## close file

dev.off()


