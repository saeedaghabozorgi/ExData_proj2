setwd("D:/Coursera/ExProj2/ExData_proj2")
library(ggplot2)
NEI<-readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")
coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC.coal <- SCC[coal, ]
SCC.id <- as.character(SCC.coal$SCC)
NEI$SCC <- as.character(NEI$SCC)
NEI.coal <- NEI[NEI$SCC %in% SCC.id, ]
v4<-aggregate(x=NEI.coal$Emissions, by=list(year=NEI.coal$year), FUN=mean)
g<-ggplot(aes(year, x), data=v4)
g+geom_bar(stat="identity",fill="green",width=0.75) +
  guides(fill=FALSE) +
  geom_line(data=v4, aes(x=year, y=x), colour="blue") +
  labs(x="year", y=expression("Mean Emission")) + 
  labs(title=expression("Mean Coal Combustion Source Emissions Across US"))
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

