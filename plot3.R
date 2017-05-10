#Plots for the Assignment  

library(data.table)
library(ggplot2)
mypath<-getwd()
setwd(mypath)
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data<-NEI[NEI$fips=="24510",]
print(head(data))
myplot<-ggplot(data,aes(factor(year),Emissions,fill=type))+geom_bar(stat="identity")+facet_grid(.~type,scales="free",space="free")+labs(x="Year", y ="Total PM2.5 Emissions", title="PM2.5 Emissions, Baltimore City Year 1999-2008")+
guides(fill=FALSE)

print(myplot)
dev.copy(png,'plot3.png')
dev.off()