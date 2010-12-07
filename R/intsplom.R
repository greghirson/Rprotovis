intsplom <- function(data, group, outdir = "~/Desktop/intsplom/"){

  gvars <- jsonifyvar(unique(data[[group]]))
  groupvar.ind <- which(names(data) == group)

  nvars <- jsonifyvar(names(data)[-groupvar.ind])

  if(!is.null(outdir)) dir.create(outdir)

  d <- jsonify(data)
  tempbrew <- "~/Rdev/Rprotovis/inst/splomdata.brew"  ## temporary brew file
  brew(file = tempbrew, output = paste(outdir, "data.js", sep = ""))
  
  
}

jsonifyvar <- function(stringvec){
  t1 = paste("\"", stringvec, "\"", sep = "")
  t2 = paste(t1, collapse = ", ")
  t3 = paste("[", t2, "]", sep = " ")
  return(t3)
}
