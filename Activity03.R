# Activity 3 Code

# Remember to put data and R script in same folder. Then go to:
#   Session --> Set Working Directory --> To Source File Location


## Part A

# Question 1

# Used Import Dataset (From Excel...) options. Your code may be slightly different.

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



## Part B

# Question 1

# Used Import Dataset (From Excel...) options. Your code may be slightly different.

bison <- read_excel("Notes 03 - bison.xlsx")


# Question 2 - names with spaces need ` ` marks around them

bison$`Northern herd spring calf ratio`


# Question 3

names(bison) <- c("year", "nh_scr", "ch_scr", "pdsi", "nh_SWEacc", "ch_SWEacc", 
                  "nh_bison", "ch_bison", "elk")


# Question 4

# a - mean elk herd size is 12,822

summary(bison$elk)


# b - there are 15 missing (NA) values

# c - result is NA because of these missing values

mean(bison$elk)


# d

?mean
mean(bison$elk, na.rm = TRUE)


# e 

length(bison$elk) # counts NAs


# f - length() includes the NAs in the length

bison$elk


# g - many options

length(bison$elk[!is.na(bison$elk)]) # subsets vector to only non-NA values
sum(!is.na(bison$elk)) # creates vector of TRUE/FALSE for non-NA then adds them
table(is.na(bison$elk)) # FALSE means not missing


# h - looks to have a moderate positive correlation (maybe between .5 and .8)

plot(bison$nh_bison, bison$elk)


# i - Choose a use option that removes missing values

cor(bison$nh_bison, bison$elk, use = "complete.obs")



## Part C

# Question 1

library(dplyr)
Alamance <- filter(bridges, COUNTY == "ALAMANCE")


# Question 2

AGO <- filter(bridges, COUNTY %in% c("ALAMANCE", "GUILFORD", "ORANGE"))


# Question 3

AGO$AGE <- 2023 - AGO$YEARBUILT   # base R version
AGO <- mutate(AGO, AGE = 2023 - YEARBUILT)   # tidyverse version


# Question 4

# base R
head(AGO[order(AGO$AGE), ], n = 10)[, c("COUNTY", "AGE", "SR", "ACROSS")]

# tidyverse - without piping
slice(select(arrange(AGO, AGE), COUNTY, AGE, SR, ACROSS), 1:10)

# tidyverse - with piping
AGO %>%
  arrange(AGE) %>%
  select(COUNTY, AGE, SR, ACROSS) %>%
  slice(1:10)


# Question 5

# base R
aggregate(SR ~ COUNTY, data = AGO, FUN = "min")
aggregate(SR ~ COUNTY, data = AGO, FUN = "median")
aggregate(SR ~ COUNTY, data = AGO, FUN = "max")

# tidyverse
summarize(group_by(AGO, COUNTY), 
          min_SR = min(SR),
          median_SR = median(SR),
          max_SR = max(SR))


# Question 6

bridges %>%
  filter(COUNTY %in% c("ALAMANCE", "GUILFORD", "ORANGE")) %>%
  mutate(AGE = 2023 - YEARBUILT) %>%
  group_by(COUNTY) %>%
  summarize(min_SR = min(SR),
            median_SR = median(SR),
            max_SR = max(SR))
