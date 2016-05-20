#Referece to download the zip file and unzip the file
##download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "Assig4_1.zip",method="curl")
##zipfile1="Assig4_1.zip"
##unzip(zipfile1,exdir = getwd())

#Read the file
data1<-read.table("household_power_consumption.txt",sep = ";",header=TRUE,na="?", stringsAsFactors=FALSE, dec=".")
subsetdata2<-data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] #Subset the data as required
GAP<-(subsetdata2$Global_active_power)
volt<-(subsetdata2$Voltage)
submetering1<-(subsetdata2$Sub_metering_1)
submetering2<-(subsetdata2$Sub_metering_2)
submetering3<-(subsetdata2$Sub_metering_3)
GRP<-(subsetdata2$Global_reactive_power)

#convert the Date and Time variables to Date/Time classes
DateTime<-strptime(paste(subsetdata2$Date,subsetdata2$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the plot file
png(filename = "plot4.png", width = 480, height = 480)

#Create multi image panel 
par(mfrow=c(2,2))

#Create plot on top left side 
plot(DateTime, GAP, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

#Create plot on top right side
plot(DateTime, volt, type="l", col="black", xlab="datetime", ylab="Voltage")

#Create plot on bottom left side
plot(DateTime, submetering1,col="black", type="l", xlab="", ylab="Energy sub metering")
lines(DateTime,submetering2,col="red")
lines(DateTime,submetering3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2.5,col=c("black","red","blue"), )

#Create plot on bottom right side
plot(DateTime, GRP,col="black", type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()