library(here)
library(dplyr)
library(tidyr)
library(readxl)

 Japan_gdp <- read.csv(here("02_raw", "gdp", "data", "Japan.csv"))
 US_gdp <- read.csv(here("02_raw", "gdp", "data", "United States.csv"))

gdp_tidy <- bind_rows(list(JPN = Japan_gdp, USA = US_gdp), .id = "country")
      