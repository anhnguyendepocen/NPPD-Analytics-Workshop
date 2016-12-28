#--- Perception ----------------------------------------------------------------

#--- Your Turn -----------------------------------------------------------------
# Find ways to improve the following graphic
# Make sure the "oddball" stands out while keeping information on the groups
frame <- read.csv("https://bit.ly/2i3Q4Gf")
qplot(x, y, data = frame, shape = g1, colour = g2, size = I(4))

# Hint: interaction() combines factor variables (such as g1, g2)

#--- Gradients -----------------------------------------------------------------
library(RColorBrewer)
display.brewer.all()


#--- Your Turn -----------------------------------------------------------------
# In the diamonds data, cut is ordinal, while price and carat are continuous
# Find a graphic that gives an overview of these three variables
# while respecting their types

# Hint: Start with the following code:
qplot(carat, price, colour = clarity, data = diamonds)




#--- Facetting -----------------------------------------------------------------
qplot(price, carat, data = diamonds, color = color,
      facets = . ~ clarity)


#--- Your Turn -----------------------------------------------------------------
# The movies dataset contains information from IMDB.com including ratings,
# genre, length in minutes, and year of release.

movies <- read.csv("https://bit.ly/2hqhCoM")

# Explore the differences in length, rating, etc. in movie genres over time
# Hint: use facetting!





