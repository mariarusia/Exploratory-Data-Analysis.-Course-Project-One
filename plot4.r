#this is for plot 4

#that line is kind of important in case you are not in an English Speaking country
Sys.setlocale("LC_ALL","English")

#The next section is the same for all four scripts
#Please, copy the data file into your working directory or change the path
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

#We need to have the corect dates, so we copy the dates into "Time" column and change its format
data$Time <- paste(data$Date, data$Time) 
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S" )
Sys.setlocale("LC_ALL","English")
#change the type of the date column
data$Date <- as.Date(data$Date , "%d/%m/%Y")

#Create the subset with the dates in question
subdate <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

#change the type of the Global_active+pover
subdate$Global_active_power <- as.numeric(subdate$Global_active_power)

#this is specific for plot 4
#planning the layout

png(file="plot4.png")

par(mfrow = c(2, 2))

#upper left
with(subdate, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab =""))

#upper right
with(subdate, plot(Time, Voltage , type = "l", ylab = "Voltage", xlab ="datetime"))

#lower left
plot(subdate$Time, subdate$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(subdate$Time, subdate$Sub_metering_1, col = "gray")
lines(subdate$Time, subdate$Sub_metering_3, col = "blue")
lines(subdate$Time, subdate$Sub_metering_2, col = "red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = c(1, 1), col = c("gray", "red", "blue"))

#lower right
with(subdate, plot(Time, Global_reactive_power, type = "l",  xlab ="datetime"))


dev.off()