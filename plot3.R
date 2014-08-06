library(data.table)
library(datasets)

# Prepare the 480x480 png file
png(file = "plot3.png", units = "px", bg = "transparent", width=480, height=480)

# Read the file and save it in a data.table
# Missing or ? values are saved as NA
DT <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("", "?"))

# We will only be using data from the dates 2007-02-01 and 2007-02-02
valid_dates <- c(as.Date("2007-02-01"),as.Date("2007-02-02"))
my_data <- subset(DT, as.Date(DT$Date, format="%d/%m/%Y") %in% valid_dates)

# Plot the data, with lines, without x axis ticks (they will be built later on)
with(my_data, plot(as.numeric(Sub_metering_1), type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = ""))
with(my_data, lines(Sub_metering_2, col = "red"))
with(my_data, lines(Sub_metering_3, col = "blue"))

# Prepare the x-axis labels (including the Saturday, as shown in Coursera's assignment)
valid_dates <- c(valid_dates, as.Date("2007-02-03"))
# Set the language to English
Sys.setlocale("LC_TIME", "C")
# Save the days labels
x_axis_labels <- format(valid_dates, "%a")
# There are 1440 values for each day, print x_axis
axis(1, at=c(0,1440,2880), x_axis_labels)

# Add the legend
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the graphic device
dev.off()