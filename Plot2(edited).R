f <- file.choose()

power_data <- read.table(
  f,
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

subset_data <- subset(
  power_data,
  Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")
)

subset_data$DateTime <- strptime(
  paste(subset_data$Date, subset_data$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(
  subset_data$DateTime,
  subset_data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.off()