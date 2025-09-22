#Import libraries
library(ggplot2)
library(maps)
library(dplyr)

#Prepare map and data
us_map <- map_data("state")
state_data <- data.frame(state.x77) %>%
  mutate(State = tolower(rownames(state.x77)))
map_df <- us_map %>%
  left_join(state_data, by = c("region" = "State"))

#Create choropleth map
ggplot(map_df, aes(x = long, y = lat, group = group, fill = Population)) +
  geom_polygon(color = "white") +                                                 #state borders
  coord_fixed(1.3) +                                                              #fix aspect ratio
  scale_fill_gradient(low = "lightyellow", high = "darkred") +                    #color gradient
  labs(
    title = "US States by Population (1977)",                               #title
    fill = "Population",                                                    #legend title
    x = "Longitude",                                                        #x-axis
    y = "Latitude"                                                          #y-axis
  ) +
  theme_minimal(base_size = 14) +                                           #minimal theme
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),       #title style
    axis.title = element_text(face = "bold"),                               #axis title style
    axis.text = element_text(size = 12),                                    #axis text style
    legend.title = element_text(face = "bold", size = 12),                  #legend title style
    legend.text = element_text(size = 11)                                   #legend text style
  )
