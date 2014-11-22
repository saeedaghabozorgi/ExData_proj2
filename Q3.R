setwd("D:/ExpoCoursera/ExProj2/exdata-data-NEI_data")
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
#NEI<-NEI[sample(nrow(NEI), 400), ]
NEIB<-NEI[NEI$fips == "24510", ]
v3<-aggregate(x=NEIB$Emissions, by=list(year=NEIB$year,type=NEIB$type), FUN=sum)
#v3$year<-as.factor(v3$year)
v3$type<-as.factor(v3$type)
#qplot(data=v3,x=year,y=x,color=type,geom=c("point","line"))
qplot(data=v3,x=year,y=x,color=type,geom=c("point","smooth"),method="lm",se = FALSE)
qplot(data=v3,x=v3$year,y=v3$x,facets=v3$type~.)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()