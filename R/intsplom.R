intsplom <- function(data, group, title = "Plot",
                     outdir = "~/Desktop/intsplom/", outfile = "main.html"){


  dataname <- as.character(substitute(data))
  outdata <- paste(dataname, "data.js", sep = "-")

  gvars <- jsonifyvar(unique(data[[group]]))
  groupvar.ind <- which(names(data) == group)

  nvars <- jsonifyvar(names(data)[-groupvar.ind])

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
