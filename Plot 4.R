# Plot 4 - SAFE VERSION

# Selecting file manually
f <- file.choose()

# Load data
power_data <- read.table(
  f,
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Convert Date
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

# Filter required dates
subset_data <- subset(
  power_data,
  Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")
)

# Create DateTime
subset_data$DateTime <- strptime(
  paste(subset_data$Date, subset_data$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

# Convert required columns to numeric (VERY IMPORTANT)
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Voltage <- as.numeric(subset_data$Voltage)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)
subset_data$Global_reactive_power <- as.numeric(subset_data$Global_reactive_power)

# Create plot

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Top-left
plot(
  subset_data$DateTime,
  subset_data$Global_active_power,
  type = "l",
  ylab = "Global Active Power",
  xlab = ""
)

# Top-right
plot(
  subset_data$DateTime,
  subset_data$Voltage,
  type = "l",
  ylab = "Voltage",
  xlab = "datetime"
)

# Bottom-left
plot(
  subset_data$DateTime,
  subset_data$Sub_metering_1,
  type = "l",
  ylab = "Energy sub metering",
  xlab = ""
)

lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

# Bottom-right
plot(
  subset_data$DateTime,
  subset_data$Global_reactive_power,
  type = "l",
  ylab = "Global Reactive Power",
  xlab = "datetime"
)

dev.off()