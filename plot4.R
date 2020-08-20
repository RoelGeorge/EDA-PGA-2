NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

coaldata<- grepl("coal",NEISCC$Short.Name,ignore.case = T)
reqdata<- NEISCC[coaldata,]
agrdata<-aggregate(Emissions~year,reqdata,sum)
png(filename = "plot4.png")
barplot( height = agrdata$Emissions ,
         names.arg = agrdata$year,
         xlab = "Years",ylab = "total PM2.5 emission",
         main="total PM2.5 emission from coal comburstion related sources")
dev.off()
