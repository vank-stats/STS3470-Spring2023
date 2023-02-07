# Code from Notes 2


### Scalars

# Scalar examples

gpa <- 2.85
state <- "North Carolina"
math <- 10 < 20

# Alternate way to create a logical scalar

math_test <- 10 == 20



### Vectors

# Examples of using c() for different elements

num <- c(1, 2, 10)
char <- c("NC", "SC", "VA")
log <- c(TRUE, FALSE, TRUE)
log2 <- c(10 < 20, 10 == 20)


# Example of an error because we didn't capitalize TRUE and FALSE

c(true, false, true)


# Functions to check the element types of our vectors

is.numeric(num)
is.numeric(log)
is.character(char)
is.logical(log)



### Matrices

# Examples of byrow = FALSE (default) and byrow = TRUE

matrix(1:12, nrow = 3, ncol = 4)
matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)


# Creating a character matrix

mymatrix <- matrix(c("A", "B", "C", 
                     "B", "C", "A", 
                     "C", "A", "B"), 
                   nrow = 3, ncol = 3)



### Data frames

### Exploring built in data frames using head()

head(ChickWeight)
head(OrchardSprays)
head(swiss)


# Creating a data frame

mydata <- data.frame(exam = 1:4, grade = c(75, 85, 83, 97))


# If our columns aren't the same length, we might get an error message

data.frame(exam = 1:3, grade = c(75, 85, 83, 97))


# However... if one column length is a mutliple of the other, R will "recycle"
#   the smaller one and will NOT give an error

data.frame(exam = 1:2, grade = c(75, 85, 83, 97))



### Lists

# Example list

a <- TRUE
b <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")
c <- matrix(1:9, ncol = 3, byrow = TRUE)
d <- data.frame(Letter = c("A", "B", "C", "D", "E"),
                Number = 1:5)
mylist <- list(a, b, c, d)
mylist


# Examples of picking out certain objects from our list

mylist[[1]]
mylist[[2]][6]
mylist[[3]][2, 1]
mylist[[4]]$Letter


# Example of creating a list with named objects

mylist2 <- list(log_scalar = a, char_vec = b, num_mat = c, data = d)
mylist2


# With a named list, we can use the $ operator to pick out certain objects too

mylist2$num_mat
mylist2$char_vec[3]



### Summary / Notes

# If you try to put multiple element types into a vector / matrix, R will coerce
#   them to a single type. (e.g. all to character elements below)

myvector <- c(5, "Elon", TRUE)
myvector
