#--- Transforming and Analyzing Data -------------------------------------------

# French Fries Data
french_fries <- read.csv("https://bit.ly/2hOI890")
head(french_fries)

library(ggplot2)

# Annoyingly hard to construct boxplots
qplot("1_buttery", buttery, data = french_fries, fill = I("red"), geom = "boxplot") +
  geom_boxplot(aes(x = "2_grassy", y = grassy), fill = I("orange")) +
  geom_boxplot(aes(x = "3_painty", y = painty), fill = I("yellow")) +
  geom_boxplot(aes(x = "4_potato", y = potato), fill = I("green")) +
  geom_boxplot(aes(x = "5_rancid", y = rancid), fill = I("blue")) +
  xlab("variable") + ylab("rating")


#--- Gathering -----------------------------------------------------------------
library(tidyr)

french_fries_long <- gather(french_fries,
                            key = variable,
                            value = rating,
                            potato:painty)

head(french_fries_long)

# Much easier boxplot
qplot(variable, rating, data = french_fries_long,
      fill = variable, geom = "boxplot")

#--- Spread --------------------------------------------------------------------
head(french_fries_long)

french_fries_wide <- spread(french_fries_long,
                            key = variable, value = rating)

head(french_fries_wide)

#--- Your Turn -----------------------------------------------------------------
# Read in the billboard top 100 music data
billboard <- read.csv("https://bit.ly/2hQGDao")

# 1. Use tidyr to convert this data into a long format.



# 2. Use ggplot2 to create a time series plot



#--- Split-Apply-Combine -------------------------------------------------------
library(dplyr)

french_fries_rating <- french_fries_long %>%
  # SPLIT:
  group_by(variable) %>%
  # APPLY + COMBINE:
  summarize(rating = mean(rating, na.rm = T))

french_fries_rating

#--- dplyr verbs ---------------------------------------------------------------

# Filter
french_fries %>%
  filter(subject == 3, time == 1)

# Arrange
french_fries %>%
  arrange(desc(rancid)) %>%
  head

# Select
french_fries %>%
  select(time, treatment, subject, rep, potato) %>%
  head

# Mutate
french_fries %>%
  mutate(rancid2 = rancid^2) %>%
  head

# Summarize
french_fries %>%
  group_by(time, treatment) %>%
  summarize(mean_rancid = mean(rancid),
            sd_rancid = sd(rancid))


#--- Your Turn -----------------------------------------------------------------

# This dataset contains information on over 300,000 flights that departed from
# New York City in the year 2013.

flights <- read.csv("https://bit.ly/2hzhAfW")

# Using dplyr and the pipe operator (%>%), create a data frame consisting of the
# average arrival delay (arr_delay) based on the destination airport (dest).
# Sort this data frame in descending order, so the destination airport with the
# largest delay is first.


# Find out the most used airports for each airline carrier.




#--- Dates and Times -----------------------------------------------------------
library(lubridate)

# Basic use
now()
today()
now() + hours(4)
today() - days(2)

# Parsing Dates
ymd("2013-05-14")
mdy("05/14/2013")
dmy("14052013")
ymd_hms("2013:05:14 14:50:30", tz = "America/Chicago")


#--- Your Turn -----------------------------------------------------------------
# 1. Using the flights data, create a new column Date using lubridate.
#    Paste together the columns year, month, and day in order to do this.
#    See the paste function.
?paste



# 2. Use dplyr to calculate the average departure delay for each date.



# 3. Plot the date versus the average departure delay

