setwd("D:/Coursera/ExProj2/ExData_proj2")
library(ggplot2)
library(plyr)
NEI<-readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC.motor <- SCC[motor, ]
SCC.id <- as.character(SCC.motor$SCC)
NEIX<-NEI[NEI$fips == "06037" | NEI$fips == "24510", ]
NEIX$SCC <- as.character(NEIX$SCC)
NEIX.motor <- NEIX[NEIX$SCC %in% SCC.id, ]
v6<-aggregate(x=NEIX.motor$Emissions, by=list(year=NEIX.motor$year, county=NEIX.motor$fips), FUN=mean)
v6$county<-revalue(v6$county, c("06037"="Los Angeles", "24510"="Baltimore"))
qplot(data=v6,x=year,y=x,geom=c("point","line"), color=county, ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Comparison of Total Emissions by County")
dev.copy(png, file="plot6.png", width=480, height=480)
dev.off()
