# Suppose I'm running a long for loop or simulation. I want to know when it
#   finishes, but I don't want to sit around and watch R. beepr to the rescue!

library(beepr)


# This code sets up our Chaos game from Activity 10B

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


# Determine starting point and vertices to choose from

myX <- 1
myY <- 1
myvertices <- c("A", "B", "C")


# Run Chaos Game for 100,000 iterations. This will take a while...

for(i in 1:100000) {
  mycorner <- sample(myvertices, 1)
  
  if(mycorner == "A") {
    myX <- (myX + 0) / 2
    myY <- (myY + 0) / 2
  } else if(mycorner == "B") {
    myX <- (myX + 1) / 2
    myY <- (myY + 2) / 2
  } else {
    myX <- (myX + 2) / 2
    myY <- (myY + 0) / 2
  }
  points(myX, myY, pch = 19)
}


# Use the beep() function to alert me when it's done.

beep(sound = 3)