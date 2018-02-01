pollutantmean <- function(directory, polutant, id = 1:332) {
  monitorlist <- paste0(directory,"/",dir(directory)[id])
  
  tab <- data.frame()

  for (monitor in monitorlist)
    tab <- rbind(tab,read.table(monitor, header = TRUE, sep = ","))

  mean(tab[[polutant]],na.rm = TRUE)
}

complete <- function(directory, id = 1:332) {
  
  monitorlist <- paste0(directory,"/",dir(directory)[id])
  
  v <- vector();
  for (monitor in monitorlist) {
    tab <- read.table(monitor, header = TRUE, sep = ",")
    v <- c(v,length(tab$sulfate[!is.na(tab$sulfate) & !is.na(tab$nitrate)]))
  }


  tr <- data.frame(id,v)
  tr
}

corr <- function(directory, threshold = 0) {
  monitorlist <- paste0(directory,"/",dir(directory))
  
  v <- vector();
  for (monitor in monitorlist) {
    tab <- read.table(monitor, header = TRUE, sep = ",")
    if (length(tab$sulfate[!is.na(tab$sulfate) & !is.na(tab$nitrate)]) > threshold)
      v <- c(v,cor(tab$sulfate, tab$nitrate,  use = "complete.obs"))
  }
  
  v
}