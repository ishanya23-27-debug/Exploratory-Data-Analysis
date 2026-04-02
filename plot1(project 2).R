NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- aggregate(Emissions ~ year, data = NEI, sum)

png("plot1.png")
plot(total$year, total$Emissions, type="b",
     xlab="Year", ylab="Total Emissions",
     main="Total PM2.5 Emissions in US")
dev.off()
