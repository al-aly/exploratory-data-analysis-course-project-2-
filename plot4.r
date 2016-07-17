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

# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}
library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
