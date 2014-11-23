setwd("D:/Coursera/ExProj2/ExData_proj2")
NEI<-readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
#NEI<-NEI[sample(nrow(NEI), 400), ]
NEIB<-NEI[NEI$fips == "24510", ]
v2<-aggregate(x=NEIB$Emissions, by=list(category=NEIB$year), FUN=sum)
plot(v2,type="o",xlab="year", ylab="Total Emision", main = "Total Emissions in Baltimore City, Maryland")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()