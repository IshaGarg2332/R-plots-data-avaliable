#Import libraries
library(ggplot2)
library(maps)
library(dplyr)
library(sf)

#Get world map as an sf object
world_sf <- st_as_sf(map("world", plot = FALSE, fill = TRUE))

#Filter only North America
north_america <- world_sf %>%
  filter(ID %in% c("USA", "Canada", "Mexico"))

#Plot North America
ggplot(north_america) +
  geom_sf(fill = "white", color = "black") +
  coord_sf(crs = st_crs(4326), xlim = c(-170, -50), ylim = c(5, 80)) +
  theme_void() +
  ggtitle("North America")
