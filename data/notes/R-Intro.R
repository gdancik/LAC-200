########################################################
# R is an interpreted, command-based computer coding 
# language. Computer code is simply a set of 
# instructions that a computer can understand
########################################################

# This is a comment (the computer ignores comments)

##########################################
## Basics, variables, and vectors
##########################################

# R can be used like a calculator
7+10
7*9
sqrt(64)

# Variables are objects that store values. 
# (Unlike other languages they are NOT declared). 
# Use either '<-' or '=' for assignment
x <- 14  # x = 14 will do the same thing
y <- 21

total <- x + y
num <- x / y
name <- "Bob" # you can also use single quotes, but the convention is to use double quotes


# A fundamental type of variable in R is a vector (like a 1D array)
# The 'c' function is used to combine vectors or lists
ages <- c(19,20,24, 22, 18)

# how many ages do we have?
length(ages)

# what is the age of the 2nd individual? Note that unlike Java/Python, 
# indexing begins at 1
ages[2]

# What are the ages of individuals 2-4?
ages[2:4]

# What are the ages of the 1st and 3rd individual?
index <- c(1,3)
ages[index]

# What are the ages of the 1st and 3rd individual (alternative approach)? 
ages[c(1,3)]

# a logical vector contains TRUE/FALSE values
ages > 20

# what are the ages greater than 20?
index <- ages > 20
ages[index]    # or alternatively, use ages[ages > 20]

# how many ages are > 20? 
# the 'sum' function sums over all elements in a vector; 
# for a logical vector, TRUE = 1 and FALSE = 0, so 
# 'sum' will count the number of TRUE values
sum(index) 

# another vector example
names <- c("Bob", "Lynn")

# Additional ways of creating vectors
x1 <- 1:10  # integers 1 through 10
x2 <- 20:10 # integers 20 through 10
x3 <- seq(1,10,by=2) # integers 1,3,5,7,9
x4 <- rep(-7, 20) # a vector containing 20 values all equal to -7

###########################################################################
# Question set A
# 1. Create a vector of all integers 1 through 100
# 2. Find the sum of all integers 1 through 100
# 3. How many even integers are there between 50 and 100 (inclusive)?
###########################################################################

# To get help on a command, use the question mark (?) or
# the help.search command, e.g.,
# ?c        ?ls       help.search("plot")


# Additional statistics 
x <- 1:10
sum(x)
min(x)
max(x)


##############################################################################
# Exiting R:
# save.image(file = "intro.RData")     # saves all objects in the workspace
# save(m, person, file = "intro.RData")  # saves selected objects
# q()  ## you will be prompted to save image in default location
################################################################################

###############################################################################
# Select Tools --> Global Options... to set whether you want to
# automatically save your workspace to .RData on exit, and to
# automatically load the .RData workspace on startup
##############################################################################
