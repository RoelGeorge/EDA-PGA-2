### Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
###  Merging the data to produce a combined data.
NEISCC <- merge(NEI, SCC, by="SCC")
### Searching for data related to coal comburstion 
coaldata<- grepl("coal",NEISCC$Short.Name,ignore.case = T)
###Cleaning the data 
reqdata<- NEISCC[coaldata,]
agrdata<-aggregate(Emissions~year,reqdata,sum)
### Creating the plot4.png file 
png(filename = "plot4.png")
### Adding the graph to plot4.png
barplot( height = agrdata$Emissions ,
         names.arg = agrdata$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from coal comburstion related sources")
dev.off()
