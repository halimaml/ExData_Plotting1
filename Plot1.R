

# read the text file 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#tranfrom the date  to POSIXIT format 
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

# Define the desired date range
start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

# Filter rows based on the date range
filtered_df <- data[data$Date >= start_date & data$Date <= end_date, ]

# replace ? by NA 

filtered_df$Global_active_power[filtered_df$Global_active_power == "?"] <- NA

# transform variables to numeric 

filtered_df$Global_active_power <- as.numeric(filtered_df$Global_active_power)

# Open a PNG device
png(file = "Plot1.png", width = 480, height = 480, res = 120)

#plot 

with(filtered_df, hist(Global_active_power, main = "Global Active Power", col= "red", xlab = "Global Active Power (Kilowatts)" ))

# Close the PNG device
dev.off()
