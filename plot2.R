#Library
library(sqldf)

#Our overall goal here is simply to examine how household energy usage varies 
#over a 2-day (2007-02-01 and 2007-02-02) period in February, 2007. Your task is to reconstruct the following 
#plots below, all of which were constructed using the base plotting system.


fn <- "household_power_consumption.txt"

hpc <- read.csv.sql(fn, sql = 
                      'select * from file where Date="1/2/2007" OR Date="2/2/2007"',
                    sep=";")
sqldf()
#combine date with time?
hpc$DT <- strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")
hpc$wd <- weekdays(hpc$Date)
with(hpc, plot(DT,Global_active_power,type="n",
               ylab="Global Active Power (kilowatts)",xlab=NA))
with(hpc,lines(DT,Global_active_power))