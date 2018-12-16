#Loading the data and subsetting the required piece: 
data<-read.csv("household_power_consumption.txt", sep=";")
data$Date<-strptime(data$Date, "%d/%m/%Y")
extracted_data<-subset(data, Date=="2007-02-01"| Date=="2007-02-02")

#Converting the variables in the appropriate format for further operations: 
extracted_data$full_date_time<-strptime(paste(extracted_data$Date, extracted_data$Time), "%Y-%m-%d %H:%M:%S")
extracted_data$Sub_metering_1<-as.numeric(as.character(extracted_data$Sub_metering_1))
extracted_data$Sub_metering_2<-as.numeric(as.character(extracted_data$Sub_metering_2))

#Generating the plot: 
plot(extracted_data$full_date_time, extracted_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(extracted_data$full_date_time, extracted_data$Sub_metering_2, type="l", col="red")
lines(extracted_data$full_date_time, extracted_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#Saving the plot in png format:
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

