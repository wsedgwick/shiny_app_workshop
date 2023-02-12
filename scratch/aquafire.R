library(tidyverse)
library(here)


ca_fire_perimeters <- read_csv(here("raw_data", "California_Fire_Perimeters.csv"))

ca_fire_perimeters

ggplot(data = ca_fire_perimeters, aes(x = YEAR_)) +
  geom_bar() +
  labs(x = "Year of Wildfire",
       y = "Frequency") +
  scale_x_continuous(limits = c(1960, 2020))

head(ca_fire_perimeters)  


cause_sum <- ca_fire_perimeters %>% 
  group_by(CAUSE) %>% 
  summarise(count = n())



cause_sum_sorted <- cause_sum %>% arrange(desc(count))
cause_sum_sorted

# 1 = lightning
# 9 = miscellaneous
# 14 is unkown/unidentified
# 2 is equipment use
# 7 is arson
# 5 is debris
# 10 is vehicle
