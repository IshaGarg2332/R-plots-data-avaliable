#Import libraries
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

#Get world map as an sf object
world <- ne_countries(scale = "medium", returnclass = "sf")

#Filter only for Europe
Europe <- world %>% filter(continent == "Europe")

#Crop to reasonable longitude/latitude bounds
europe_cropped <- st_crop(Europe, xmin = -10, xmax = 41, ymin = 34, ymax = 72)

#Plot Europe
ggplot(europe_cropped) +
  geom_sf(fill = "white", color = "black") +
  theme_void() +
  ggtitle("Europe (Cropped)")
