
### download necessary packages 

library(chron)
# read the text file 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#tranfrom the date  to POSIXIT format 
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
# convert time to chron fromat 

data$Time <- chron(times = data$Time)
#combine date and time columns and convert to posixct

data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")



# Define the desired date range
start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

# Filter rows based on the date range
filtered_df <- data[data$Date >= start_date & data$Date <= end_date, ]


# transform VARIABLES to numeric 

filtered_df$Sub_metering_1 <- as.numeric(filtered_df$Sub_metering_1)
filtered_df$Sub_metering_2 <- as.numeric(filtered_df$Sub_metering_2)
filtered_df$Sub_metering_3 <- as.numeric(filtered_df$Sub_metering_3)

# Open a PNG device
png(file = "Plot3.png", width = 800, height = 600, res = 120)



###create the graph
# the initial plot
with(filtered_df, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = ""))
#add lines for the two other parameters 
lines(filtered_df$datetime, filtered_df$Sub_metering_2, type = "l", col = "red")
lines(filtered_df$datetime, filtered_df$Sub_metering_3, type = "l", col = "blue")
#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , col = c("black", "red", "blue"), lty = c(1, 1, 1))


# Close the PNG device
dev.off()





