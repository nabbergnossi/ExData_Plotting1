library(sqldf)

fn <- "household_power_consumption.txt"

hpc <- read.csv.sql(fn, sql = 
                      'select * from file where Date="1/2/2007" OR Date="2/2/2007"',
                    sep=";")
sqldf()
#combine date with time?
hpc$DT <- strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

#plot 1,1
with(hpc, plot(DT,Global_active_power,type="n",
               ylab="Global Active Power (kilowatts)",xlab=NA))
with(hpc,lines(DT,Global_active_power))

#plot 1,2
with(hpc, plot(DT,Voltage,type="n",
               ylab="Voltage",xlab="datetime"))
with(hpc,lines(DT,Voltage))

#plot 2,1
with(hpc, plot(DT,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA))
with(hpc,lines(DT,Sub_metering_1))
with(hpc,lines(DT,Sub_metering_2,col="red"))
with(hpc,lines(DT,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1))

#par 2,2
with(hpc, plot(DT,Global_reactive_power,type="n",
               xlab="datetime"))
with(hpc,lines(DT,Global_reactive_power))


