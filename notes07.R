# Notes 07 Code


# Die rolling simulation at beginning
# Note: The cummean() function takes the cumulative mean. In other words, if 
# there have been 100 sixes by roll 500, the cumulative mean is 100 / 500 = 0.2.

library(ggplot2)
set.seed(20230321)

rolls <- sample(1:6, size = 10000, replace = TRUE)
prop_six <- cummean(rolls == 6)
ggplot(data = NULL, aes(x = 1:10000, y = prop_six)) +
  geom_point() +
  theme_bw() +
  labs(x = "Roll Number", y = "Proportion of sixes so far",
       title = "Illustration of short-term uncertainty vs. long-term probability") +
  geom_hline(yintercept = 1/6, alpha = 0.5) +
  scale_x_continuous(labels = scales::comma)




# Example graphs of different distributions

# Normal distribution graphs - patchwork used to put them in one image

library(patchwork)

g1 <- ggplot(data = data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm, n = 101) +
  labs(title = "Standard Normal Distribution") +
  theme_bw()
g2 <- ggplot(data = data.frame(x = c(70, 130)), aes(x)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = 100, sd = 10)) +
  labs(title = "Normal Distribution",
       subtitle = expression("with" ~ mu ~ " = 100 and " ~ sigma ~ " = 10")) +
  theme_bw()
g1 + g2


# T Distribution graph
# dplyr used for mutate function, tidyr to convert data from “wide” to “long”
# Take a look at the df object before/after pivot_longer() to see what I mean
# Think about why this would be necessary for ggplot2 to work

library(dplyr)
library(tidyr)

df <- data.frame(x = seq(-3, 3, .01)) %>%
  mutate(t_5 = dt(x, 5), t_10 = dt(x, 10), t_30 = dt(x , 30)) %>%
  pivot_longer(-x, names_to = "dist", values_to = "density") %>%
  mutate(dist = factor(dist, levels = c("t_5", "t_10", "t_30")))

ggplot(df, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "T-Distributions", 
       linetype = "Distribution", color = "Distribution") +
  theme_bw()


# F and Chi-squared Distribution graphs

df <- data.frame(x = seq(0, 10, .01)) %>%
  mutate(f_2_27 = df(x, 2, 27), f_5_45 = df(x, 5, 45), f_8_2 = df(x, 8, 2)) %>%
  pivot_longer(-x, names_to = "dist", values_to = "density")
g1 <- ggplot(df, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "F-Distributions", 
       linetype = "Distribution", color = "Distribution") +
  theme_bw()

df2 <- data.frame(x = seq(0, 30, .01)) %>%
  mutate(chisq_2 = dchisq(x, 2), chisq_10 = dchisq(x, 10), 
         chisq_5 = dchisq(x, 5)) %>%
  pivot_longer(-x, names_to = "dist", values_to = "density") %>%
  mutate(dist = factor(dist, levels = c("chisq_2", "chisq_5", "chisq_10")))
g2 <- ggplot(df2, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "Chi-Squared Distributions", 
       linetype = "Distribution", color = "Distribution") +
  theme_bw()

g1 + g2




# T Distribution Simulation - What happens if you change some values?

mu <- 50
sigma <- 4
n <- 10
reps <- 5000

set.seed(12345)

library(dplyr) # for the mutate() function

samples <- data.frame(sample = 1:reps, 
                      xbar = apply(mymat, 1, mean),
                      s = apply(mymat, 1, sd))
samples <- mutate(samples, myts = (xbar - mu) / (s / sqrt(n)))

g <- ggplot(samples, aes(x = myts)) +
  geom_histogram(aes(y = after_stat(density)), color = "white", binwidth = 0.25)
g

g + geom_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1), 
                  color = "red") +
  geom_function(fun = dt, n = 101, args = list(df = n - 1), color = "blue", 
                linetype = 2) +
  labs(subtitle = "Red line is normal dist and dashed blue line is t(n - 1)")

library(patchwork) # to put our graphs side by side

gnorm <- ggplot(samples, aes(sample = myts)) +
  geom_qq(distribution = qnorm) +
  geom_qq_line(distribution = qnorm) +
  labs(title = "T stats compared to Z")
gt <- ggplot(samples ,aes(sample = myts)) + 
  geom_qq(distribution = qt, dparams = list(df = n - 1)) +
  geom_qq_line(distribution = qt, dparams = list(df = n - 1)) +
  labs(title = "T stats compared to t(n - 1)")

gnorm + gt
