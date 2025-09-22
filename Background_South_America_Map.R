#Import libraries
library(ggplot2)
library(maps)
library(dplyr)
library(sf)

#Get world map as an sf object
world_sf <- st_as_sf(map("world", plot = FALSE, fill = TRUE))

#Filter only South America
south_america <- world_sf %>%
  filter(ID %in% c(
    "Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Ecuador",
    "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela",
    "French Guiana"
  ))

#Plot South America
ggplot(south_america) +
  geom_sf(fill = "white", color = "black") +
  coord_sf(crs = st_crs(4326), xlim = c(-85, -30), ylim = c(-60, 15)) +    
  theme_void() +
  ggtitle("South America")
