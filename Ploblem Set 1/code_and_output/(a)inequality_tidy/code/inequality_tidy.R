library(here)
library(dplyr)
library(tidyr)
library(readxl)

inequality_tidy <- read_xlsx(here("raw_data", "inequality", "data", "Gini.xlsx")) %>%
  t() %>%
  as.data.frame() %>%
  slice(-1) %>%
  select(-1) %>%
  `colnames<-` (c("country", "year", "gini")) %>%
  mutate(across(3, as.numeric)) %>%
  `rownames<-` (1:42)

saveRDS(inequality_tidy, file = "inequality_tidy.rds")

