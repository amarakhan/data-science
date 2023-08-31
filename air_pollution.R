# R script for testing functions: pollutantmean, complete, corr

print(R.version.string)

# calculate the mean of a pollutant (sulfate or nitrate) across a specified list of monitors
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)

# number of completely observed cases in each data file
source("complete.R")
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

# calculate the correlation between sulfate and nitrate
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
