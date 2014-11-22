setwd("D:/ExpoCoursera/ExProj2/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
NEI<-NEI[sample(nrow(NEI), 400), ]
v1<-aggregate(x=NEI$Emissions, by=list(category=NEI$year), FUN=sum)
plot(v1,type="o",xlab="year", ylab="Total Emision", main = "Total Emissions in the United States")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()