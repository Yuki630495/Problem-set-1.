library(here)
library(dplyr)
library(tidyr)

x <- readRDS(here("code_and_output", "(d)gdp_ready", "output", "gdp_ready.rds")) 
y <- readRDS(here("code_and_output", "(c)inequality_ready", "output", "inequality_ready.rds")) %>%
  mutate(across(2, as.numeric))

master <- left_join(x, y) %>%
  arrange(country)

saveRDS(master, "master.rds")
