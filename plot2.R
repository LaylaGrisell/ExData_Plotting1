data<-read.csv2("./ExploratoryDataAn/household_power_consumption.txt",
	stringsAsFactor=F)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
lab<-c(which(data$Time=="00:00:00"),length(data$Time)+1)

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data[,3:9] <- lapply(data[,3:9],as.numeric)

png(filename="plot2.png")
plot(data$Global_active_power,type="l",xlab=" ",xaxt = "n",
	ylab="Global Active Power (kilowatts)")
axis(1, at=lab,labels=c("Thu","Fri","Sat"))
dev.off()

