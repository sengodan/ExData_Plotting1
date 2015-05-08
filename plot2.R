plot2 <- function() {
## Read Data for only 2/1/2007 & 2/2/2007

  library("sqldf")
  data <-read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";" )

  dateTime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
  data <-cbind(data,dateTime)

## Save the graph into plot1.png
  png("plot2.png", 480, 480)

## Draw Plot for Global_active_power with Date Time
  plot(data[,10],data[,3], type="o", pch=".", xlab="Date Time", ylab="Global Active Power (kilowatts)" )

  dev.off()

}
