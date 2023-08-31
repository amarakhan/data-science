# Part 2
# Write a function that reads a directory full of files and reports the 
# number of completely observed cases in each data file. The function 
# should return a data frame where the first column is the name of the 
# file and the second column is the number of complete cases.


complete <- function(directory, id = 1:332) {

  results <- data.frame(id = integer(0), nobs = integer(0))
  
  for (i in id) {
    file_name <- sprintf("%03d.csv", i)
    path <- file.path(directory, file_name)
    
    # check if file exists
    if (file.exists(path)) {
      data <- read.csv(path)
      # get the number of completely observed cases
      complete_cases <- sum(complete.cases(data))
      # append to data frame
      results <- rbind(results, data.frame(id = i, nobs = complete_cases))
    }
  }
  return(results)
}
