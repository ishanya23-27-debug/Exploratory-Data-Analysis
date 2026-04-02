NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
total_balt <- aggregate(Emissions ~ year, data = baltimore, sum)

png("plot2.png")
plot(total_balt$year, total_balt$Emissions, type="b",
     main="Baltimore Emissions")
dev.off()
