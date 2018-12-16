#Loading the data and subsetting the required piece: 
data<-read.csv("household_power_consumption.txt", sep=";")
data$Date<-strptime(data$Date, "%d/%m/%Y")
extracted_data<-subset(data, Date=="2007-02-01"| Date=="2007-02-02")

#Converting the variables in the appropriate format for further operations: 
extracted_data$full_date_time<-strptime(paste(extracted_data$Date, extracted_data$Time), "%Y-%m-%d %H:%M:%S")
extracted_data$Global_active_power[extracted_data$Global_active_power=="?"] <- NA
extracted_data$Global_active_power<-as.numeric(as.character(extracted_data$Global_active_power))

#Generating the plot: 
plot(extracted_data$full_date_time, extracted_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Saving the plot in png format:
png("plot2.png", width=480, height=480)
dev.off()
