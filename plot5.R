### Reading the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### Merging the data to produce a combined data set
NEISCC <- merge(NEI, SCC, by="SCC")
### Filtering data related to motor Vehicles 
vehidata<- grepl("vehicle",NEISCC$SCC.Level.Two,ignore.case = T)
### Cleaning and aggregating the dataset
reqdata<- NEISCC[vehidata,]
reqdata1<- subset(reqdata, fips=="24510")
agrdata<- aggregate(Emissions~year, reqdata1, sum)
### Creating the plot5.png file 
png(filename = "plot5.png")
### Adding the graph to the plot
barplot( height = agrdata$Emissions ,
         names.arg = agrdata$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from motor vehicle sources in Baltimore")
dev.off()
