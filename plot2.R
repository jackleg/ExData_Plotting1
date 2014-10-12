if(! "sqldf" %in% installed.packages()) {
    install.packages("sqldf");
}
library("sqldf")

# read data and convert date time class
hpc <- read.csv.sql("./household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date IN('1/2/2007', '2/2/2007')", sep=";", header=TRUE)
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# draw line plot
png("./plot2.png", width=480, height=480)
plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
