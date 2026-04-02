NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- SCC[grep("coal", SCC$Short.Name, ignore.case=TRUE), ]

coal_data <- merge(NEI, coal, by="SCC")
total_coal <- aggregate(Emissions ~ year, data = coal_data, sum)

png("plot4.png")
plot(total_coal$year, total_coal$Emissions, type="b",
     main="Coal Emissions in US")
dev.off()