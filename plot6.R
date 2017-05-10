
#Plots for the Assignment  

library(data.table)
library(ggplot2)
mypath<-getwd()
setwd(mypath)
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

p1<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)

lg<-SCC[p1,"SCC"]

data<-NEI[NEI$SCC %in% lg,]

baltimore<-data[data$fips==24510,]
baltimore$city<-"Baltimore City"
losangels<-data[data$fips=="06037",]
losangels$city<-"Los Angeles County"
maindata<-rbind(baltimore,losangels)

myplot<-ggplot(maindata,aes(factor(year),Emissions,fill=city))+geom_bar(fill=maindata$year,stat="identity",width=0.70)+
  labs(x="Year", y ="Total PM2.5 Emissions", title="Motor Vehicle Emissions 1999-2008 At Baltimore & Los Angels")+
guides(fill=FALSE)+facet_grid(scales="free",space="free",.~city)

print(myplot)
dev.copy(png,'plot6.png')
dev.off()
