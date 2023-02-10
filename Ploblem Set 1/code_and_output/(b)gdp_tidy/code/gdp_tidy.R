library(here)
library(dplyr)
library(tidyr)

 Japan_gdp <- read.csv(here("raw_data", "gdp", "data", "Japan.csv"))
 US_gdp <- read.csv(here("raw_data", "gdp", "data", "United States.csv"))

gdp_tidy <- bind_rows(list(JPN = Japan_gdp, USA = US_gdp), .id = "country")

saveRDS(gdp_tidy, file = "gdp_tidy.rds")
      