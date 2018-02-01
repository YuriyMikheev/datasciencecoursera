complete <- function(directory, id = 1:332) {
  
  monitorlist <- paste0(directory,"/",dir(directory)[id])
  
  v <- vector();
  for (monitor in monitorlist) {
    tab <- read.table(monitor, header = TRUE, sep = ",")
    v <- c(v,length(tab$sulfate[!is.na(tab$sulfate) & !is.na(tab$nitrate)]))
  }
  
  
  tr <- data.frame(id,nobs = v)
  tr
}