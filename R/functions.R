#old faithful data to plot

data(faithful)


jsonify = function(dataframe){
	i1 = paste((apply(dataframe, 1, toJSON)), collapse = ",")
	i2 = paste("[", i1, "]", collapse = "")
	gsub("\\\"", "", i2)
	
	}
	


RP = function(name, data, outfile = "~/Desktop/out.html"){
	d = jsonify(data)
	tfile = system.file("template.brew", package="RProtovis")
	jsfile = system.file("protovis-r3.2.js", package="RProtovis")
	#plot params to be filled in by brew
	name = name
	xrng = range(data[,1])
	yrng = range(data[,2])
	brew(tfile, outfile)
	}
	