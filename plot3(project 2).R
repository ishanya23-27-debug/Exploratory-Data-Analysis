NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

png("plot3.png")

ggplot(baltimore, aes(x=year, y=Emissions, color=type)) +
  stat_summary(fun=sum, geom="line") +
  stat_summary(fun=sum, geom="point") +
  labs(title="Emissions by Type in Baltimore")

dev.off()
