setwd("D:/Coursera/ExProj2/ExData_proj2")

library(ggplot2)

NEI<-readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")
motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC.motor <- SCC[motor, ]
SCC.id <- as.character(SCC.motor$SCC)
NEIB<-NEI[NEI$fips == "24510", ]
NEIB$SCC <- as.character(NEIB$SCC)
NEIB.motor <- NEIB[NEIB$SCC %in% SCC.id, ]
v5<-aggregate(x=NEIB.motor$Emissions, by=list(year=NEIB.motor$year), FUN=mean)
qplot(data=v5,x=year,y=x,geom=c("point","line"),xlab="year", ylab="Mean Emision", main="Mean emissions from  motor vehicle sources")
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()
