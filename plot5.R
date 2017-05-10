
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

bd<-data[data$fips==24510,]

myplot<-ggplot(bd,aes(factor(year),Emissions))+geom_bar(stat="identity",fill="blue",width=0.70)+labs(x="Year", y ="Total PM2.5 Emissions", title="PM2.5  Emissions Across US Cause-vehciles From  1999-2008")+
  guides(fill=FALSE)


print(myplot)
dev.copy(png,'plot5.png')
dev.off()
