# --- Read in the data --------------------------------------------------------
# tips <- read.csv("http://srvanderplas.github.com/NPPD-Analytics-Workshop/01.Introduction/data/tips.csv")
# Short Link
tips <- read.csv("https://bit.ly/2fQoMP1")


# --- Data Exploration --------------------------------------------------------
# Take a look at the data
# First few rows
head(tips)
# Show the structure of the data set
str(tips)
# Summarize the variables/columns
summary(tips)

# --- Graphical Exploration ---------------------------------------------------
# Install a package to plot the data
# install.packages("ggplot2")
# Load the package
library(ggplot2)

# Basic scatterplot of tips vs. total bill
qplot(tip, total_bill, geom = "point", data = tips)
# Add in time of day (meal time) as color of points
qplot(tip, total_bill, geom = "point", data = tips, colour = time)
# Add a linear regression
qplot(tip, total_bill, geom = "point", data = tips) + geom_smooth(method = "lm")

# --- Working with the data ---------------------------------------------------
# Create a new variable - tipping rate
tips$rate <- tips$tip / tips$total_bill
# Summarize tip rate - min, max, quartiles, and mean
summary(tips$rate)

# Histogram of tipping rate
qplot(rate, data = tips, binwidth = .01)

# What's the deal with the really high tipping rate?
tips[which.max(tips$rate),]

# Do tipping rates differ by gender?
mean(tips$rate[tips$sex == "Male"])
mean(tips$rate[tips$sex == "Female"])

# Is the difference significant?
# Conduct a t-test (statistical test) to see if the tip rate differs significantly by gender

t.test(rate ~ sex, data = tips)
# Statistical  Explanation:
# The test calculates the probability that if the rates don't differ
# in reality, any observed difference is due to chance.
# If P(difference is due to chance) < 0.05,
# then it is unlikely that a difference of that size would be due to
# randomness alone (so we'd say the rates are significantly different).

# Boxplots of tips by whether or not the person paying the bill is a smoker
qplot(smoker, rate, geom = "boxplot", data = tips)
