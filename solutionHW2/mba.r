# CS422 Data Mining
# Vijay K. Gurbani, Ph.D.
# Illinois Institute of Technology

# Market basket analysis using the Arules package

library(arules)  # Make sure you install this package.

setwd("/home/vkg/IIT/CS422/lectures/lecture-6/")

rm(list=ls())

# This is our transaction set.
trans <- as.matrix(read.csv("mba.csv", header=T, sep=" ", comment.char = '#'))

rules <- apriori(trans)
summary(rules)
inspect(head(rules, by="confidence"))

# You can pare down the rules by applying minconf and minsup as follows:
rules.1 <- apriori(trans, parameter=list(supp=0.40, conf=0.90))
inspect(rules.1)
rm(rules.1)

# Eclat
# rules.eclat <- eclat(trans)
# inspect(head(rules.eclat, n=35, by="support"))
