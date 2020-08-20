 NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
EmissionPerYear<-aggregate(Emissions~year,NEI,sum)
png(filename = "plot1.png")
barplot( height =  EmissionPerYear$Emissions,
         names.arg = EmissionPerYear$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from all sources for each of the years")
dev.off()
