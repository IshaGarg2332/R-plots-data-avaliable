#Import libraries
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

#Get world map as an sf object
world <- ne_countries(scale = "medium", returnclass = "sf")

#Filter only for Asia
asia <- world %>% filter(continent == "Asia")

#Plot Asia
ggplot(asia) +
  geom_sf(fill = "white", color = "black") +
  theme_void() +
  ggtitle("Asia")
