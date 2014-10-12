if(! "sqldf" %in% installed.packages()) {
    install.packages("sqldf");
}
library("sqldf")

# read data
hpc <- read.csv.sql("./household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date IN('1/2/2007', '2/2/2007')", sep=";", header=TRUE)

# draw histogram with red
png("./plot1.png", width=480, height=480)
hist(x = hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()