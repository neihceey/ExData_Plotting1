## reading only specific rows in data file

powercon3 <- read.table("household_power_consumption.txt", 
                        skip = 66637, nrow = 2880, sep=";", 
                        col.names = colnames(read.table(
                                "household_power_consumption.txt", 
                                nrow = 1, header=TRUE, sep = ";"))) 

## open PNG device; create 'plot1.png' in working directory
png(filename = "plot1.png", width = 480, height = 480)

## plot histogram
hist(powercon3$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

## close png device
dev.off()

