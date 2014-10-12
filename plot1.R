#Library
library(sqldf)

#Our overall goal here is simply to examine how household energy usage varies 
#over a 2-day (2007-02-01 and 2007-02-02) period in February, 2007. Your task is to reconstruct the following 
#plots below, all of which were constructed using the base plotting system.


fn <- "household_power_consumption.txt"

hpc <- read.csv.sql(fn, sql = 
                      'select * from file where Date="2/1/2007" OR Date="2/2/2007"',
                    sep=";")
sqldf()
#combine date with time?
hpc$DT <- strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")

#Global Active Power
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)"
     ,col="red",breaks=22,xaxt="n",xlim=c(0,6),ylim=c(0,1200)) 
axis(1, at=c(0,10), labels=c("",""), lwd.ticks=0)
axis(1, at=seq(0 , 6, by=2), lwd=1)
axis(2, at=seq(0,1200,by=200))

#removed seq(0,6,by=.5) as value for breaks