library(tidyverse)

titanic_data <- read.csv("data/people.csv")
names(titanic_data)

titanic_data %>%
  group_by(class) %>%
  summarise(survival_rate = round(mean(survived) * 100, 2)) %>%
  arrange(desc(survival_rate)) %>%
  view
