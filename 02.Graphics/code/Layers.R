#--- Setup ---------------------------------------------------------------------
library(ggplot2)
states <- map_data("state")

#--- Plotting Using Layers -----------------------------------------------------
# Download the file
download.file(url = 'https://srvanderplas.github.io/NPPD-Analytics-Workshop/02.Graphics/data/noaa.rdata',
              destfile = "noaa.rdata")
# Load the file
load("noaa.rdata")

# Floats data:
head(floats)

# Plot floats observations
qplot(Longitude, Latitude, color = callSign, data = floats) +
  coord_map()

# Gliders
qplot(Longitude, Latitude, color = callSign, data = gliders) +
  coord_map()

# Boats
qplot(Longitude, Latitude, color = callSign, data = boats) +
  coord_map()

#--- Layers Preview ------------------------------------------------------------
ggplot() +
  geom_path(data = states, aes(x = long, y = lat, group = group)) +
  geom_point(data = floats, aes(x = Longitude, y = Latitude, color = callSign)) +
  geom_point(aes(x, y), shape = "x", size = 5, data = rig) +
  geom_text(aes(x, y), label = "BP Oil Rig",
            size = 5, data = rig, hjust = -0.1) +
  xlim(c(-91, -80)) + ylim(c(22,32)) + coord_map()

# States plotted first, then floats, then the location of the
# Deepwater Horizon rig, and then a label for the rig.
# Finally, tidy up by changing the limits of the map and ensuring
# the aspect ratio is appropriate.

#--- qplot vs ggplot -----------------------------------------------------------
# Standard qplot syntax
qplot(Longitude, Latitude, color = callSign, data = floats)

# Fully specified ggplot
ggplot(data = floats,
       aes(x = Longitude, y = Latitude, color = callSign)) +
  geom_point() +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete()

# Standard ggplot syntax
ggplot(data = floats,
       aes(x = Longitude, y = Latitude, color = callSign)) +
  geom_point()

#--- Your Turn -----------------------------------------------------------------
# Find the ggplot() statement that creates the plot shown on the slide



#--- What is a Layer? ----------------------------------------------------------
data <- data.frame(x = rnorm(500), y = rnorm(500))

# Scatterplot
ggplot(aes(x = x, y = y), data = data) +
  geom_point()

# Histogram
ggplot(aes(x = x), data = data) +
  geom_histogram()

# Histogram, specifying the statistic and geom
ggplot(aes(x = x), data = data) +
  stat_bin(geom = "bar")

# Smooth Line
ggplot(aes(x = x, y = y), data = data) +
  geom_point() +
  geom_smooth()

# Binned Scatterplot
ggplot(aes(x = x, y = y), data = data) +
  stat_bin2d(geom = "tile")

#--- Piecing Things Together ---------------------------------------------------
ggplot() +
  geom_path(data = states, aes(x = long, y = lat, group = group)) +
  geom_point(data = floats, aes(x = Longitude, y = Latitude, color = callSign)) +
  geom_point(aes(x, y), shape = "x", size = 5, data = rig) +
  geom_text(aes(x, y), label = "BP Oil Rig", size = 5, data = rig, hjust = -0.1) +
  xlim(c(-91, -80)) +
  ylim(c(22, 32)) + coord_map()

#--- Your Turn -----------------------------------------------------------------
# 1. Read in the animal.csv data
#    (Data of animal sightings around the Deepwater Site)
animal <- read.csv("https://bit.ly/2hNlTUl")

# 2. Plot the location of animal sightings on a map of the region



# 3. On this plot, try to color points by class of animal and/or status of animal



# 4. Advanced: Is there a way to indicate time?
library(lubridate)
animal$month <- month(as.Date(animal$Date_))
