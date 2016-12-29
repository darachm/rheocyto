#' Read coulterZ2 data files and make a dataframe
#' 
#' This reads a directory of Z2 files from the coulter counter.
#' 
#' @param datadir this is a directory of Z2 files
#' 
#' @return dataframe of Z2 data
#' @export
#' @examples
#' cz2 <- coulterZ2reader("exampleFlowDataset2")
#' dist <- coulterdf2distribution(cz2)

coulterdf2distribution <- function(someCoulterdf) {

	return(as.numeric(rep(someCoulterdf$bins,someColuterdf$height)))
}

