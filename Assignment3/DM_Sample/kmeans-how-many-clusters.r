setwd("/home/vkg/IIT/CS422/lectures/lecture-8/")

library(cluster)
library(factoextra)

data("iris")

k <- kmeans(iris[1:4], centers=3, nstart=25) # The nstart paramater attemps to run
# multiple initial configurations and reports on the best one.  Here, it will
# run 25 configurations.

fviz_cluster(k, data=iris[1:4]) # If there are > 2 dimensions in the data, 
# fviz_cluster() will run PCA on the dataset and plot the data points
# according to the first two PCs.

# What happens if we choose more clusters?
fviz_cluster(kmeans(iris[1:4], centers=4, nstart=25), data=iris[1:4])
# Is 4 enough?  Or 5?  Or 6?...
fviz_cluster(kmeans(iris[1:4], centers=5, nstart=25), data=iris[1:4])

# How many clusters?  A couple of means to visuzalize it.
fviz_nbclust(iris[1:4], kmeans, method="wss") # Elbow method minimizes total
# within-cluster sum of squares (wss).  Also called a "Scree" plot.

# Silhouette measures the quality of a cluster, i.e., how well each 
# point lies within its cluster.
fviz_nbclust(iris[1:4], kmeans, method="silhouette") # But hey, what does it know?

