# Roadmap

## Transparency
The user should be able to treat the plotting device much lik
the default plot method, maybe more along the lines of xyplot in
lattice for grouping/color. i.e.

    plot(y ~ x, data = df)

should work, as should

    plot(x, y)

The other way to do this would be forgo all of the formula business and
require explicit x, y values, like [ggplot2](http://had.co.nz/ggplot2/
"ggplot2").
    
## Plot type
Two different methods for picking the correct type of plot are possible.
One is to use the base paradigm, where S3 is used to pick which hidden
plotting function to use based on the class/format of the data.


The other method is to use the lattice model, where there are different
functions for drastically different plot types- boxplots vs. scatterplots vs.
dotplots.


## Interactive SPLOMS

interactive sploms have been implemented (tenuously) in intsplom.

Call as `intsplom(data, "group column", outfile = "outfile.html")`

As an example, we use the iris data, though first we need to 
derive a new dataset that takes out the periods (.) from the
variable names:

    iris2 <- iris # need to replace . in variable names
    names(iris2) = gsub("\\.", "", names(iris2)) 
    
    intsplom(iris2, "Species", outfile = "iris2.html")
    
which will, as a poor default, write to a directory on
the desktop call intsplom/ with three files - the protovis-r3.2.js file,
the data file call iris-data.js and the iris2.html file with the script
to produce the plot.
