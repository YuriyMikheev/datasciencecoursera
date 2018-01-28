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