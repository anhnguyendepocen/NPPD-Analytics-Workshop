pkgs <- c("ggplot2", "dplyr", "plyr", "tidyr", "readxl", "foreign", "lubridate", "magrittr", "devtools")

# List all installed packages
installed.pkgs <- installed.packages()

# Find which packages are not installed
pkgs <- pkgs[!pkgs %in% installed.pkgs]

# Install missing packages
if (length(pkgs) > 0) {
  install.packages(pkgs)
}

# devtools::install_github("garrettgman/DSR")
# library(DSR)

library(ggplot2)
library(dplyr)
library(tidyr)
library(readxl)
library(foreign)
library(lubridate)
