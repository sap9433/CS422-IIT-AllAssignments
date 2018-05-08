# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology

# DBSCAN clustering on non-globular data

library(fpc)
library(factoextra)
library(dbscan)

set.seed(123)

rm(list=ls())

data("multishapes", package = "factoextra")
df <- multishapes[, 1:2]

plot(df, main="Raw points before DBSCAN")

# Let's run k-means on this first.  Choose a value of k...
k <- kmeans(df, centers=5, nstart=25)
fviz_cluster(k, df)

# ---- Now, onto dbscan
# Run dbscan
db <- fpc::dbscan(df, eps = 0.15, MinPts = 5)
plot(db, df, main = "DBSCAN", frame = FALSE)

# You can also draw this using fviz_cluster
fviz_cluster(db, df, stand = FALSE, ellipse = F, geom = "point")

# In the output below, column names are cluster numbers.  Cluster 0 corresponds
# to noise (outliers)
print(db)

# How to determine eps and k (MinPts)?
# k is provided by the user.  EPS is determined by looking at the "knee".
# For example, head(kNNdist(df, k=5)) shows a numeric vector with distance
# to its k-nearest neighbours.  kNNdistplot() samples the points from df and
# calculates the distance to 5-NN.  Look at the "knee" and you will find the
# (pot of gold, err) eps.
dbscan::kNNdistplot(df, k =  5)
abline(h = 0.15, lty = 2)
