#--- Plotting Map Data ---------------------------------------------------------
# Ensure libraries are loaded
library(ggplot2)
library(maps)
library(lubridate)

# States Data
states <- map_data("state")
head(states)

# Basic Map
qplot(long, lat, geom = "point", data = states)

# A Better Map
# Lines are connected in the correct order
qplot(long, lat, geom = "path", data = states, group = group) +
  coord_map()

# A Map with Polygons
# The polygons can be shaded to provide a layer of information
# in addition to the state boundaries
qplot(long, lat, geom = "polygon",
      data = states, group = group) +
  coord_map()

# Fancier map
# Here, the polygons are shaded white. In contrast with the lines map,
# the background doesn't show through when polygons are plotted.
qplot(long, lat, geom = "polygon",
      fill = I("white"), color = I("black"),
      data = states, group = group) +
  coord_map()

# Bonus fun
# There are 63 separate pieces of this map, each shaded a
# (slightly) different color.
qplot(long, lat, geom = "polygon",
      fill = factor(group, levels = sample(1:63, 63)), color = I("black"),
      data = states, group = group) +
  coord_map() +
  scale_fill_discrete(guide = F)
# For instance, the upper peninsula of Michigan is drawn separately from
# the lower peninsula. Long Island is a different color than the rest of
# New York as well.

#--- Incorporating Information Into Maps ---------------------------------------
# Categorical Data
statereg <- read.csv("https://bit.ly/2i0AFHK")
head(statereg)

## Joining Data
library(dplyr)
states.class.map <- left_join(states, statereg, by = c("region" = "State"))
head(states.class.map)

## Plotting Joined Data
qplot(long, lat, geom = "polygon", data = states.class.map,
      group = group, fill = StateGroups, color = I("black")) +
  coord_map()

# Numerical Data
states.stats <- read.csv("https://bit.ly/2gT95Hc")
head(states.stats)

## Joining Data
states.map <- left_join(states, states.stats, by = c("region" = "state.name"))
head(states.map)

## Plotting Joined Data
# avg.qlrest2 = Average # of days in the last 30 days of insufficient sleep
qplot(long, lat, geom = "polygon", data = states.map,
      group = group, fill = avg.qlrest2) + coord_map()
# Sleepless in West Virginia doesn't have the same ring to it...

# Adding Extra Variables - BRFSS Data by Gender and State
states.sex.stats <- read.csv("https://bit.ly/2hiKFIb")
head(states.sex.stats)

states.sex.map <- left_join(states, states.sex.stats, by = c("region" = "state.name"))
head(states.sex.map)

# Plot a map for men and another for women
# Average # of alcoholic drinks per day, by state and gender
qplot(long, lat, geom = "polygon", data = states.sex.map,
      group = group, fill = avg.drnk) + coord_map() +
  facet_grid(sex ~ .)

#--- Your Turn -----------------------------------------------------------------
states.sex.stats <- read.csv("https://bit.ly/2hiKFIb")
head(states.sex.stats)

# 1. Use left_join to combine child healthcare data with maps information



# 2. Use qplot to create a map of child healthcare undercoverage rates by state

#-------------------------------------------------------------------------------


#--- Cleaning Up Your Maps -----------------------------------------------------
# Add plot titles, map coordinates, a nicer color scheme, and get rid of axes
qplot(long, lat, geom = "polygon", data = states.map,
      group = group, fill = avg.drnk) +
  coord_map() +  theme_bw() +
  scale_fill_gradient2(
    name = "Avg Drinks",
    limits = c(1.5, 3.5),
    low = "lightgray", high = "red") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank()) +
  ggtitle("Average Number of Alcoholic Beverages
          Consumed Per Day by State")

#--- Your Turn -----------------------------------------------------------------
# Use options to polish the look of your map of child healthcare undercoverage
# rate by state


#-------------------------------------------------------------------------------
