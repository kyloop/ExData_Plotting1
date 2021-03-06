#Referece to download the zip file and unzip the file
##download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "Assig4_1.zip",method="curl")
##zipfile1="Assig4_1.zip"
##unzip(zipfile1,exdir = getwd())

#Read the file
data1<-read.table("household_power_consumption.txt",sep = ";",header=TRUE,na="?", stringsAsFactors=FALSE, dec=".")
subsetdata2<-data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] #Subset the data as required
GAP<-(subsetdata2$Global_active_power)

#Convert the Date and Time variables to Date/Time classes
DateTime<-strptime(paste(subsetdata2$Date,subsetdata2$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the plot file
png(filename = "plot2.png", width = 480, height = 480)
#Create the plot 
plot(DateTime, GAP, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()