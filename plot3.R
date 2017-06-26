data<-read.csv2("./ExploratoryDataAn/household_power_consumption.txt",
	stringsAsFactor=F)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
lab<-c(which(data$Time=="00:00:00"),length(data$Time)+1)

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data[,3:9] <- lapply(data[,3:9],as.numeric)

png(filename="plot3.png")
plot(data$Sub_metering_1,type="l",xlab=" ",xaxt = "n",
	ylab="Energy sub metering")
axis(1, at=lab,labels=c("Thu","Fri","Sat"))
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
legend("topright", paste0("Sub_metering_",1:3), 
	col = c("black", "red", "blue"),lwd = c(1, 1, 1))
dev.off()

