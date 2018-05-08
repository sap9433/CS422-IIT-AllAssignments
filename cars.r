# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology

# We will use an additional library called 'psych'.  To use a
# library, you call it as shown below.  However, if the library is
# not on your system, then R will issue an error.
library(psych)

# ... then, you have to issue the f x=rnorm(100)ollowing command to install the
# library:
# > install.packages("psych")
#
# You install a package (or a library) only once!  Once install, you
# simply load the package and use it.



# Note that there are certain built-in datasets in R that you can
# simply use.  You access them through the data() method as shown
# below.  Datasets cars and iris are examples we will work with.
data(cars)
str(cars)
head(cars)
mean(cars$speed)
sd(cars$speed)

# Now, let's look at the covariance matrix
cov(cars)

# How about we plot the covariances:
pairs.panels(cars) # This function is in library psych, which we loaded above.

