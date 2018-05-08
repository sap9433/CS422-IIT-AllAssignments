# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology
#
# Scaling of variables affects clustering!  So beware!!

library(factoextra)

rm(list=ls())

#       1     2     3     4     5     6     7    8
x <- c(210,  195,  180,  200,  235,  110,   90, 126)  # Weight in lbs
y <- c(5.08, 4.03, 6.00, 5.02, 5.07, 5.03, 4.0, 5.01) # Height in feets and inches

df <- data.frame(weight=x, height=y)
df.scaled <- scale(df)

# Remember from previous lecture: location of points in a 2-d space
# does not change even after scaling.  In a sense, scaling "adjusts"
# the coordinates.  So, with that ...

k <- kmeans(df, centers=2) 
k.scaled <- kmeans(df.scaled, centers=2)

# Now let's see what the clusters looks like, scaled and unscaled.
fviz_cluster(k, data=df, main="Unscaled clusters")
fviz_cluster(k.scaled, data=df.scaled, main="Scaled clusters")

# Let's look at their distances, for scaled and unscaled versions.
# Notice the distance from point 5 to points 6, 7, 8.  5's 'x' attribute
# tends to dominate the 'x' attributes of 6,7,8.
dist(data.frame(x=x, y=y), method="euclidean", upper=T)
dist(scale(data.frame(x=x, y=y)), method="euclidean", upper=T)

# And finally, let's see what's contained in the results returned
# by kmeans()
print(k.scaled)

# Examime k.scaled${cluster, size, centers, totss, withinss}
# totss = tot.withinss + betweenss



