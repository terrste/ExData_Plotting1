plot3<-function(){
  
  library(dplyr)
  
  print("reading data from household_power_consumption.txt...")
  
  tbdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?")
  filtereddata<-filter(tbdata,grepl('^1/2/2007|^2/2/2007',Date))
  
  png(file="plot3.png",width =480,height = 480,units="px")
  
  fd<-mutate(filtereddata, dateTime = as.POSIXct(paste(Date, Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
  
  yMax <-  max(max(fd$Sub_metering_1),max(fd$Sub_metering_2),max(fd$Sub_metering_3))
  with(fd,plot(dateTime,Sub_metering_1,type='l',col="black",xlab="",ylab = "Energy sub metering",ylim = c(0,yMax)))
  par(new=T)
  with(fd,plot(dateTime,Sub_metering_2,type='l',col="red",xlab="",ylab="",ylim = c(0,yMax)))
  par(new=T)
  with(fd,plot(dateTime,Sub_metering_3,type='l',col="blue",xlab="",ylab="",ylim = c(0,yMax)))
  par(new=F)
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),col=c('black','red','blue'))
  
  dev.off()
  print("created plot3.png")
}

plot3()