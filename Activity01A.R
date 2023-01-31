# Question 1

x <- c(1, 3, 4 ,8)
y <- c(55, 84, 88, 99)
lm(y ~ x)

# lm stands for linear model. The code is creating a simple linear regression
#   line using x to predict y


# Question 2

z <- c(5, 6, 7, 8, 9, 10)

# This code creates an object called z. No output is produced but z shows up
#   in our environment pane


# Question 3 + Challenge

z2 <- 5:10
z3 <- seq(5, 10)

# z, z2, and z3 show three different ways to create an object with the values
#   5 through 10.


# Question 4

sd(z)

# The standard deviation is around 1.87


# Challenge

var(z)
IQR(z)


# Question 5

values <- seq(1, 1000, 10)
values

# The numbers in square brackets on the left tell us what place the first
#   element on that row belongs to. My second row starts with the 31st element
#   and the third row starts with the 61st element. This may be different for
#   you depending on font size and the width of your console pane.


# Question 6

values[50]

# The 50th element in values is 491