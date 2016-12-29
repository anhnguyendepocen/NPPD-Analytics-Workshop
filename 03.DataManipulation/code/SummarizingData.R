#--- Summarizing Data ----------------------------------------------------------

# Baseball Data
data(baseball, package = "plyr")
help(baseball, package = "plyr")
head(baseball)

# Sammy Sosa's data
ss <- subset(baseball, id == "sosasa01")
head(ss, 3)
mean(ss$h / ss$ab)

#--- For Loops -----------------------------------------------------------------
?for

players <- unique(baseball$id)
n <- length(players)

ba <- rep(NA, n)

for (i in 1:n) {
  career <- subset(baseball, id == players[i])
  ba[i] <- with(career, mean(h / ab, na.rm = TRUE))
}

head(ba)

summary(ba)

career.batting.avg <- data.frame(player = players, ba = ba)
head(career.batting.avg)

#--- Your Turn -----------------------------------------------------------------
# MLB rules for the greatest all-time hitters are that players have to have
# played at least 1000 games with at least 1000 at-bats in order to be considered

# Extend the for loop above to collect the additional information
# Introduce and collect data for two new variables: games and atbats






#--- Summarize -----------------------------------------------------------------
library(dplyr)

baseball <- read.csv("https://bit.ly/2iFyIwL")

# Full dataset summary
summarize(baseball,
          ba = mean(h / ab, na.rm = TRUE),
          games = sum(g, na.rm = TRUE),
          hr = sum(hr, na.rm = TRUE),
          ab = sum(ab, na.rm = TRUE))

# Sammy Sosa summary
summarize(subset(baseball, id == "sosasa01"),
          ba = mean(h / ab, na.rm = TRUE),
          games = sum(g, na.rm = TRUE),
          hr = sum(hr, na.rm = TRUE),
          ab = sum(ab, na.rm = TRUE))

#--- dplyr + Summarize ---------------------------------------------------------
# Summary by player id - full career stats
careers <- summarize(group_by(baseball, id),
                     ba = mean(h / ab, na.rm = TRUE),
                     games = sum(g, na.rm = TRUE),
                     homeruns = sum(hr, na.rm = TRUE),
                     atbats = sum(ab, na.rm = TRUE))

head(careers)

#--- Pipes ---------------------------------------------------------------------
careers <- baseball %>%
  group_by(id) %>%
  summarize(
    ba = mean(h / ab, na.rm = TRUE),
    games = sum(g, na.rm = TRUE),
    homeruns = sum(hr, na.rm = TRUE),
    atbats = sum(ab, na.rm = TRUE)
  )

#--- Your Turn -----------------------------------------------------------------
# Find some summary statistics for each of the teams (variable team):
# How many different (unique) players has the team had?
# What was the team’s first/last season?
# Challenge: Find the number of players on each team over time. Does the number change?



