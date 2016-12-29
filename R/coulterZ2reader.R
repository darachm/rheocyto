
coulterZ2reader <- function(datadir) {
  dat <- list()
  for (fz in dir(datadir)) {
# crude, we just readlines...
  	tmp <- readLines(paste0(datadir,fz))
# and look for the keywords
  	binunits<-as.numeric(tmp[(grep("Bindiam",tmp)+1):(grep("Binunits",tmp)-1)])
  	binheight<-as.numeric(tmp[(grep("Binheight",tmp)+1):(grep("\\[end\\]",tmp)-1)])
# and take that slice into a data.frame for return
  	dat[[fz]] <- data.frame(bins=binunits,height=binheight,fz=fz)
  }
# this part could be better, but this has no dependencies so that's nice
  lrgdf <- data.frame(dat[[1]])
  for (fz in names(dat)[2:length(dat)]) {
  	lrgdf <- rbind(lrgdf,dat[[fz]])
  }
  return(lrgdf)
}

df2distribution <- function(somedf) {
	return(as.numeric(rep(somedf$bins,somedf$height)))
}
