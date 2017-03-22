#--- Programming in R ----------------------------------------------------------

#--- Functions -----------------------------------------------------------------
# Example structure - do not run

# foo <- function(arg1, arg2, ...) {
#   # Code goes here
#   return(output)
# }

# Sample function to compute the mean
mymean <- function(data) {
  ans <- sum(data) / length(data)
  return(ans)
}

# Adding an if statement to ensure means are only computed for numeric data
mymean <- function(data) {
  if (!is.numeric(data)) {
    stop("Numeric input is required")
  } else {
    ans <- sum(data) / length(data)
    return(ans)
  }
}

#--- For Loops -----------------------------------------------------------------
for (i in 1:3) {
  print(i)
}

tips <- read.csv("https://bit.ly/2iNqvKM")

id <- c("total_bill", "tip", "size")
for (colname in id) {
  print(colname)
}

for (colname in id) {
  print(paste(colname, mymean(tips[, colname])))
}

#--- While Loops ---------------------------------------------------------------
i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
}

#--- Your Turn -----------------------------------------------------------------

# 1. Create a function that takes numeric input and provides the mean and standard deviation for the data (`sd` may be useful)


# 2. Add checks to your function to make sure the data is either numeric or logical.  If it is logical convert it to numeric.


# 3. Loop over the columns of the diamonds data set and apply your function to all of the numeric columns.


