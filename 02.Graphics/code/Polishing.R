#--- Setup ---------------------------------------------------------------------
library(ggplot2)
states <- map_data("state")

#--- Polishing Plots -----------------------------------------------------------
# Plot Title
qplot(carat, price, data = diamonds) +
  ggtitle("Price vs Carat for Diamonds")

# Axis titles
qplot(carat, price, data = diamonds) +
  xlab("Carat") +
  ylab("Price ($)") +
  ggtitle("Price vs Carat for Diamonds")

#--- Built-in Themes -----------------------------------------------------------
# Default Theme
qplot(carat, price, data = diamonds)
# Black and White theme
qplot(carat, price, data = diamonds) + theme_bw()

# Set theme_bw() as the default theme
theme_set(theme_bw())

# Set theme_grey() (the default) as the default theme
theme_set(theme_grey())

# See the components of a theme
theme_bw()

#--- Modifying a Plot ----------------------------------------------------------
p <- qplot(carat, price, data = diamonds) +
  ggtitle("Price vs Carat for Diamonds")
p + theme(plot.title = element_text(colour = "red", angle = 20))

# Use this power wisely

# Remove axes (for maps)
p + theme(
  axis.text.x = element_blank(),
  axis.text.y = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  axis.ticks.length = unit(0, "cm")
)

#--- Saving Your Work ----------------------------------------------------------
qplot(total_bill, tip, data = diamonds)

# Save as a png
ggsave("tips.png")

# Save as a pdf
ggsave("tips.pdf")

# Force a specific size
ggsave("tips.png", width = 6, height = 6)

# Change the resolution
ggsave("tips.png", width = 6, height = 6, dpi = 300)

# Explicitly specify which plot to save
dplot <- qplot(carat, price, data = diamonds)
ggsave("diamonds.png", plot = dplot, dpi = 72)

#--- Your Turn -----------------------------------------------------------------
# 1. Save a pdf of a scatterplot of price vs carat



# 2. Open up the pdf in Adobe Acrobat (or another PDF Reader)



# 3. Save a png of the same scatterplot


