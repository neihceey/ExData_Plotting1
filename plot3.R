## reading only specific rows in data file

powercon <- read.table("household_power_consumption.txt", 
                       skip = 66637, nrow = 2880, sep=";", 
                       col.names = colnames(read.table(
                               "household_power_consumption.txt", 
                               nrow = 1, header=TRUE, sep = ";"))) 

## open PNG device; create 'plot3.png' in working directory
png(filename = "plot3.png", width = 480, height = 480)

## finds the day of the week for the dates
wkDays <- strptime(paste(powercon$Date, powercon$Time), format='%d/%m/%Y %H:%M:%S')

## plots graph
plot(wkDays, powercon$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(wkDays, powercon$Sub_metering_2, type="l", col = "red")
lines(wkDays, powercon$Sub_metering_3, type="l", col = "blue")
legend(x = "topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend
       
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       
       col=c("black", "red","blue")) # gives the legend lines the correct color and width


## close png device
dev.off()