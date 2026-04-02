NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

la_veh <- subset(veh_data, fips == "06037")

balt_veh$city <- "Baltimore"
la_veh$city <- "Los Angeles"

combined <- rbind(balt_veh, la_veh)

png("plot6.png")

ggplot(combined, aes(x=year, y=Emissions, color=city)) +
  stat_summary(fun=sum, geom="line") +
  stat_summary(fun=sum, geom="point") +
  labs(title="Baltimore vs LA Vehicle Emissions")

dev.off()