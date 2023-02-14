# Activity 3 Code

# Remember to put data and R script in same folder. Then go to:
#   Session --> Set Working Directory --> To Source File Location


## Part A

# Question 1

library(readxl)
bridges <- read_excel("Notes 03 - NC Bridges.xls", 
                      col_types = c("text", "numeric", "text", 
                                    "text", "numeric", "numeric", "text", 
                                    "text", "numeric", "numeric", "numeric"), 
                      na = "Not Posted")

# Question 2

summary(bridges)

# There are 13367 bridges. The oldest was built in 1891. The median SR is 77.5.


# Question 3

hist(bridges$YEARBUILT)

# The 1960s has the most bridges built in it.


# Question 4

Alamance <- bridges[bridges$COUNTY == "ALAMANCE", ]


# a - There are 149 bridges in Alamance county. To find this info, we use a 
#   data frame with nrow() or a vector with length()

nrow(Alamance)
length(Alamance$COUNTY)


# b - The oldest bridge in Alamance County was built in 1923

min(Alamance$YEARBUILT)


# c - The newest bridge in Alamance county (in our data) was built in 2010

max(Alamance$YEARBUILT)


# d - 26 of the 149 bridges in Alamance County are considered structurally 
#   deficient

table(Alamance$STRUCTURALLYDEFICIENT)
