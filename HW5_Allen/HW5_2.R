# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

# Load the data set

load("house_prices.rda")

# Reshape the data
house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value", house_price_index, unemploy_perc) %>%
  select(state, year, measure, value)

# Ensure 'year' is of Date type if not already
house_reshaped <- house_reshaped %>%
  mutate(year = ymd(paste0(year, "-01-01")))

# Plot using facet_wrap
ggplot(house_reshaped, aes(x = year, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_date(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("80", "00", "20")) +
  theme_minimal() +
  labs(title = "Trends of House Price Index and Unemployment Percentage by State",
       x = "Year",
       y = "Value",
       color = "Measurement")

