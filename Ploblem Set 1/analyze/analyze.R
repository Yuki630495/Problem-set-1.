library(here)
library(dplyr)
library(tidyr)
library(ggplot2)

dataset <- readRDS(here("code_and_output", "(e)master", "output", "master.rds"))



ggplot(dataset) +
  geom_line(aes(x = year, y = gini, color = country), size = 2.0) +
  xlim(c(1975,NA))

ggplot(dataset) +
  geom_point(aes(x = GDP_per_capita , y = gini, color = country), size = 4.0)

regression <- lm(gini ~ I(GDP_per_capita^2)
         + GDP_per_capita,
         data = dataset)
summary(regression)


