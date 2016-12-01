# Read in the data
tips <- read.csv("http://srvanderplas.github.com/NPPD-Analytics-Workshop/01.Introduction/data/tips.csv")

# Take a look at the data
# First few rows
head(tips)
# Structure of the object
str(tips)
# Summarize the variables/columns
summary(tips)


# Install a package to plot the data
install.packages("ggplot2")
# Load the package
library(ggplot2)

# Basic scatterplot of tips vs. total bill
qplot(tip, total_bill, geom = "point", data = tips)
# Add in time of day (meal time) as color of points
qplot(tip, total_bill, geom = "point", data = tips, colour = time)
# Add a linear regression
qplot(tip, total_bill, geom = "point", data = tips) + geom_smooth(method = "lm")

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
t.test(rate ~ sex, data = tips)

# Boxplots of tips by whether or not the person paying the bill is a smoker
qplot(smoker, rate, geom = "boxplot", data = tips)
