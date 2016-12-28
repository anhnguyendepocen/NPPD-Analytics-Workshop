library(DSR)
library(tidyr)
library(dplyr)


table2 %>%
  mutate(fullkey = interaction(year, key)) %>%
  arrange(year, key) %>%
  select(-year, -key) %>%
  spread(key = fullkey, value = value) %>%
  select(country, `1999.cases`, `1999.population`, `2000.cases`, `2000.population`) %>%
  write.csv(file = "data/TB_Cases.csv")

