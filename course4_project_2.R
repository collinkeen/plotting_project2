## This first line will likely take a few seconds. Be patient!
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data_99 <- filter(NEI,year==1999)
data_02 <- filter(NEI,year==2002)
data_05 <- filter(NEI,year==2005)
data_08 <- filter(NEI,year==2008)

sum_99 <- sum(data_99$Emissions)
sum_02 <- sum(data_02$Emissions)
sum_05 <- sum(data_05$Emissions)
sum_08 <- sum(data_08$Emissions)

sums <- c(sum_99,sum_02,sum_05,sum_08)
years <- c(1999,2002,2005,2008)
myears <- matrix(c(years,sums), nrow = 4,ncol = 2)
yearsdf <- as.data.frame(myears)

x11()
#png("plot1.png",width=480, height=480, units = "px")
hist(yearsdf, col = "red")
dev.off()
plot(all)