#Referece to download the zip file and unzip the file 1
##download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "Assig4_1.zip",method="curl")
##zipfile1="Assig4_1.zip"
##unzip(zipfile1,exdir = getwd())

#Read the file
data1<-read.table("household_power_consumption.txt",sep = ";",header=TRUE,na="?", stringsAsFactors=FALSE, dec=".")
subsetdata2<-data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] #Subset the data as required
GAP<-(subsetdata2$Global_active_power)

#Create the plot file
png(filename = "plot1.png", width = 480, height = 480)
#Create the historgram 
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",breaks = 12, ylim = c(0, 1200))

dev.off()