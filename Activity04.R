# Activity 04 Solutions

# Graph A

ggplot(midwest, aes(x = state)) +
  geom_bar(fill = "white") +
  labs(title = "Graph A")


# Graph B

ggplot(midwest, aes(x = percollege)) +
  geom_histogram(binwidth = 10, color = "white") +
  labs(title = "Graph B")


# Graph C

ggplot(midwest, aes(x = percollege, y = percbelowpoverty)) +
  geom_point(alpha = 0.2) +
  geom_smooth(formula = y ~ x, method = "lm", se = FALSE) +
  labs(title = "Graph C")


# Graph D

ggplot(midwest, aes(x = percbelowpoverty, y = state, fill = state)) +
  geom_boxplot() + 
  labs(title = "Graph D")