plot3 <- function() {
## Read Data for only 2/1/2007 & 2/2/2007

  library("sqldf")
  data <-read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";" )

  dateTime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
  data <-cbind(data,dateTime)

## Save the graph into plot1.png
  png("plot3.png", 480, 480)

## Draw Plot for sub metering with Date Time

  with(data, plot(dateTime, Sub_metering_1, type="n", ylab="Energy Sub_Metering"))
  with(subset(data), points(dateTime, Sub_metering_1, type="o", pch = ".",  col="black")) 
  with(subset(data), points(dateTime, Sub_metering_2, type="o", pch = ".",  col="red")) 
  with(subset(data), points(dateTime, Sub_metering_3, type="o", pch = ".",  col="blue")) 
  legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3"))

  dev.off()

}
