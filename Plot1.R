 NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
EmissionPerYear<-aggregate(Emissions~year,NEI,sum)
barplot(EmissionPerYear$year,EmissionPerYear$Emissions,
        xlab = "Years",ylab = "Emission(in ton)")