#Import libraries
library(ggplot2)
library(maps)

#Import map data
us_map <- map_data("state")

#Create map as background
ggplot() +
  geom_polygon(data = us_map, 
               aes(x = long, y = lat, group = group), 
               fill = "lightgray",                           #fill color for states
               color = "white") +                            #borders between states
  coord_fixed(1.3) +                                         #fix aspect ratio
  labs(
    title = "US Map Background",                                            #title
    x = "Longitude",                                                        #x-axis label
    y = "Latitude"                                                          #y-axis label
  ) +
  theme_minimal(base_size = 14) +                                           #minimal theme
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),       #title style
    axis.title = element_text(face = "bold"),                               #axis title style
    axis.text = element_text(size = 12)                                     #axis text
  )
