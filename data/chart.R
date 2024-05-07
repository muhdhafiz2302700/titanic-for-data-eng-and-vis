library(readr)
titanic_data <- read.csv("data/people.csv")

library(dplyr)

survivor_counts <- titanic_data %>%
  group_by(class) %>%
  summarise(survivors = sum(survived, na.rm = TRUE))

library(ggplot2)

ggplot(survivor_counts, aes(x = class, y = survivors, fill = class)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Survivors by Ticket Class", x = "Ticket Class", y = "Number of Survivors") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")  # Adds color