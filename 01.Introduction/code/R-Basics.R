# --- Getting help in R -------------------------------------------------------

# Function to get help on other functions
help() # with no arguments, you get help on the help function :)

help(head) # help on the head() function, which shows a small portion of your data

?head # gives you the function help page as well


# --- R as an Overgrown Calculator --------------------------------------------

# Addition and Subtraction
2 + 5 - 1

# Multiplication
109*23452

# Division
3/7

# Integer division
7 %/% 2

# Modulo operator (Remainder)
7 %% 2

# Powers
1.5^3

# Exponentiation
exp(3)

# Logarithms
log(3)
log(3, base = 10)

# Trig functions
sin(0)
cos(0)
tan(pi/4)

asin(0)
acos(1)
atan(1)

# --- Variables in R ----------------------------------------------------------
x <- 5
R_awesomeness <- Inf
MyAge <- 21

# Computations with variables
log(x)
MyAge ^ 2

# Variable Names
## Can't start with a number
1age <- 3

## Case Sensitive
Age <- 3
age

## Reserved words can't be used
for <- 3

## R has pre-existing variables and functions you can overwrite:
# This is a VERY bad idea:
T <- FALSE
F <- TRUE

T == FALSE
F == TRUE

rm(T, F) # Fix it!
# rm() removes the variables 'T' and 'F', which resets R's behavior to its default.

# FYI: using "c" as a variable name causes a lot of problems and cryptic error messages

# --- Vectors -----------------------------------------------------------------
# c() creates a vector of values
y <- c(1, 5, 3, 2)
# You can combine vectors with c() as well
z <- c(y, y)

# R performs operations on an entire vector at once
z + 3
y / 2

# Modifying Vectors:
  # Read in tips data again:
  # tips <- read.csv("http://srvanderplas.github.com/NPPD-Analytics-Workshop/01.Introduction/data/tips.csv")
  # Short Link
  tips <- read.csv("https://bit.ly/2fQoMP1")
  tips$rate <- tips$tip/tips$total_bill


# Get the total bill out of the tips dataset
# (copies the data - the original doesn't change)
bill <- tips$total_bill

# Get the first 5 bills
x <- bill[1:5]
x
# Set the first bill to 20
x[1] <- 20
x

# Elements of a vector must all be the same type:
head(bill)
bill[5] <- ":-("
head(bill)
# All of the elements are now strings :(

# Clean up the workspace a bit
rm(x, y, z, bill)

# --- Logical Values ----------------------------------------------------------
x <- c(2, 3, 5, 7)
x[c(TRUE, FALSE, FALSE, TRUE)]
x > 3.5
x[x > 3.5]

# Examples:
# Get the rate variable out of the tips dataset
rate <- tips$rate

head(rate)

sad_tip <- rate < 0.10

rate[sad_tip]


# --- Data Frames -------------------------------------------------------------

# See the structure of a data frame
head(tips)

# Look at one column of the tips data frame
tips$sex[1:20]
# It's a vector


# --- Data Types in R ---------------------------------------------------------

str(tips)
# Structure of the tips data frame - what type each column contains, etc.

class(tips)
# tips has the class 'data.frame'

mode(tips)
# Data frames are "lists" of vectors with the additional constraint that each vector has the same length.

mode(tips$total_bill)
# total_bill is a numeric vector

# --- Converting Between Types ------------------------------------------------
size <- head(tips$size)
size

# Convert to character/string
as.character(size)

# Convert to numeric from character/string
as.numeric("2")

# --- Useful Functions --------------------------------------------------------
tip <- tips$tip
x <- tip[1:5]
length(x) # Number of elements of a vector
sum(x) # Sum of elements in a vector

# Compute basic statistics:
n <- length(tip)
n

meantip <- sum(tip)/n
meantip

standdev <- sqrt(sum((tip - meantip) ^ 2) / (n - 1))
standdev

# R is a statistics program... these functions are also built in:
mean(tip)
sd(tip)

summary(tip)
quantile(tip, c(.25, .75)) # 25th and 75th percentiles

# --- Element-wise Logical Operators ------------------------------------------
# AND
c(T, T, F, F) & c(T, F, T, F)

# OR
c(T, T, F, F) | c(T, F, T, F)

# Use to enforce multiple conditions and filter data frames
# Which are big bills with a poor tip rate?
id <- (tips$total_bill > 40 & tips$rate < .10)
tips[id,]
