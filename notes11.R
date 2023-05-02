# Notes 11

# Create a my_print() function

my_print <- function(num = 5) {
  for(i in 1:num) { print(i) }
}

# Three ways to have it print 1 through 5

my_print()
my_print(5)
my_print(num = 5)

# Print 1 through 10

my_print(10)



# Example 1 - Pre-written my_mean() function

my_mean <- function(X) {
  sum <- sum(X)
  n <- length(X)
  mean <- sum / n
  m <- c("The mean is: ", mean)
  new_sum <- paste("The sum is:", sum)
  new_n <- paste0("The length is:", n)
  print(new_sum)
  print(new_n, quote = FALSE)
  print(m, quote = FALSE)
  mean
  X
}

# Use function on mpg variable in mtcars

my_mean(mtcars$mpg)

# What happens when we assign function output to an object?

out <- my_mean(mtcars$mpg)
out

# Notice how functions like t.test() don't print anything when storing output

test <- t.test(mtcars$mpg)



# Example 2 - Create mean_star() function

mean_star <- function(vector) {
  xmin <- min(vector)
  xmax <- max(vector)
  new_sum <- sum(vector) - xmin - xmax
  new_n <- length(vector) - 2
  new_mean <- new_sum / new_n
  new_mean
}

# Testing mean_star() on mpg variable of mtcars data

mean_star(mtcars$mpg)



# Returning multiple objects with my_summary() function

my_summary <- function(vec) {
  missing <- sum(is.na(vec))
  xbar <- mean(vec, na.rm = TRUE)
  s <- sd(vec, na.rm = TRUE)
  range <- c(min(vec, na.rm = TRUE), max(vec, na.rm = TRUE))
  out <- list(missing = missing,
              mean = xbar,
              sd = s,
              range = range)
  out
}

# Testing the function

my_summary(c(NA, 10, 5, 39, NA))

# Print only the mean

my_summary(c(NA, 10, 5, 39, NA))$mean

# Print only the range

my_summary(c(NA, 10, 5, 39, NA))$range

# Print only the maximum value

my_summary(c(NA, 10, 5, 39, NA))$range[2]
