#Library
library(sqldf)

fn <- "household_power_consumption.txt"

hpc <- read.csv.sql(fn, sql = 
                      'select * from file where Date="1/2/2007" OR Date="2/2/2007"',
                    sep=";")
sqldf()
#combine date with time?
hpc$DT <- strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")
hpc$wd <- weekdays(hpc$Date)
with(hpc, plot(DT,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA))
with(hpc,lines(DT,Sub_metering_1))
with(hpc,lines(DT,Sub_metering_2,col="red"))
with(hpc,lines(DT,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1))
