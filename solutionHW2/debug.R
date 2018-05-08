
setwd("~/Desktop/Assignments&Coursework/422/Hw-2-March4/")
set.seed(1122)

adult.train <- read.csv("adult-train.csv", header=T, sep=",")
adult.test <- read.csv("adult-test.csv", header=T, sep=",")
dim(adult.train)
dim(adult.test)

delete.dirt <- function(DF, dart='?') {
  print("Hannn")
  print(dim(DF))
  dirty_rows <- which(dart == DF)
  print(dim(dirty_rows))
  #DF <- DF[dirty_rows,]
  print(dim(DF))
  DF
}
debug(delete.dirt)
adult.train <- delete.dirt(adult.train)

