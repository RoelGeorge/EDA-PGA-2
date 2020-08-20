NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

vehidata<- grepl("vehicle",NEISCC$SCC.Level.Two,ignore.case = T)
reqdata<- NEISCC[vehidata,]
reqdata1<- subset(reqdata, fips=="24510")
reqdata2<- subset(reqdata, fips=="06037")
agrdata1<- aggregate(Emissions~year, reqdata1, sum)
agrdata2<- aggregate(Emissions~year, reqdata2, sum)
rng<- c(0,8000)


png(filename = "plot6.png")
par(mfrow=c(1,2))
barplot( height = agrdata1$Emissions ,
         names.arg = agrdata1$year, ylim = rng,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from motor vehicle sources in Baltimore")
barplot( height = agrdata2$Emissions ,
         names.arg = agrdata2$year,ylim = rng,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from motor vehicle sources in Los Angeles")
dev.off()

