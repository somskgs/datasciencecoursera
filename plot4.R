#Plots for the Assignment  

library(data.table)
library(ggplot2)
mypath<-getwd()
setwd(mypath)
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
p1<-grepl("comb",SCC$SCC.Level.One,ignore.case=TRUE)
p2<-grepl("coal",SCC$SCC.Level.Four,ignore.case=TRUE)
pattern<-(p1&p2)
lg<-SCC[pattern,"SCC"]
data<-NEI[NEI$SCC %in% lg,]

myplot<-ggplot(data,aes(factor(year),Emissions))+geom_bar(stat="identity",fill="blue",width=0.70)+labs(x="Year", y ="Total PM2.5 Emissions", title="PM2.5 Coal Combustion Source Emissions Across US From  1999-2008")+
  guides(fill=FALSE)

print(myplot)
dev.copy(png,'plot4.png')
dev.off()
