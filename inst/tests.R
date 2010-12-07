#iris data

iris2 <- iris # need to replace . in variable names
names(iris2) = gsub("\\.", "", names(iris2)) 

intsplom(iris2, "Species", outfile = "iris2.html")


#USArrests, groups by k-means (3)

set.seed(5)
cl <- kmeans(USArrests, 3)$cluster
USA <- USArrests
USA$cluster = paste("Cluster", letters[cl], sep = "")

intsplom(USA, "cluster", outfile = "USArrests.html")
