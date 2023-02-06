# Name: PUT YOUR NAME HERE

# Note: Your file should be called hw1_yourlogin.R where you replace yourlogin
#   with the username you use for Moodle/email etc. For example, my file would 
#   be called hw1_rvankrevelen.R. It is important to follow these guidelines so
#   that I can use R to match each person's file to them.


################################################################################

#####################################
### Part A - The birthday problem ###
#####################################

# Question 1 - Create a vector called days that contains the numbers 1 through
#   365. Demonstrate two different ways of creating the vector.




# Question 2 - We are going to use the sample() function to randomly select
#   values from the vector we created. Write code to look up the function. Then
#   using R comments below that, (a) list the four arguments in the sample() 
#   function and (b) state which ones have default values associated with them.




# Question 3 - Your vector from question 1 represents the 365 days in a year.
#   Suppose we assume people are equally likely to be born on any day. There are
#   30 students in this class. Use the sample() function to take a random sample
#   of 30 birthdays from your vector. Make sure that it's possible for a day to 
#   be chosen more than once. Store the result in a vector called birthdays.
#
#   Note: Put your code for this question below the line that starts with 
#     set.seed(). Be sure to run that line before you run your sample() line.

set.seed(230207)




# Question 4 - Write code that can be used to verify that the object birthdays
#   contains numeric elements and is a vector.




# Question 5 - We want to see if anyone in our sample had the same birthday as
#   someone else. Use the sort() function to put the birthdays in order. Then
#   use R comments to tell me whether or not there are any duplicate birthdays.




# Question 6 - If we wanted to simulate many random classes of 30 students, it
#   would be a pain to have to sort each vector and look through it for 
#   duplicates. The function unique() will take a vector and return only one
#   copy of each value. Write code that uses the unique() function along with 
#   the length() function to check if there are any duplicates in our vector
#   of 30 birthdays. (Note: Your code should produce a TRUE if there are any
#   duplicate birthdays and a FALSE if there are not.)




# Question 7 - Create a matrix that has 1000 rows and 30 columns. Call this
#   bday_sim. Use the sample() function to fill this matrix with 30,000 
#   (30 * 1000) random birthdays. Do NOT print this whole matrix.




# Question 8 - Write code that will display the first 10 rows of your matrix.
#   Then write another line to display the last 5 rows.




# Note: In the future, we will learn how to check each row of your matrix to
#   see if there are any duplicate birthdays.


################################################################################

#####################################
### Part B - Chicken growth data  ###
#####################################

# Question 9 - Write code to load the chickwts data into your environment. Then
#   add code that brings up the help file. Use R comments to list the variable
#   names below that.




# Question 10 - Use the table() function on the feed variable (second column) of
#   the data. Use R comments to say which feed was used most often.




# Question 11 - Write code that finds the highest weight (first column) in the
#   data. 




# Question 12 - Create a vector of logical values called is_small. The vector
#   should identify which chickens have weights less than 200. Then write code
#   to count how many of the weights are less than 200 and share your answer
#   in an R comment.




################################################################################

# Question 13 - Tell me one thing you hope to learn how to do with R (or with 
#   data) this semester. 



