NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

vehidata<- grepl("vehicle",NEISCC$SCC.Level.Two,ignore.case = T)
reqdata<- NEISCC[vehidata,]
reqdata1<- subset(reqdata, fips=="24510")
agrdata<- aggregate(Emissions~year, reqdata1, sum)

png(filename = "plot5.png")
barplot( height = agrdata$Emissions ,
         names.arg = agrdata$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from motor vehicle sources in Baltimore")
dev.off()
