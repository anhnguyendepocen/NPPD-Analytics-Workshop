#--- Setup ---------------------------------------------------------------------

# Run setup.R file
source("Setup.R")

library(ggplot2)
qplot(rnorm(100), rnorm(100), color = rbinom(100, 5, 0.2))

#--- Examining the Diamonds Data -----------------------------------------------
head(diamonds)

# Basic Scatterplot
qplot(carat, price, geom = "point", data = diamonds)

# Another Scatterplot
# Fancy colors, real titles, etc.
qplot(carat, log(price), geom = "point", data = diamonds,
      alpha = I(0.2), color = color,
      main = "Log price by carat weight, grouped by color") +
  xlab("Carat Weight") + ylab("Log Price")

#--- Your Turn - Tips Data -----------------------------------------------------
tips <- read.csv("https://bit.ly/2gGoiLR")

# 1. Use qplot to build a scatterplot of variables tips and total bill



# 2. Use options within qplot to color points by smokers



# 3. Clean up axis labels and add main plot title


#-------------------------------------------------------------------------------
