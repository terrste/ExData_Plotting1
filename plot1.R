plot1<-function(){
  library(dplyr)
  print("reading data from household_power_consumption.txt...")
  tbdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?")
  filtereddata<-filter(tbdata,grepl('^1/2/2007|^2/2/2007',Date))
  png(file="plot1.png",width =480,height = 480,units="px")
  fd<-mutate(filtereddata, dateTime = as.POSIXct(paste(Date, Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
  hist(as.numeric(filtereddata$Global_active_power),xlab="Global Active Power (kilowatts)",ylab="Frequency", col="red",main ="Global Active Power" )
  dev.off()
  print("created plot1.png")
}

plot1()