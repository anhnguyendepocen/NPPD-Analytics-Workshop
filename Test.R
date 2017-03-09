# This script tests to see if all packages required by the R training are
# installed on your machine
# If they are not installed, the script attempts to install the packages.

# Report any messages other than "You're good to go!" on Slack so that
# any problems can be addressed before the training


# Packages required by the training
pkg.list <- c("stringr", "ggplot2", "pander", "dplyr", "maps", "lubridate",
              "scales", "RColorBrewer", "gridExtra", "readxl", "foreign", "tidyr")

# Packages installed on the machine
all.pkgs <- installed.packages()

# Create a data frame listing installation status of required packages
status <- data.frame(package = pkg.list,
                     # This line tests to see if the required packages
                     # are in the installed packages list
                     installed = pkg.list %in% all.pkgs[,1])


# This code tries to load each package and returns FALSE if the package
# loading process returns an error
status$loads <- unlist(lapply(status$package, function(.x) {
  res <- try(eval(parse(text = (sprintf("suppressMessages(library(%s))", .x)))))
  res2 <- unlist(paste(res, collapse = ", "))
  !grepl("Error", x = res2)
}))

# If all packages are installed and load, then output a happy message
if (sum(!status$installed) == 0 & sum(!status$loads) == 0) {
  message("You're good to go!")
} else {
  # Otherwise, attempt to install missing packages
  lapply(status$package[!status$installed], function(.) {
    eval(parse(text = sprintf("install.packages('%s')", .)))
  })
}
