#Import libraries
library(ggplot2)
library(maps)
library(dplyr)

#Get world map as sf object
world_sf <- st_as_sf(map("world", plot = FALSE, fill = TRUE))

#Create world map
ggplot(world_sf) +
  geom_sf(fill = "white", color = "black") +  #Polygon outlines
  coord_sf(crs = st_crs(4326)) +              #WGS84 lon/lat projection
  theme_void() +
  ggtitle("World Map")                        #Title
