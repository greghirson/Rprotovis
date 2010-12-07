intsplom <- function(data, group, title = "Plot",
                     outdir = "~/Desktop/intsplom/", outfile = "main.html"){


  dataname <- as.character(substitute(data))
  outdata <- paste(dataname, "data.js", sep = "-")

  gvars <- jsonifyvar(unique(data[[group]]))
  groupvar.ind <- which(names(data) == group)

  nvars <- jsonifyvar(names(data)[-groupvar.ind])

  cols <- makecolors(length(unique(data[[group]])))
  
  if(!is.null(outdir)) dir.create(outdir)

  d <- jsonify(data)
  databrew <- "~/Rdev/Rprotovis/inst/splomdata.brew"  ## temporary brew file
  mainbrew <- "~/Rdev/Rprotovis/inst/splom.brew"  ## temporary brew file
  brew(file = databrew, output = paste(outdir, outdata, sep = ""))
  brew(file = mainbrew, output = paste(outdir, outfile, sep = ""))
  file.copy(system.file("protovis-r3.2.js", package = "Rprotovis"),
            paste(outdir, "protovis-r3.2.js", sep = ""))
  
}

jsonifyvar <- function(stringvec){
  t1 = paste("\"", stringvec, "\"", sep = "")
  t2 = paste(t1, collapse = ", ")
  t3 = paste("[", t2, "]", sep = " ")
  return(t3)
}


makecolors <- function(n){
  #uses "Set 3" from RColorBrewer
  cols <- c("#8DD3C7", "#FFFFB3", "#BEBADA", "#FB8072", "#80B1D3",
            "#FDB462", "#B3DE69", "#FCCDE5", "#D9D9D9", "#BC80BD")
  
  ncols <- cols[(seq(n))]
  rgbcols <- round(col2rgb(ncols)/255, 2)*100

  dimcols <- dim(rgbcols)
  dimchar <- matrix(paste(as.character(rgbcols), "%", sep = ""), nrow = dimcols[1])
  
  nrgb <- apply(dimchar, 2, paste, collapse = ",")
  outcol <- paste("\"rgba(", nrgb, ",0.7)\"", sep = "", collapse = ",\n")
  outcol <- paste(outcol, "),", sep = "")
  return(outcol)
}
