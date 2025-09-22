#Import libraries
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

#Get world map as an sf object
world <- ne_countries(scale = "medium", returnclass = "sf")

#Filter only for Australia country
#Use 'admin' column
Australia <- world %>% filter(admin == "Australia")

# Plot Australia
ggplot(Australia) +
  geom_sf(fill = "white", color = "black") +
  theme_void() +
  ggtitle("Australia")