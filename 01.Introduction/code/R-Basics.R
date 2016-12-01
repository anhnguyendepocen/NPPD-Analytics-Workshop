# Read in the data
tips <- read.csv("http://srvanderplas.github.com/NPPD-Analytics-Workshop/01.Introduction/data/tips.csv")
# Create a new variable - tipping rate
tips$rate <- tips$tip / tips$total_bill


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

# Variables in R
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
# using "c" as a variable name causes a lot of problems and cryptic error messages

# Vectors
# c() creates a vector of values
y <- c(1, 5, 3, 2)
# You can combine vectors with c() as well
z <- c(y, y)
# R performs operations on an entire vector at once
z + 3
y / 2
