# --- List all pkgs in the training -------------------------------------------
# library(tidyverse)
# library(magrittr)
# library(stringr)
# library(ggplot2)
#
# rmd.files <- list.files("*.Rmd", recursive = T, path = "./")
#
# rmd.text <- purrr::map(rmd.files, ~readLines(.x)) %>%
#   unlist()
# pkgs <- unique(rmd.text[str_detect(rmd.text, "^library")])
# -----------------------------------------------------------------------------
