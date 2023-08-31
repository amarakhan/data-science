# Part 3

# Write a function in R that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and nitrate 
# for monitor locations where the number of completely observed cases 
# (on all variables) is greater than the threshold. The function should return 
# a vector of correlations for the monitors that meet the threshold requirement.
# If no monitors meet the threshold requirement, then the function should 
# return a numeric vector of length 0.

corr <- function(directory, threshold = 0) {
   
  # directory :
  # - char vector of length 1
  # - indicating the location of the CSV files
  
  # threshold :
  # - numeric vector of length 1
  # - indicating the number of completely observed observations 
  #   (on all variables) required to compute the correlation between nitrate and sulfate
  # - default is 0
  
  complete_info <- complete(directory)
  filtered_data <- subset(complete_info, nobs > threshold)
  
  # init vector to store correlations
  correlation_data <- numeric(0)
  
  for (i in filtered_data$id) {
    
    file_name <- sprintf("%03d.csv", i)
    path <- file.path(directory, file_name)
    data <- read.csv(path)
    
    # skip if 'sulfate' or 'nitrate' column is missing
    if (!('sulfate' %in% names(data)) || !('nitrate' %in% names(data))) {
      next
    }
    
    complete_data <- data[complete.cases(data$sulfate, data$nitrate),]
    correlation <- cor(complete_data$sulfate, complete_data$nitrate)
    correlation_data <- c(correlation_data, correlation)
  }
  
  return(correlation_data)
}

