library(here)
library(dplyr)
library(tidyr)

gdp_ready <- readRDS(here("code_and_output", "(b)gdp_tidy", "output", "gdp_tidy.rds")) %>%
  mutate(GDP_per_capita = GDP/population) 

saveRDS(gdp_ready, file = "gdp_ready.rds")
