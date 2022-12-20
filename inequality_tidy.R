library(here)
library(dplyr)
library(tidyr)
library(readxl)

inequality_tidy <- read_xlsx(here("02_raw", "inequality", "data", "Gini.xlsx")) %>%
  t() %>%
  as.data.frame() %>%
  slice(-1) %>%
  select(-1) %>%
  `colnames<-` (c("country", "year", "gini")) %>%
  mutate(across(2:3, as.numeric))
