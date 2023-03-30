# Notes 8 Code

?t.test


# Generate 50 random values from a N(102, 5) distribution

set.seed(2303)
myvalues <- rnorm(50, 102, 5)

# T-tests with H0: mu = 100 and three different alternatives (≠, >, <)

t.test(x = myvalues, alternative = "two.sided", mu = 100)
t.test(x = myvalues, alternative = "greater", mu = 100)
t.test(x = myvalues, alternative = "less", mu = 100)


# Practice: Old Faithful example




# Example - Confidence Level Impact

# Choose three possible confidence levels and create a blank matrix
conf <- c(0.90, 0.95, 0.99)
ci <- matrix(NA, nrow = 3, ncol = 2)

# Calculate confidence intervals using each level
out1 <- t.test(x = myvalues, alternative = "two.sided", mu = 100, 
               conf.level = conf[1])
out2 <- t.test(x = myvalues, alternative = "two.sided", mu = 100, 
               conf.level = conf[2])
out3 <- t.test(x = myvalues, alternative = "two.sided", mu = 100, 
               conf.level = conf[3])

# Store each confidence interval in our matrix
ci[1, ] <- out1$conf.int[1:2]
ci[2, ] <- out2$conf.int[1:2]
ci[3, ] <- out3$conf.int[1:2]

# How wide are the intervals?
diff <- ci[, 2] - ci[, 1]
cbind(conf, diff)

# Where are the intervals centered?
apply(ci, MARGIN = 1, FUN = mean)




# Example - Sample size impact

# Generate three samples of varying sizes and create a a blank matrix
set.seed(4567)
n <- c(10, 30, 100)
my10values <- rnorm(n[1], 102, 5)
my30values <- rnorm(n[2], 102, 5)
my100values <- rnorm(n[3], 102, 5)
ci <- matrix(NA, nrow = 3, ncol = 2)

# Calculate confidence intervals using each sample size
out1 <- t.test(x = my10values, alternative = "two.sided", mu = 100)
out2 <- t.test(x = my30values, alternative = "two.sided", mu = 100)
out3 <- t.test(x = my100values, alternative = "two.sided", mu = 100)

# Store each confidence interval in our matrix
ci[1, ] <- out1$conf.int[1:2]
ci[2, ] <- out2$conf.int[1:2]
ci[3, ] <- out3$conf.int[1:2]

# How wide are the intervals?
diff <- ci[, 2] - ci[, 1]
cbind(n, diff)

# Where are the intervals centered?
apply(ci, MARGIN = 1, FUN = mean)




# Example - What does __% confident mean?

reps <- 1000
n <- 10
sd <- 5
conf <- 0.9

output <- replicate(reps, t.test(rnorm(n, 0, sd), mu = 0, 
                                 alternative = "two.sided", 
                                 conf.level = conf)$conf.int[1:2])

output <- t(output) # this makes each row a CI instead of each column
contain_mu <- output[, 1] <= 0 & output[, 2] >= 0
sum(contain_mu) / reps


# Code for confidence interval graph in notes

library(ggplot2)
myout <- output[1:100, ]
contain_mu <- contain_mu[1:100]

mydata <- data.frame(row = 1:100,
                     xbar = apply(myout, 1, mean),
                     lower = myout[, 1],
                     upper = myout[, 2])

ggplot(mydata, aes(y = row, x = xbar, color = contain_mu)) +
  geom_pointrange(aes(xmin = lower, xmax = upper), size = 0.2) +
  geom_vline(xintercept = 0) +
  labs(title = paste0("Simulation of ", conf * 100, "% confidence"),
       subtitle = paste0(sum(contain_mu), " out of ", nrow(myout),
                         " simulations captured mu = 0"),
       x = "Confidence interval",
       y = "Interval number",
       caption = "Each dot is a sample mean and each horizontal line is a CI",
       color = "Interval contains mu?") +
  theme_bw()
