# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology

setwd("/home/vkg/IIT/CS422/lectures/lecture-1")

# Variables in R
a <- 1
b <- 1.0
c <- "Hello"
d <- "World"

# There is a difference between <- and =.  Both are assignment operators,
# but <- is used to assign values to variables and = is used to assign
# values to function parameters.
# Writing output
cat("Hello World")
str <- paste("Hello World")
cat(str)

# Or...
str <- paste(c, d, sep="")
cat(str)

# Or ...
cat(paste(c, d))

# A gentle introduction to R through three main collections: vectors, lists
# and data frames.

# VECTORS
# Normal vectors of multiple types
s <- c("hello", "world")
i <- c(1,2,3)
n <- c(1.0, 2.1, 11.1)
b <- c(TRUE,FALSE,TRUE,TRUE)

# You can access individual elements using s[1], i[2], etc.
# You can access multipe elements using b[1:3]

# You can do vectorized calculations, such as i+3 

# Named elements in a vector
named <- c(name="Vijay", mode="Instructor", students=73)

# Access using indices or names
named[1]
named['name']

# LISTS

l <- list(1, 'a', "hello", strings=s, booleans=b)
l
l[1]
l['strings']
length(l)

# Note the difference between l[4] and l[[4]] (or l['strings'] and 
# l[['strings]])
l[4]
l[[4]]
l['strings']
l[['strings']]

# DATA FRAMES
# Data Frames: An important concept in R.
df <- read.csv("student.csv", sep=";", header=T)
# Or read.csv("/home/vkg/IIT/CS422/lectures/lecture-1/student.csv", ...)

str(df)
df$name
summary(df$gpa)

# Note the difference between df[1] and df[1,] (also see df[1:2,])
# You can add/remove rows and columns to/from a data frame.  I will
# let you experiment with this.

# str() is an important function.  It shows you the structure of the
# R object.  For example, note the output of the following commands:

str(l[[4]])
str(l[4])

# Consequently, you can do the following to get the first string ("hello")
l[[4]][1]

# But doing l[4][1] does not get you what you want.

# On the other hand, what does l[4]$strings get us?
l[4]$strings

# So, l[4]$strings[1] will give you ...
l[4]$strings[1]

# But l[[4]]$strings[1] will not result in anything

# Also note

# Plot: simple histogram
plot(hist(df$gpa), main="GPA Histogram", xlab="GPA")

# Add color!
colors <- c("red", "yellow", "orange")
plot(hist(df$gpa), main="GPA Histogram", xlab="GPA", col=colors)

# And functions
intro <- function(){
  a <- cat("Hello, my name is Vijay\n")
}

intro2 <- function(name, student){
  if (student == "y")  {
      status <- "I am a student"  
  }
  else {
    status <- "I am not a student"
  }
  list(name=name, status=status)
}
