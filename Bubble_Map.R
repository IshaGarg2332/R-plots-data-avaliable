#Import libraries
library(ggplot2)
library(dplyr)
library(maps)

#Import data
data("us.cities")

#Optional: filter to cities with population >100000
cities <- us.cities %>% filter(pop > 100000)

#Load US states
us_map <- map_data("state")

#Filter cities to continental US only
cities_cont <- cities %>%
  filter(lat >= 24.5 & lat <= 49.5, long >= -125 & long <= -66.5)

#Create bubble map
ggplot() +
  # =Draw the US states
  geom_polygon(
    data = us_map,
    aes(x = long, y = lat, group = group),        #map long/lat and group for polygon shapes
    fill = "gray90",                              #fill color of states
    color = "black"                               #border color of states
  ) +
  geom_point(
    data = cities_cont,                            #use filtered US cities
    aes(x = long, y = lat, size = pop),            #bubble location and size by population
    color = "steelblue",                           #bubble color
    alpha = 0.6                                    #transparency of bubbles
  ) +
  #Fix aspect ratio
  coord_fixed(1.3) +
  labs(
    title = "US Cities Bubble Map (Continental US)",                         #title
    subtitle = "Bubble size represents city population",                     #subtitle
    x = "Longitude",                                                         #x-axis label
    y = "Latitude",                                                          #y-axis label
    size = "Population"                                                      #legend label
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),        #title style
    plot.subtitle = element_text(hjust = 0.5, size = 12),                    #subtitle style
    legend.title = element_text(face = "bold"),                              #legend title style
    legend.text = element_text(size = 10)                                    #legend text size
  )
