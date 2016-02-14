plot2<-function(){
  library(dplyr)
  print("reading data from household_power_consumption.txt...")
  tbdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?")
  filtereddata<-filter(tbdata,grepl('^1/2/2007|^2/2/2007',Date))
  png(file="plot2.png",width =480,height = 480,units="px")
  
  fd<-mutate(filtereddata, dateTime = as.POSIXct(paste(Date, Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
  with(fd,plot(dateTime,Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)"))
  dev.off()
  print("created plot2.png")
}

plot2()