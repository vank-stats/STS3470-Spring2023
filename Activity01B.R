# Question 1

x <- c(0:10, 50)
xbar <- mean(x)
xbar_alt <- mean(x, trim = 0.1)


# Question 2 - x is a collection of 12 numbers (0 to 10 and 50)


# Question 3 - The third line used the trim argument. This seems to remove the
#   outlier value of 50 from the mean calculation


# Question 4

?mean

# The trim argument tells R to remove the top and bottom __ proportion of our
#   values from the calculation. With trim = 0.1, we remove the top and bottom
#   10% of x before calculating the mean.


# Question in class about what gets trimmed. We experimented and found that R
#   seems to round down. So if we have 12 numbers, and trim = 0.3, then 30% of
#   12 is 3.6, but R will trim the 3 smallest and 3 largest numbers.

y <- c(0, 2, 7, 8, 24, 25, 39, 47, 78, 98, 99, 100)
mean(y, trim = 0.3)
mean(c(8, 24, 25, 39, 47, 78))


# Question 5 - The default value is trim = 0 (no trimming)


# Question 6 - na.rm specifies whether to remove missing values. The default
#   is na.rm = FALSE, which means you get NA as your answer if you have
#   missing values.


#Question 7

rm(x)

# The rm() function removes x from the environment pane


# Question 8

#a - This line loads the USJudgeRatings data set into the environment pane

data(USJudgeRatings)

#b - This prints the contents of USJudgeRatings in the console. We should avoid
#   doing this if we have a large dataset.

USJudgeRatings

# c - This prints the first five rows of our dataset in the console. The
#   default value is n = 6. We can use ?head to find this or we can run the
#   code without specifying n and see what happens

head(USJudgeRatings, n = 5)

# d - This displays the data in a pop up window by our scripts. You can scroll
#   through or sort by different columns when you do this.

View(USJudgeRatings)

# e - This prints a summary of each variable in our dataset. All the variables
#   are numeric, and we get the min, Q1, median, Q3, max, and mean for each.

summary(USJudgeRatings)


# Bonus - The person has an 87.5% in the class

weighted.mean(x = c(93, 100, 83, 72),
              w = c(50, 10, 20, 20))
