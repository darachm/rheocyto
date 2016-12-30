#' Read coulterZ2 data files and make a dataframe
#' 
#' This reads a directory of Z2 files from the coulter counter.
#' 
#' @param datadir this is a directory of Z2 files
#' 
#' @return dataframe of Z2 data, with columns "binDiameter" (the 
#' diameter of a certain bin), "binCounts" (the counts of events in 
#' that bin), and "fileName" (the file read for that observation).
#' 
#' @examples
#' cz2 <- coulterZ2reader("exampleFlowDataset2")

coulterZ2reader <- function(datadir) {
#first, a list for datasets
  dat <- list()
#then open up each file
  for (fz in dir(datadir)) {
#crudely, we just readlines...
  	tmp <- readLines(paste0(datadir,fz))
#and look for the keywords for the bin diameters
  	binunits <-  as.numeric(tmp[
      (grep("Bindiam",tmp)+1):   (grep("Binunits",tmp)-1)])
#and then the height, so the counts in that bin
  	binheight <- as.numeric(tmp[
      (grep("Binheight",tmp)+1): (grep("\\[end\\]",tmp)-1)])
# and take that slice into a data.frame for return
  	dat[[fz]] <- data.frame(binDiameter=binunits,binCounts=binheight,fileName=fz)
  }
#this part could be better, but this has no dependencies so that's nice
#we simply build a larger dataframe from each of the small ones
  lrgdf <- data.frame(dat[[1]])
  for (fz in names(dat)[2:length(dat)]) {
  	lrgdf <- rbind(lrgdf,dat[[fz]])
  }
  return(lrgdf)
}
