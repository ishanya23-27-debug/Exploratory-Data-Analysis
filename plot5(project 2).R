NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- SCC[grep("vehicle", SCC$Short.Name, ignore.case=TRUE), ]

veh_data <- merge(NEI, vehicles, by="SCC")
balt_veh <- subset(veh_data, fips == "24510")

total_balt_veh <- aggregate(Emissions ~ year, data = balt_veh, sum)

png("plot5.png")
plot(total_balt_veh$year, total_balt_veh$Emissions, type="b",
     main="Vehicle Emissions in Baltimore")
dev.off()