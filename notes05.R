# Notes 05 Code

# Labeling graphs

# Example from notes illustrating labs() function

library(ggplot2)
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(shape = cut)) +
  labs(title = "How diamond prices relate to carat",
       subtitle = "Using diamonds data from ggplot2",
       caption = "Created for STS3470 Notes 05",
       x = "Carat (One carat = 1/5 of a gram)",
       y = "Price (in dollars)",
       shape = "Diamond cut")


# Example of default legend label if we don't include shape in labs()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(shape = cut)) +
  labs(title = "How diamond prices relate to carat",
       subtitle = "Using diamonds data from ggplot2",
       caption = "Created for STS3470 Notes 05",
       x = "Carat (One carat = 1/5 of a gram)",
       y = "Price (in dollars)")


# Example of adjusting labels if we use color instead of shape

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  labs(title = "How diamond prices relate to carat",
       subtitle = "Using diamonds data from ggplot2",
       caption = "Created for STS3470 Notes 05",
       x = "Carat (One carat = 1/5 of a gram)",
       y = "Price (in dollars)",
       color = "Diamond cut")




# Changing point color

# Assign specific color outside aes() to change all points one color

ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(color = "violet")


# Put color argument inside aes() to map a variable to the color

ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(aes(color = Tree))


# You can change your legend order - two options

# Option 1

ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(aes(color = Tree)) +
  scale_color_discrete(limits = c("1", "2", "3", "4", "5"))

# Option 2

ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(aes(color = factor(Tree, levels = 1:5)))



# Question: What happens when a constant color is put inside aes()?

ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(aes(color = "violet"))


# Question: What happens when we map a variable to color without aes()?

ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(color = Tree)


# If there was an object called Tree, it could use that to show the color

Tree <- "blue"
ggplot(Orange, aes(x = age, y = circumference)) + 
  geom_point(color = Tree)



# Practice: Recreate mtcars graph

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(shape = factor(cyl), color = factor(cyl)), 
             size = 6, alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "How mileage and weight of cars relate",
       subtitle = "Using the mtcars dataset",
       x = "Weight of the car (in 1000s of pounds)",
       y = "Miles per gallon",
       caption = "Hint: Use factor(cyl) to convert it from numeric",
       shape = "Cylinders",
       color = "Cylinders") +
  theme_bw()


# Question about how to manually choose the colors - scale_color_manual()

ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl), color = factor(cyl))) +
  geom_point(size = 6, alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "How mileage and weight of cars relate",
       subtitle = "Using the mtcars dataset",
       x = "Weight of the car (in 1000s of pounds)",
       y = "Miles per gallon",
       caption = "Hint: Use factor(cyl) to convert it from numeric",
       shape = "Cylinders",
       color = "Cylinders") +
  theme_bw() +
  scale_color_manual(values = c("pink", "blue", "green"))
