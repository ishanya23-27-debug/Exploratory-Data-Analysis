
# Plot 1 - Exploratory Data Analysis assignment
# Loading household power consumption data
power_data <- read.table(
  file.choose(),
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Checking structure
head(power_data)
str(power_data)

# Convert Date column to Date format
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

# Filter data for 1 Feb 2007 and 2 Feb 2007
subset_data <- subset(
  power_data,
  Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")
)

# Check filtered data
head(subset_data)
dim(subset_data)

# Convert Global_active_power to numeric if needed
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Create histogram and save as PNG
png("plot1.png", width = 480, height = 480)

hist(
  subset_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

dev.off()
