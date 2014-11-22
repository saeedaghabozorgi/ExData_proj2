setwd("D:/ExpoCoursera/ExProj2/exdata-data-NEI_data")
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC.coal <- SCC[coal, ]
SCC.id <- as.character(SCC.coal$SCC)
NEI$SCC <- as.character(NEI$SCC)
NEI.coal <- NEI[NEI$SCC %in% SCC.id, ]
v4<-aggregate(x=NEI.coal$Emissions, by=list(year=NEI.coal$year), FUN=mean)
qplot(data=v4,x=year,y=x,geom=c("point","line"))
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

