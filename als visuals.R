library(tidyverse)

als_data <- read.csv("ALSclean_data.csv")

head(als_data)

summary(als_data)

str(als_data)

colSums(is.na(als_data))


als_data_clean <- als_data %>%
  mutate_if(is.numeric, ~ ifelse(is.na(.), mean(., na.rm = TRUE), .))

colSums(is.na(als_data_clean))

# Plot age distribution
ggplot(als_data_clean, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Age Distribution", x = "Age", y = "Count")

# Plot sex distribution
ggplot(als_data_clean, aes(x = sex)) +
  geom_bar(fill = "lightgreen", color = "black") +
  labs(title = "Sex Distribution", x = "Sex", y = "Count")

# Plot race distribution
ggplot(als_data_clean, aes(x = race)) +
  geom_bar(fill = "lightcoral", color = "black") +
  labs(title = "Race Distribution", x = "Race", y = "Count")

# Plot distribution of baseline ALSFRS score
ggplot(als_data_clean, aes(x = baseline_ALSFRS)) +
  geom_histogram(binwidth = 1, fill = "orchid", color = "black") +
  labs(title = "Baseline ALSFRS Score Distribution", x = "Baseline ALSFRS Score", y = "Count")

# Plot distribution of days since first symptom
ggplot(als_data_clean, aes(x = days_since_first_symptom)) +
  geom_histogram(binwidth = 30, fill = "orange", color = "black") +
  labs(title = "Days Since First Symptom Distribution", x = "Days", y = "Count")

