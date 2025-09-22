#Import libraries
library(packcircles)   # circle packing
library(ggplot2)       # plotting
library(dplyr)         # data handling
library(viridis)       # color palettes

#Import data
data("rock")
rock_df <- as.data.frame(rock)

#Make a data frame with id and numeric size
plot_df <- rock_df %>%
  mutate(id = row_number(),
         value = area) %>%
  select(id, value, everything())

#Compute circle packing layout
packing <- circleProgressiveLayout(plot_df$value, sizetype = "area")
plot_df <- bind_cols(plot_df, packing)

#Convert circle positions to polygon vertices
circles_gg <- circleLayoutVertices(packing, npoints = 50) # circle vertices

#Create circular packing plot
ggplot() +
  geom_polygon(data = circles_gg,                                         #draw circles
               aes(x = x, y = y, group = id, fill = as.factor(id)), 
               colour = "black",                                          #border color
               size = 0.25) +                                             #border thickness
  geom_text(data = plot_df,                                               #add labels
            aes(x = x, y = y, label = id), 
            color = "white",                              #label color
            fontface = "bold",                            #bold labels
            size = 3) +                                   #label size
  scale_fill_viridis_d(option = "C",                      #color palette
                       direction = -1, 
                       guide = FALSE) +                   #remove legend
  coord_equal() +                                         #keep circles
  labs(title = "Circular packing of `rock`",                                              #title
       subtitle = "Circle size ∝ area column",                                            #subtitle
       caption = "Dataset: rock") +                                                       #caption
  theme_void() +
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),                 #title style
        plot.subtitle = element_text(size = 12, hjust = 0.5, color = "black"),            #subtitle style
        plot.caption = element_text(size = 9, hjust = 1))                                 #caption style
