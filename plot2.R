## reading only specific rows in data file

powercon <- read.table("household_power_consumption.txt", 
                        skip = 66637, nrow = 2880, sep=";", 
                        col.names = colnames(read.table(
                                "household_power_consumption.txt", 
                                nrow = 1, header=TRUE, sep = ";"))) 

## open PNG device; create 'plot2.png' in working directory
png(filename = "plot2.png", width = 480, height = 480)

## finds the day of the week for the dates
wkDays <- strptime(paste(powercon$Date, powercon$Time), format='%d/%m/%Y %H:%M:%S')

## plots graph
plot(wkDays, powercon$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close png device
dev.off()