# Notes 4 Code

# First time I use ggplot2, I'll need to run install.packages("ggplot2")

library(ggplot2)

# Histogram of mpg in mtcars data

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

# Histogram with 10 bins instead of 30 (the default)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10)

# Histogram with each bin 5 mpg wide

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5)

# Add lines between bars to distinguish them

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5, color = "blue")

# Change color of the bars

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5, fill = "maroon", color = "gold")


# Practice: Histogram of carat variable in diamonds data. Change color options.

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = .3, fill = "maroon", color = "blue")




# Side-by-side boxplots

ggplot(diamonds, aes(x = carat, y = cut)) +
  geom_boxplot()


# Practice: Boxplots of diamond price (y) by color (x)

ggplot(diamonds, aes(x = color, y = price)) +
  geom_boxplot()

ggplot(diamonds, aes(x = color, y = price)) +
  geom_boxplot() +
  scale_y_log10()
