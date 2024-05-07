# Example: Assume the dataset is already loaded into a dataframe named 'titanic_data'
titanic_data <- read.csv("data/people.csv")

# Calculate survival rates by class
library(dplyr)

# Assuming 'survived' column is a binary 0 (did not survive) or 1 (survived)
survival_summary <- titanic_data %>%
  group_by(class) %>%
  summarise(survival_rate = mean(survived) * 100) %>%
  arrange(desc(survival_rate))

# Print the survival summary table
print(survival_summary)

