# Plot 3 
# Choosing file manually
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

# Convert sub metering columns to numeric
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

# Create plot
png("plot3.png", width = 480, height = 480)

plot(
  subset_data$DateTime,
  subset_data$Sub_metering_1,
  type = "l",
  col = "black",
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

dev.off()