#this is to create the first plot


#The next section is the same for all four scripts
#Please, copy the data file into your working directory or change the path
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

#We need to have the corect dates, so we copy the dates into "Time" column and change its format
data$Time <- paste(data$Date, data$Time) 
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S" )

#change the type of the date column
data$Date <- as.Date(data$Date , "%d/%m/%Y")

#Create the subset with the dates in question
subdate <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

#change the type of the Global_active+pover
subdate$Global_active_power <- as.numeric(subdate$Global_active_power)


#code, specific for plot1.R

#create the layout
par(mfrow = c(1, 1))

#create the hist
hist(subdate$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()