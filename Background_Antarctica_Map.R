#Import libraries
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

#Get world map as an sf object
world <- ne_countries(scale = "medium", returnclass = "sf")

#Filter only for Antarctica
Antarctica <- world %>% filter(continent == "Antarctica")

#Plot Antarctica
ggplot(Antarctica) +
  geom_sf(fill = "white", color = "black") +
  coord_sf(crs = st_crs("+proj=laea +lat_0=-90")) +  #polar projection
  theme_void() +
  ggtitle("Antarctica")
