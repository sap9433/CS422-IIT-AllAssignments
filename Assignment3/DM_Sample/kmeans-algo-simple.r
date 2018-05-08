# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology
#
# Demonstration of k-means clustering.  Algorithm below is for demonstration 
# purpose only; lot's of hard-coded stuff. Don't assume it will work for all
# sorts of data and clustering strategies!!

rm(list=ls())

# Main entry point.  To run, give the coordinates of the cluster centroids.
#
# > kmeans.demo.main(data.frame(x=c(9,10,11), y=c(2,3,4)))
# or
# > kmeans.demo.main(data.frame(x=c(1,6,10), y=c(10,6,8)))
#
# The following cluster centroid will result in only 2 clusters: red and black.
# (Some warnings are thrown as the code does not handle corner cases
# approriately.)
#
# > kmeans.demo.main(data.frame(x=c(1,2,3), y=c(10,10,10)))
#
# Other centroids: data.frame(x=c(1,12,6), y=c(1,10,6))

kmeans.demo.main <- function(centroids) {

  x <- c(4,7,4,6,3,2,5,10,12,11,9,12)
  y <- c(10,10,8,8,4,2,2,5,6,4,3,3)
  df <- data.frame(x,y)
  
  cluster.centroids <- centroids
  
  old.cluster.centroids <- cluster.centroids
  for (i in 1:100) {
    kmeans.demo.plot(df, cluster.centroids)
    readline(prompt="Press <enter> to continue")
    cluster.centroids <- kmeans.demo.training(df, cluster.centroids)
    readline(prompt="Press <enter> to continue")
    if (identical(cluster.centroids, old.cluster.centroids)) { break }
    old.cluster.centroids <- cluster.centroids
  }
  cat(paste("Iterations to converge: ", i, "\n"))
}

# Plot the data points and the centroids
kmeans.demo.plot <- function(df, cluster.centroids) {
  plot(df, xlim=c(0,13), ylim=c(0,11))
  points(cluster.centroids[1,1], cluster.centroids[1,2], col="green", pch=8)
  points(cluster.centroids[2,1], cluster.centroids[2,2], col="red", pch=8)
  points(cluster.centroids[3,1], cluster.centroids[3,2], col="black", pch=8)
}

# "Train" the dataset by seeing which points belong to which cluster
kmeans.demo.training <- function(df, cluster.centroids)  {
  green.df <- data.frame(); 
  red.df <- data.frame(); 
  black.df <- data.frame();
    for (i in 1:dim(df)[1])  {
     paint <- kmeans.demo.which.cluster(df[i,1], df[i,2], cluster.centroids)
     points(df[i,1], df[i,2], col=paint, pch=20)
     if (paint == "green") { green.df <- rbind(green.df, df[i,])}
     if (paint == "red")   { red.df   <- rbind(red.df, df[i,])}
     if (paint == "black") { black.df <- rbind(black.df, df[i,])}
  }
  cluster.centroids <- kmeans.demo.update.centroids(green.df, 
                                                    red.df, 
                                                    black.df, 
                                                    cluster.centroids)
  cluster.centroids
}

# Determine which point to paint with which color
kmeans.demo.which.cluster <- function(x, y, cluster.centroids)  {
  df <- data.frame(c(x, cluster.centroids[1,1]), c(y, cluster.centroids[1,2]))
  d1 <- dist(df) # green
  df <- data.frame(c(x, cluster.centroids[2,1]), c(y, cluster.centroids[2,2]))
  d2 <- dist(df) # red
  df <- data.frame(c(x, cluster.centroids[3,1]), c(y, cluster.centroids[3,2]))
  d3 <- dist(df) # black
  indx <- which.min(c(d1,d2,d3))
  if (indx == 1) {
    paint = "green"
  } else if (indx == 2){
    paint = "red"
  } else {
    paint = "black"
  }
  paint
}

# Update the centroids to their new location.
kmeans.demo.update.centroids <- function(green.df, 
                                         red.df, 
                                         black.df, 
                                         cluster.centroids) {
  
  cluster.centroids <- data.frame(x = c(mean(green.df$x), 
                                        mean(red.df$x), 
                                        mean(black.df$x)),
                                  y = c(mean(green.df$y), 
                                        mean(red.df$y), 
                                        mean(black.df$y)))
  cluster.centroids
}
