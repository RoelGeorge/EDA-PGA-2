### Reading the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### Merging the data to produce a combined data set
NEISCC <- merge(NEI, SCC, by="SCC")
### Filtering data related to motor Vehicles
vehidata<- grepl("vehicle",NEISCC$SCC.Level.Two,ignore.case = T)
### Cleaning and aggregating data (Citywice)
reqdata<- NEISCC[vehidata,]
reqdata1<- subset(reqdata, fips=="24510")
reqdata2<- subset(reqdata, fips=="06037")
agrdata1<- aggregate(Emissions~year, reqdata1, sum)
agrdata2<- aggregate(Emissions~year, reqdata2, sum)
rng<- c(0,8000)
### Creating the plot6.png file 
png(filename = "plot6.png")
par(mfrow=c(1,2))
### Adding the graphs to plot6.png 
barplot( height = agrdata1$Emissions ,
         names.arg = agrdata1$year, ylim = rng,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from motor vehicle sources in Baltimore")
barplot( height = agrdata2$Emissions ,
         names.arg = agrdata2$year,ylim = rng,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from motor vehicle sources in Los Angeles")
dev.off()

