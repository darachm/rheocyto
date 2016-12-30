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

fs2df <- function(x) {
  for (i in sampleNames(x)) {
    if (nrow(exprs(x[[i]]))) {
      if (exists("returnDF")) {
        returnDF <- rbind(returnDF,
          data.frame(pData(x[i]),exprs(x[[i]]),row.names=NULL)
          )
      } else {
        returnDF <- data.frame(pData(x[i]),exprs(x[[i]]),row.names=NULL)
      }
    }
  }
  return(returnDF)
}

