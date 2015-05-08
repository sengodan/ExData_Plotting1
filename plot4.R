plot4 <- function() {
## Read Data for only 2/1/2007 & 2/2/2007

  library("sqldf")
  data <-read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";" )

  dateTime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
  data <-cbind(data,dateTime)

## Save the graph into plot1.png
  png("plot4.png", 480, 480)

  par(mfrow = c(2,2))
  with(data, {
    plot(dateTime, Global_active_power, type="o", pch=".", xlab="Date Time", ylab="Global Active Power (kilowatts)" )
    plot(dateTime, Voltage, type="o", pch=".", xlab="Date Time" )
    plot(dateTime, Sub_metering_1, type="n", xlab="Date Time", ylab="Energy Sub Metering")
      with(subset(data), points(dateTime, Sub_metering_1, type="o", pch = ".",  col="black")) 
      with(subset(data), points(dateTime, Sub_metering_2, type="o", pch = ".",  col="red")) 
      with(subset(data), points(dateTime, Sub_metering_3, type="o", pch = ".",  col="blue")) 
      legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3"))
    plot(dateTime, Global_reactive_power, type="o", pch=".", xlab="Date Time", ylab="Global Reactive Power" )
  })   

  dev.off()

}
