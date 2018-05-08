?# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology

# Clustering and the Silhouette width separation metric.
# 
# Note: Using factoextra::eclust() instead of stock stats::hclust() we used
# before.

library(cluster)
library(factoextra)

rm(list=ls())

data(iris)

# Scale the data
d <- scale(iris[,1:4])

hc.complete <- eclust(d, "hclust", k = 3, hc_method="complete")
fviz_dend(hc.complete, show_labels=FALSE, palette="jco", as.ggplot=T)

# Cut at around Height = 5 to get 3 clusters, or
clusters.3 <- cutree(hc.complete, 3)
s <- cluster::silhouette(clusters.3, dist(d))
summary(s)
print(s) # Scroll and see negative values