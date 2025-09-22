#Import libraries
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

#Get world map as an sf object
world <- ne_countries(scale = "medium", returnclass = "sf")

#Filter only for Africa
Africa <- world %>% filter(continent == "Africa")

#Plot Africa
ggplot(Africa) +
  geom_sf(fill = "white", color = "black") +
  theme_void() +
  ggtitle("Africa")
