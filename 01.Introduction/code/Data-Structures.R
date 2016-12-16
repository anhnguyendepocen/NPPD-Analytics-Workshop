# --- Setup -------------------------------------------------------------------
# Load the iris data
data(iris)
# Load ggplot2
library(ggplot2)
# Load the diamonds data
data(diamonds)

# --- Data Frames -------------------------------------------------------------
flower <- iris # make a copy
flower[,5] # Show the 5th column
flower$Species # Show the column named `Species`

# Logical Indexing:
flower$Species == "setosa"

# Show all rows of the dataset where Species is setosa
flower[flower$Species == "setosa", ]

# Create a data frame
mydf <- data.frame(NUMS = 1:5,
                   lets = letters[1:5],
                   vehicle = c("car", "boat", "car", "car", "boat"))
mydf

# Change variable names
names(mydf)[1] <- "nums"
mydf

# --- Lists -------------------------------------------------------------------

# Create a list with a matrix and a vector
mylist <- list(matrix(letters[1:10], nrow = 2, ncol = 5),
               seq(0, 49, by = 7))
mylist

# Select the second element in the list (the vector)
mylist[[2]]

# Select the first row in the matrix
mylist[[1]][1,] # First thing in the list, first row in the matrix

# --- Examining Objects -------------------------------------------------------

head(diamonds, n = 2) # first 2 rows of diamonds data frame
tail(diamonds) # last 6 rows of diamonds data frame

str(diamonds) # structure of diamonds data frame
str(mylist) # structure of mylist list

summary(diamonds) # summarize each column in diamonds
summary(mylist) # summarize mylist - # values in each item in the list

dim(diamonds) # dimensions of diamonds data frame
dim(mylist) # mylist doesn't have dimensions because it isn't a rectangular object

length(diamonds) # diamonds is a data frame with 10 columns (or really, a list with 10 vectors that are the same length)
length(mylist) # mylist has 2 objects

# --- Working with output from a function -------------------------------------

# Subset the data so that there are only two types of irises
iris.subset <- iris[iris$Species != "virginica", ]

# Conduct a t-test
t.test(Petal.Length ~ Species, data = iris.subset)

# Conduct a t-test and save the output
tout <- t.test(Petal.Length ~ Species, data = iris.subset)

# Look at the object structure
str(tout)
# It's a named list

# We can extract the p-value by name or by index
tout$p.value
tout[[3]]
