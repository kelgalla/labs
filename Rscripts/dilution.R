library(affy)
fns <- list.celfiles(path="CEL",full=TRUE)
pData <- read.table("dilution_pdata.txt",header=TRUE)
stopifnot(all(pData$filename == grep("CEL\\/(.+)\\.cel","\\1",fns)))
celData <- ReadAffy(filenames=fns,phenoData=pData,verbose=TRUE)
dilution <- rma(celData,verbose=TRUE)
save(dilution, file="dilution.RData")
