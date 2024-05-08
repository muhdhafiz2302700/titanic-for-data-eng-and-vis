library(tidyverse)

titanic_data <- read.csv("data/people.csv")

# Count the number of survivors and dead folk for each class
survive_count <- titanic_data %>%
  group_by(class) %>% 
  summarise(
    total = length(survived),
    survived = sum(survived == TRUE, na.rm = TRUE),
    #died = sum(survived == FALSE, na.rm = TRUE)
    died = total - survived
    )
print(survive_count)

# Add all that data to a dataframe that will be used for plotting
dataframe <- data.frame(
  class = c("1st", "1st", "2nd", "2nd", "3rd", "3rd", "Crew", "Crew"),
  survived = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
  count = c(survive_count[1,]$survived, survive_count[1,]$died,
            survive_count[2,]$survived, survive_count[2,]$died,
            survive_count[3,]$survived, survive_count[3,]$died,
            survive_count[4,]$survived, survive_count[4,]$died)
)
head(dataframe)

# Plot the graph
ggplot(data=dataframe, aes(x=class, y=count, fill=survived)) +
  # geom_bar looks like it draws the actual bars
  geom_bar(stat="identity", position=position_dodge()) +
  # labs is probably short for labels
  labs(
    x = "Ticket Class",
    y = "Number of Survivors",
    title = "Survivors by Ticket Class") + 
  # Set legend title
  guides(fill=guide_legend(title="Survived")) +
  # Adds the text above each bar
  geom_text(aes(label = count),
             position = position_dodge(width = 1), hjust = 0, vjust=-0.2)
