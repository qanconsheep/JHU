pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  dir <- getwd()
  setwd(directory)
  read <- function(num){
    ThreeNum <- sprintf("%03.0f", num)
    NumStr <- paste(ThreeNum, ".csv", sep = "")
    Result <- read.csv(NumStr)
  }
  a <- vector('numeric')
  for (i in id){
    data <- read(i)
    data2 <- data[pollutant]
    data3 <- data2[!is.na(data2)]
    a <- c(a,data3)
  }
  
  setwd(dir)
  
  MeanVal <- mean(a)
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}