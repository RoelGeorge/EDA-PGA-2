### Reading the datasets 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### Cleaning the data
BaltData<-subset(NEI, fips=="24510")
### Aggregating the data 
agrdata<-aggregate(Emissions~year+type,BaltData,sum)
### Creating the plot3.png file
png(filename = "plot3.png")
### Creating the plot
gplot<- ggplot(BaltData, aes(factor(year), color = type),Emissions) +
    geom_bar() +
    facet_grid(.~type)+
    labs(x="year", y="Total PM2.5 Emissions") +
    labs(title = "Total PM2.5 emissions in Baltimore City grouped by the type")
print(gplot)

dev.off()
