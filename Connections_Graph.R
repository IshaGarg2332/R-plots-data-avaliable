#Import libraries
library(ggplot2)
library(dplyr)
library(maps)

#Import map data
us_map <- map_data("state")

#State centers and names
states <- data.frame(
  name = state.name,
  long = state.center$x,
  lat = state.center$y
)

#Get states to make connections between them
connections <- data.frame(
  from = c("New York", "California", "Illinois", "Texas", "Florida"),
  to   = c("Illinois", "Texas", "Florida", "Florida", "New York")
)

#Merge coordinates
connections <- connections %>%
  left_join(states, by = c("from" = "name")) %>%
  rename(from_long = long, from_lat = lat) %>%
  left_join(states, by = c("to" = "name")) %>%
  rename(to_long = long, to_lat = lat)

#Create connections graph
ggplot() +
  #Draw US states
  geom_polygon(
    data = us_map,                              #use US map polygon data
    aes(x = long, y = lat, group = group),      #map longitude, latitude, and group polygons
    fill = "gray90",                            #fill color for states
    color = "black"                             #border color for states
  ) +
  #Draw curved connections between states
  geom_curve(
    data = connections,
    aes(x = from_long, y = from_lat, xend = to_long, yend = to_lat),
    curvature = 0.2,                                                      #curve amount for the lines
    color = "blue",                                                       #line color
    size = 1,                                                             #line thickness
    alpha = 0.7                                                           #line transparency
  ) +
  #Plot points at selected states
  geom_point(
    data = states %>% filter(name %in% c("New York","California","Illinois","Texas","Florida")),  #filter states to highlight
    aes(x = long, y = lat),                                                                       #coordinates for points
    color = "red",                                                                                #point color
    size = 3                                                                                      #point size
  ) +
  #Add state labels next to points
  geom_text(
    data = states %>% filter(name %in% c("New York","California","Illinois","Texas","Florida")),  #same filtered states
    aes(x = long, y = lat, label = name),                                                         #coordinates and label
    nudge_y = 1,                                                                                  #move label
    size = 3                                                                                      #text size
  ) +
  #Fix aspect ratio
  coord_fixed(1.3) +
  labs(
    title = "US State Connection Map",                                    #title
    subtitle = "Example connections between selected states"              #subtitle
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),     #title style
    plot.subtitle = element_text(hjust = 0.5, size = 12)                  #subtitle style
  )
