# Part 1
# Write a function named 'pollutantmean' that calculates the mean of a 
# pollutant (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory'
# argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id=1:332) {
  # directory : 
  # - char vector of length 1
  # - indicating the location of the CSV files
  
  # pollutant : 
  # - char vector of length 1
  # - indicating the name of the pollutant for which we will calculate the mean
  # - either "sulfate" or "nitrate"
  # Initialize a list to store the data
  data_list <- list()
  
  for(i in id) {
    file_path <- sprintf("%s/%03d.csv", directory, i)
    data <- read.csv(file_path)
    data_list[[i]] <- data
  }
  
  all_data <- do.call("rbind", data_list)
  
  # calculate mean, ignore NAs
  mean_pollutant <- mean(all_data[[pollutant]], na.rm = TRUE)
  
  return(mean_pollutant)
}
