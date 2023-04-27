# Notes 10 Code


# Example using if, else if, and else

alternative <- "two.sided"
teststat <- -1.5
pval <- NA

if(alternative == "less") { pval <- pnorm(teststat)
  } else if(alternative == "greater") { pval <- pnorm(teststat, lower.tail = FALSE)
  } else { pval <- pnorm(-abs(teststat)) * 2 }

pval


# We updated the example to produce an error if alternative is misspecified

alternative <- "greaterthan"
teststat <- -1.5
pval <- NA

if(alternative == "less") { pval <- pnorm(teststat)
  } else if(alternative == "greater") { pval <- pnorm(teststat, lower.tail = FALSE)
  } else if(alternative == "two.sided") { pval <- pnorm(-abs(teststat)) * 2 
  } else { print("Please make alternative less, greater, or two.sided")}

pval


# Examples using ifelse() function

temp <- 30
ifelse(temp > 32, "above freezing", "below freezing")

temp <- 100
ifelse(temp > 32, "above freezing", "below freezing")


# Example using case_when for multiple conditions

library(dplyr)
temp <- 65
case_when(temp <= 32 ~ "freezing",
          temp < 55 ~ "a bit chilly",
          temp < 75 ~ "perfect",
          temp < 90 ~ "getting hot",
          TRUE ~ "too hot!")



# Chaos Game code

## Sets up initial graph

plot(0:2, 0:2, type = "n")
x <- c(0, 1, 2)
y <- c(0, 2, 0)
points(x, y, pch = 19)
labels <- c("A", "B", "C")
text(x + 0.05, y, labels)
segments(0, 0, 2, 0)
segments(0, 0, 1, 2)
segments(1, 2, 2, 0)
points(1, 1, pch = 19)

## Sets up starting values for x/y and vertices to sample from

myX <- 1
myY <- 1
myvertices <- c("A", "B", "C")


# Re-run code below multiple times to build the picture

## Randomly chooses a corner

mycorner <- sample(myvertices, size = 1)

## Moves halfway from current x/y point to chosen corner

if(mycorner == "A") {
  myX <- (0 + myX) / 2
  myY <- (0 + myY) / 2
}
if(mycorner == "B") {
  myX <- (1 + myX) / 2
  myY <- (2 + myY) / 2
}
if(mycorner == "C") {
  myX <- (2 + myX) / 2
  myY <- (0 + myY) / 2
}

points(myX, myY, pch = 19)

# This takes too long... We will see how to use for loops in Activity 10B



# For loops

# Example 1

for(i in 1:5) { print(i) }


# Example 2

for(i in seq(0, 10, 2)) { print(i) }


# Example 3

for(j in c(1, 12, 50)) {
  print(j)
  print(2 * j)
}


# Example 4

sum <- 0
for(k in 1:10) {
  sum <- sum + k
}
sum


# Example 5

# Practice writing this code before constructing loop
sum <- 1

k <- 2
sum[k] <- sum[k - 1] + k
sum

k <- 3
sum[k] <- sum[k - 1] + k
sum

# Full loop

sum <- 1
for(k in 2:10) {
  sum[k] <- sum[k - 1] + k
}
sum



# Example 6

m <- NULL
n <- NULL
mymat <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)

for(i in 1:length(mymat[1, ])) {
  m[i] <- mean(mymat[, i])
  n[i] <- mean(mymat[i, ]) # added to calculate row mean too
}

m
n
