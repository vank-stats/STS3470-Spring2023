# Activity 2 - Part C

# 1 - Loads sleep data frame into environment

data(sleep)


# 2 - Variables are extra, group, ID. There are 20 rows. This corresponds to
#   only 10 people (each ID shows up twice).

View(sleep)


# 3 - ID is patient ID, group is which drug they got, and extra is the increase
#   in hours of sleep they got. It is a paired sample because each person got
#   both drugs (1 and 2).

?sleep


# 4 - The largest sleep increase is 5.5 hours. The largest sleep loss is 1.6
#   hours. The average change (mean) was a gain of 1.54 hours. (Med = 0.95)

summary(sleep)


# 5 - It tells us an object called extra is not found

extra


# 6 - This prints the values in the extra variable/column.

sleep$extra


# 7 - Code to print ID values

sleep$ID


# 8 - The first line gives us the values of extra where group is 1.
#   The second line gives us vector of TRUE (when ID is 1) and FALSE (otherwise)

sleep$extra[sleep$group == 1]
sleep$ID == 1


# 9 - Summarizing extra for group 1

summary(sleep$extra[sleep$group == 1])


# 10 - First line creates vector of extra values for group 1. Second line 
#   creates vector of extra values for group 2. Third line finds difference in
#   extra values for each person (drug 2 minus drug 1).

extra1 <- sleep$extra[sleep$group == 1]
extra2 <- sleep$extra[sleep$group == 2]
diff <- extra2 - extra1
t.test(diff)

# Hypotheses --> H0: mu_diff = 0 vs. Ha: mu_diff ≠ 0
# Test statistic --> T = 4.0621
# df = 9
# p-value = 0.002833

# Conclusion: There is very strong evidence to conclude that the population mean
#   difference in sleep increase is not the same for the two drugs.

# 95% CI --> (0.70, 2.46)
# Interval interpretation: We are 95% confident that the population mean sleep
#   increase is between 0.7 and 2.46 hours more for drug 2 than for drug 1.


# 11

# Display first row of sleep data
sleep[1, ]

# Display first column of sleep data
sleep[, 1]

# Check if sleep is a vector (it is not)
is.vector(sleep)

# Check if the first column of sleep is a vector (it is)
is.vector(sleep[, 1])

# Get information about the structure of the sleep data frame
#   It's a data frame with three variables and 20 observations
str(sleep)

# Get information about the structure of the first row of the sleep data frame
#   It's a data frame with three variables and only 1 observation
str(sleep[1, ])

# Get information about the structure of the first column of the sleep data
#   It's no longer a data frame - It's a numeric vector with 20 values
str(sleep[, 1])
