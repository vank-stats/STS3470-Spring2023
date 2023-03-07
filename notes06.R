# Notes 6 Code

library(ggplot2)

# Customizing colors

## Example from notes

ggplot(Orange, aes(x = age, y = circumference)) +
  geom_point(aes(color = Tree)) +
  scale_color_manual(values = c("red", "blue", "green", "yellow", "purple"),
                     breaks = c(1, 2, 3, 4, 5),
                     name = "Tree Number")


# Custom scales

# Example from notes
# Default x and y scales are fairly ugly

g <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(color = "blue", fill = "lightcyan", binwidth = 1000) +
  theme_classic()
g

# Code below adds $ sign to price variable and commas to longer numbers
#   to make everything easier to read

g +
  scale_x_continuous(labels = scales::dollar) +
  scale_y_continuous(labels = scales::comma)



# Changing plot axis limits

# Example from notes

g <- ggplot(Orange, aes(x = age, y = circumference)) +
  geom_point(aes(shape = Tree)) +
  geom_smooth(method = "lm")
g

# xlim() and ylim() zoom in on data, ignoring values outside the zoom

g + xlim(800, 1500) + ylim(100, 150)

# coord_cartesian() zooms in on graph exactly as it was

g + coord_cartesian(xlim = c(800, 1500), ylim = c(100, 150))

# ggplotly() creates an interactive graph you can zoom in/out on

library(plotly)
ggplotly(g)



# Creating grids of graphs

# facet_wrap()

# base graph
mt <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
mt

# separated by cyl levels
mt + facet_wrap( ~ cyl)

# separated by combination of vs and cyl levels
mt + facet_wrap(vs ~ cyl)


# facet_grid()

# separated by cyl levels (looks similar to facet_wrap())
mt + facet_wrap( ~ cyl)

# vs levels are rows and cyl levels are columns
mt + facet_grid(vs ~ cyl)



# Combining separate graphs into one image with patchwork

library(patchwork)

# Create four graphs

a <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
b <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
  geom_bar()
c <- ggplot(mtcars, aes(x = wt)) +
  geom_histogram(binwidth = 0.5, color = "orange")
d <- ggplot(mtcars, aes(x = mpg, y = factor(am))) +
  geom_boxplot(aes(fill = factor(cyl)))

# Use + to put graphs side by side

a + b + c


# Use / to put graphs on top of one another

a / b

# You can combine + and / in many combinations
# This is three side by side graphs above one graph

(a + b + c) / d

# Here is two graphs above one graph above another graph

(a + b) / c / d
