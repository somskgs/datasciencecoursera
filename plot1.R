#Plots for the Assignment  

setwd("S:/Software/R/Data Science Specialization/Exploratory Data Analysis/data")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dt<-aggregate(Emissions~year,NEI,sum)
xx<-barplot(dt$Emissions,names.arg=dt$year,col=dt$year,main="Total PM.25 Emissions USA",xlab="Year",ylab="Total Emission",ylim=c(0,8000000))
text(x=xx,y=dt$Emissions,label=round(dt$Emissions),pos=3)
dev.copy(png,'plot1.png')
dev.off()