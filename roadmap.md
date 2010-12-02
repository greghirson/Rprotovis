# Roadmap

## Transparency
The user should be able to treat the plotting device much lik
the default plot method, maybe more along the lines of xyplot in
lattice for grouping/color. i.e.

    plot(y ~ x, data = df)

should work, as should

    plot(x, y)

The other way to do this would be forgo all of the formula business and
require explicit x, y values, like ("http://had.co.nz/ggplot2"
title = "ggplot2").
    
## Plot type
Two different methods for picking the correct type of plot are possible.
One is to use the base paradigm, where S3 is used to pick which hidden
plotting function to use based on the class/format of the data.


The other method is to use the lattice model, where there are different
functions for drastically different plot types- boxplots vs. scatterplots vs.
dotplots.
