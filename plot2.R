### Reading the two datasets 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### Cleaning the data.
mlndData<-subset(NEI, fips=="24510")
### Aggregating the data 
agrdata<-aggregate(Emissions~year,mlndData,sum)
### Creating the plot2.png file 
png(filename = "plot2.png")
### Creating the plot
barplot( height = agrdata$Emissions ,
         names.arg = agrdata$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from Baltimore City for each of the years")
dev.off()
