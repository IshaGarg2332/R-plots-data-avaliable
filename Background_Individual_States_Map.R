#Import libraries
library(readxl)
library(ggplot2)
library(maps)
library(tidyverse)

#Create outline of California (or any state)
MainStates <- map_data("state")
Cali <- subset(MainStates, region %in% c("california"))

ca_df <- MainStates %>%
  filter(region == "california")

counties <- map_data("county")
ca_county <- counties %>%
  filter(region == "california")

#Plot outline of California (or any state)
ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat, group = group)) +
  coord_quickmap() +
  geom_polygon(color = "black", fill = "white")
ca_base + theme_void()
