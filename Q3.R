setwd("D:/Coursera/ExProj2/ExData_proj2")
library(ggplot2)
NEI<-readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
#NEI<-NEI[sample(nrow(NEI), 400), ]
NEIB<-NEI[NEI$fips == "24510", ]
v3<-aggregate(x=NEIB$Emissions, by=list(year=NEIB$year,type=NEIB$type), FUN=sum)
#v3$year<-as.factor(v3$year)
v3$type<-as.factor(v3$type)
#qplot(data=v3,x=year,y=x,color=type,geom=c("point","smooth"),method="lm",se = FALSE,xlab="year", ylab="Total Emision", main = "Trend of emissions from 1999-2008 for Baltimore City")
g<-ggplot(aes(year, x, colour = factor(type)), data=v3)
g+geom_point() +
  geom_line(alpha="1",,linetype="dotted") +
  stat_smooth(method = "lm", se = FALSE) +
  facet_grid(.~ type) +
  labs(x="year", y=expression("Mean Emission")) + 
  labs(title=expression("Trend of Mean Coal Combustion Source Emissions Across US"))
dev.copy(png, file="plot3.png", width=780, height=380)
dev.off()



dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()