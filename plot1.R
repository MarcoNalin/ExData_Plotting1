library(data.table)
library(datasets)

# Prepare the 480x480 png file
png(file = "plot1.png", units = "px", bg = "transparent", width=480, height=480)

# Read the file and save it in a data.table
# Missing or ? values are saved as NA
DT <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("", "?"))

# We will only be using data from the dates 2007-02-01 and 2007-02-02
my_data <- subset(DT, as.Date(DT$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Create the histogram
hist(as.numeric(my_data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the graphic device
dev.off()