# Notes 03 Code

# Remember to put data and R script in same folder. Then go to:
#   Session --> Set Working Directory --> To Source File Location


## Read in STS Course data

library(readr)
spring2023 <- read_delim("Notes 03 - STS Course Data.txt", 
                         delim = "\t", escape_double = FALSE, 
                         comment = "#", trim_ws = TRUE)
# View(spring2023)

# I commented out the View() function so I don't get a pop-up window every time
#   that I run this script.


# Check that spring2023 is a data frame. Investigate the structure and get a
#   summary of the variables.

is.data.frame(spring2023)
str(spring2023)
summary(spring2023)


# Read in temperature data

temps <- read_csv("Notes 03 - Temperature Anomalies.txt")


# Read in bison data - Excel file instead of .txt file

library(readxl)
bison <- read_excel("Notes 03 - bison.xlsx")



# Summary statistics

# Examples of using quantile() function

x <- seq(1, 89, 6)
quantile(x, c(.25, .5, .75))
quantile(x, seq(0, 1, .1))

# Examples using bridges data

library(readxl)
bridges <- read_excel("Notes 03 - NC Bridges.xls", 
                      col_types = c("text", "numeric", "text", 
                                    "text", "numeric", "numeric", "text", 
                                    "text", "numeric", "numeric", "numeric"), 
                      na = "Not Posted")

# Table for one variable or for two variables

table(bridges$FUNCTIONALLYOBSOLETE)
table(bridges$FUNCTIONALLYOBSOLETE, bridges$STRUCTURALLYDEFICIENT)


# length() function gives us number of columns (not rows) in a data frame

length(bridges)



# Data Management

# Bring up help for ChickWeight and load into environment

?ChickWeight
data("ChickWeight")


# Two ways to select first 12 rows of data

chick1 <- ChickWeight[1:12, ]
head(ChickWeight, n = 12)


# Base R Option to select all of Chick 2's observations

chick2 <- ChickWeight[ChickWeight$Chick == 2, ]
chick2


# Tidyverse Option to do this for Chick 3

library(dplyr)
chick3 <- filter(ChickWeight, Chick == 3)
chick3





# Piping example

# No piping
library(dplyr)
diet1 <- filter(ChickWeight, Diet == 1)
diet1 <- group_by(diet1, Chick)
diet_summary <- summarize(diet1, MaxWt = max(weight))
diet_summary <- arrange(diet_summary, desc(MaxWt))
head(diet_summary, 3)

# Using the piping operator (%>%)

chick_summary <- ChickWeight %>%
  filter(Diet == 1) %>%
  group_by(Chick) %>%
  summarize(MaxWt = max(weight)) %>%
  arrange(desc(MaxWt)) %>%
  head(3)

# Another non-piping approach (not recommended)

head(arrange(summarize(group_by(filter(ChickWeight, Diet == 1), Chick), MaxWt = max(weight)), desc(MaxWt)), 3)
