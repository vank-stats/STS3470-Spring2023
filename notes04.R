# Notes 4 Code

# First time I use ggplot2, I'll need to run install.packages("ggplot2")

library(ggplot2)


### Graphs from intro

ggplot(mtcars, aes(x = mpg)) + 
  geom_density(fill = "lightblue")
ggplot(mtcars, aes(x = hp, y = mpg, shape = factor(am))) + 
  geom_point() + 
  theme_bw() +
  labs(x = "Horsepower", y = "Miles per gallon", shape = "Transmission")
ggplot(mtcars, aes(x = factor(cyl), y = wt)) + 
  geom_boxplot(fill = "maroon") + 
  theme_classic()
ggplot(mtcars, aes(x = factor(cyl), fill = factor(am))) + 
  geom_bar() + 
  labs(x = "Number of Cylinders", y = "Cars", fill = "Transmission") +
  scale_fill_viridis_d(labels = c("Automatic", "Manual"), option = "E")





### Histograms

# Histogram of mpg in mtcars data - tells us to change bins/binwidth

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()


# Histogram with 10 bins instead of 30 (the default)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10)


# Histogram with each bin 5 mpg wide

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5)


# Add lines between bars to distinguish them using color

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5, color = "blue")


# Change color of the bars using fill

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5, fill = "maroon", color = "gold")


# Practice: Histogram of carat variable in diamonds data. Change color options.

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = .3, fill = "maroon", color = "blue")





### Side-by-side boxplots

# Boxplots of carat by cut type (horizontal boxes)

ggplot(diamonds, aes(x = carat, y = cut)) +
  geom_boxplot()


# Swap x and y to get vertical boxes

ggplot(diamonds, aes(y = carat, x = cut)) +
  geom_boxplot()


# Practice: Boxplots of diamond price (y) by color (x)

ggplot(diamonds, aes(x = color, y = price)) +
  geom_boxplot()


# Use scale_y_log10() to convert price to a log base 10 scale

ggplot(diamonds, aes(x = color, y = price)) +
  geom_boxplot() +
  scale_y_log10()





### Scatterplots

# mtcars data --> scatterplot of weight vs. mpg
# geom_smooth() is adding a simple linear regression line

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# Change se to TRUE to display shaded standard error around line

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)


# Practice - Scatterplot of carat vs. price for diamonds

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Bonus - Turn the points red (not in aes() because we aren't mapping a variable)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = TRUE)


# Bonus - point color depends on cut (inside aes() because cut is mapped to color)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  geom_smooth(method = "lm", se = TRUE)


# If we want separate lines for each cut, move color arg to ggplot()

ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)


# Use alpha to make points transparent (0 means totally see through, 1 is normal)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut), alpha = 0.2) +
  geom_smooth(method = "lm", se = TRUE)





### Bar graphs

# Raw data using geom_bar() - bar graph of diamond cut

ggplot(diamonds, aes(x = cut)) +
  geom_bar()


# Trying to use geom_bar() with summarized data - shows all bars same height

elon_22 <- data.frame(College = c("A&S", "Comm", "Edu", "Bus", "Health"),
                      Majors = c(2967, 1380, 291, 1948, 107))

ggplot(elon_22, aes(x = College)) +
  geom_bar()


# Need to use geom_col() with summarized data. Map count variable to y.

ggplot(elon_22, aes(x = College, y = Majors)) +
  geom_col()


# Bonus - Add color to the bars

# Option 1, all bars the same color

ggplot(elon_22, aes(x = College, y = Majors)) +
  geom_col(fill = "aquamarine")


# Option 2, separate color for each college

ggplot(elon_22, aes(x = College, y = Majors, fill = College)) +
  geom_col()


# Option 3 - adding in new variable for color (using diamonds data)
# Notice how it stacks the other variable within the first.

ggplot(diamonds, aes(x = cut, fill = clarity)) +
  geom_bar()





### Troubleshooting section

# R is treating am as continuous, gives us a color scale

ggplot(mtcars, aes(x = wt, y = mpg, color = am)) +
  geom_point()


# We want separate colors for our two categories, use factor() function

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(am))) +
  geom_point()


# If both variables are considered numeric, side-by-side boxplots don't work

ggplot(mtcars, aes(x = am, y = mpg)) +
  geom_boxplot()


# Again, we can use factor() to convert am to categorical

ggplot(mtcars, aes(x = factor(am), y = mpg)) +
  geom_boxplot()
