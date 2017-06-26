
data<-read.csv2("./ExploratoryDataAn/household_power_consumption.txt",stringsAsFactor=F)

data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data[,3:9] <- lapply(data[,3:9],as.numeric)

png(filename="plot1.png")
hist(data$Global_active_power,col="red",main="Global Active Power",
	xlab="Global Active Power (kilowatts)")
dev.off()


