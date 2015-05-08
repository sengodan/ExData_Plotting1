plot1 <- function() {
## Read Data for only 2/1/2007 & 2/2/2007

  library("sqldf")
  data <-read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";" )

##dt <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
##data <-cbind(data,dt)

## Save the graph into plot1.png
  png("plot1.png", 480, 480)

## Draw Histogram for Global_active_power
  hist(data[,3], col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()

}
