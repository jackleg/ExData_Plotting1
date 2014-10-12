if(! "sqldf" %in% installed.packages()) {
    install.packages("sqldf");
}
library("sqldf")

# read data and convert date time class
hpc <- read.csv.sql("./household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date IN('1/2/2007', '2/2/2007')", sep=";", header=TRUE)
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# draw line plot
png("./plot3.png", width=480, height=480)
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
