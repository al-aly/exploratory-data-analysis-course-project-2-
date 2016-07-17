#Question 1: plot1.r
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system only, make a plot showing the total PM2.5 emissions from all sources for each of the years 1999, 2002, 2005, and 2008.
#Answer:
#Yes, they sharply declined from 1999 to 2002. Then a slower decline between 2002 and 2005. Finally, they sharply declined from 2005 to 2008.

## get working dirctory
getwd()
## set working directory
setwd('~/Desktop/cousera/Exploratory Data Analysis/week4/proj2')
## download data file
data = "exdata_data.zip"
if(!file.exists(data)){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                destfile =data, method = "curl")
}
## read downloaded file (rdsformat)
NEI <- readRDS("exdata_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data/Source_Classification_Code.rds")
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()

