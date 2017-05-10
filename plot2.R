#Plots for the Assignment  

library(data.table)
setwd("S:/Software/R/Data Science Specialization/Exploratory Data Analysis/data")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data<-NEI[NEI$fips=="24510",]
dt<-aggregate(Emissions~year,data,sum)
xx<-barplot(dt$Emissions,names.arg=dt$year,col=dt$year,main="Total PM.25 Emissions At Baltimore Maryland",xlab="Year",ylab="Total Emission",ylim=c(0,4000))
text(x=xx,y=dt$Emissions,label=round(dt$Emissions),pos=3)
dev.copy(png,'plot2.png')
dev.off()