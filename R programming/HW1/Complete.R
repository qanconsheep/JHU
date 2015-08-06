complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  dir <- getwd()
  setwd(directory)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  read <- function(num){
    ThreeNum <- sprintf("%03.0f", num)
    NumStr <- paste(ThreeNum, ".csv", sep = "")
    Result <- read.csv(NumStr)
  }  
  a <- data.frame(integer(0),  integer(0))
  for (i in id){
    data <- read(i)
    data4 <- data$sulfate
    data5 <- data$nitrate
    data2 <- data[(!is.na(data4)) & (!is.na(data5)) , ]
    data3 <- nrow(data2)
    a <- rbind(a,c(i,data3))
  }
  names(a) <- c("id","nobs")
  setwd(dir)
  
  a
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}