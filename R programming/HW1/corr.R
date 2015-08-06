corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  dir <- getwd()
  setwd(directory)  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  a <- dir()
  b <- length(a)
  result <- vector('numeric')


  for (i in 1:b){
    data <- read.csv(a[i])
    data4 <- data$sulfate
    data5 <- data$nitrate
    judge1 <- (!is.na(data4)) & (!is.na(data5))
    data2 <- data[(!is.na(data4)) & (!is.na(data5)) , ]
    data3 <- nrow(data2)   
    if (data3 > threshold){
      SU <- data4[judge1]
      NI <- data5[judge1]
      RES <- cor(SU, NI)
      result <- c(result, RES) 
    }
  }
  

  setwd(dir)  
  
  result
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}