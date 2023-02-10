library(here)
library(dplyr)
library(tidyr)

install.packages("summarytools")
library(summarytools)
install.packages("knitr")
library(knitr)
library(ggplot2)

dataset <- readRDS(here("code_and_output", "(e)master", "output", "master.rds"))

dataset %>%
  group_by(country) %>%
    descr(stats = c("mean", "min", "med", "max"), digits = 7) 

ggplot(dataset) +
  geom_line(aes(x = year, y = gini, color = country), size = 2.0) +
  xlim(c(1975,NA))
B.データ分析
ggplot(dataset) +
  geom_point(aes(x = GDP_per_capita , y = gini, color = country), size = 4.0)

dataset_grouped <- dataset %>%
  group_by(country) %>%
  nest()

regression <- lm(gini ~ I(GDP_per_capita^2)
         + GDP_per_capita,
         data = dataset)

regression

regression_grouped <- 
  dataset %>% group_by(country) %>%
  do(result =  lm(gini ~ I(GDP_per_capita^2)
                  + GDP_per_capita,
                  data =.data ))

regression_grouped$result

