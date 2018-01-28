pollutantmean <- function(directory, polutant, id = 1:332) {
  monitorlist <- paste0(directory,"/",dir(directory)[id])
  
  tab <- data.frame()
  
  for (monitor in monitorlist)
    tab <- rbind(tab,read.table(monitor, header = TRUE, sep = ","))
  
  mean(tab[[polutant]],na.rm = TRUE)
}