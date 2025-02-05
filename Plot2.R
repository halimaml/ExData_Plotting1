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


# transform Global_active_power to numeric 

filtered_df$Global_active_power <- as.numeric(filtered_df$Global_active_power)

# Open a PNG device
png(file = "Plot2.png", width = 480, height = 480, res = 120)


# Create a basic plot canvas

with(filtered_df, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
# Close the PNG device
dev.off()











