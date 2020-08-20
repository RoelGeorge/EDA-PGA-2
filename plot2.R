NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mlndData<-subset(NEI, fips=="24510")
agrdata<-aggregate(Emissions~year,mlndData,sum)
png(filename = "plot2.png")
barplot( height = agrdata$Emissions ,
         names.arg = agrdata$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from Maryland for each of the years")
dev.off()
