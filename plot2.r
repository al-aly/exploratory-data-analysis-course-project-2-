## Question 2: plot2.r
## Have total emissions from PM_2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
## Answer:
##   The data indicate a sharp decline between 1999 and 2002. A sharp increase occurred from 2002 to 2005. Finally, another sharp decrease occurred from 2005 to 2008.

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
## Step 1:read downloaded file (rdsformat)
NEI <- readRDS("exdata_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data/Source_Classification_Code.rds")
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()