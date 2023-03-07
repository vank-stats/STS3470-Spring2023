# Notes 6 Code

library(ggplot2)

mt <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

mt

mt + facet_wrap( ~ cyl)
mt + facet_wrap(vs ~ cyl)


mt + facet_grid( ~ cyl)
mt + facet_grid(vs ~ cyl)
