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

ggplot(diamonds, aes(y = carat, x = cut)) +
  geom_boxplot()


# Practice: Boxplots of diamond price (y) by color (x)

ggplot(diamonds, aes(x = color, y = price)) +
  geom_boxplot()

ggplot(diamonds, aes(x = color, y = price)) +
  geom_boxplot() +
  scale_y_log10()




# Scatterplots

# mtcars data --> scatterplot of weight vs. mpg

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# Practice

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Bonus - red points

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = TRUE)

# Bonus - point color depends on cut

# Gives me points/lines of different colors (by cut)

ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)

# Gives me points of different color (by cut) with only one line

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  geom_smooth(method = "lm", se = TRUE)

# Points a little transparent (use alpha, 0 means totally see through, 1 is normal)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut), alpha = 0.2) +
  geom_smooth(method = "lm", se = TRUE)




# Bar graphs

# Raw data using geom_bar()

ggplot(diamonds, aes(x = cut)) +
  geom_bar()


# Trying to use geom_bar() with summarized data

elon_22 <- data.frame(College = c("A&S", "Comm", "Edu", "Bus", "Health"),
                      Majors = c(2967, 1380, 291, 1948, 107))

ggplot(elon_22, aes(x = College)) +
  geom_bar()


# Summarized data using geom_col()

ggplot(elon_22, aes(x = College, y = Majors)) +
  geom_col()




# Troubleshooting

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(am))) +
  geom_point()
