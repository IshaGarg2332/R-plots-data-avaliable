#Import libraries
library(ggplot2)
library(dplyr)
library(sf)
library(cartogram)
library(maps)

#Import data
us_states <- st_as_sf(map("state", plot = FALSE, fill = TRUE))

#Transform to planar CRS
us_states <- st_transform(us_states, crs = 5070)

#Add state names and population
us_states <- us_states %>%
  mutate(region = tolower(ID),
         population = state.x77[match(region, tolower(state.name)), "Population"])

#Create cartogram obejct
us_cartogram <- cartogram_cont(us_states, "population", itermax = 5)

#Create cartogram
ggplot(us_cartogram) +
  geom_sf(aes(fill = population), color = "black") +                 #fill by population
  scale_fill_gradient(low = "lightblue", high = "darkblue") +        #color gradient
  labs(
    title = "US Cartogram by Population",                                #title
    fill = "Population"                                                  #legend
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),    #title style
    legend.title = element_text(face = "bold", size = 12),               #legend title style
    legend.text = element_text(size = 11)                                #legend text style
  )
