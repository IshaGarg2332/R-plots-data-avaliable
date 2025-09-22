#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("faithful")

#Create plot
ggplot(faithful, aes(x = eruptions, y = waiting)) +
  stat_density_2d(aes(fill = ..level..),    #2D density estimate of the points
                  geom = "polygon",         #Draws filled contour polygons
                  color = "black",          #Border color
                  alpha = 0.7) +            #Transparency of polygons
  geom_point(color = "black",               #Point color
             alpha = 0.5,                   #Transparency of points
             size = 1.5) +                  #Point size
  #Change colors
  scale_fill_gradient(low = "#2A3B66", 
                      high = "#3E1F47",
                      limits = c(0, 0.08),                    #Min and max
                      breaks = c(0, 0.02, 0.04, 0.06, 0.08),  #Legend ticks
                      name = "Density Level"                  #Legend name
                      ) +
  #Change axis titles
  labs(title = "2D Density Plot of Trees Dataset",
       subtitle = "Tree girth vs height",
       x = "Girth (inches)",
       y = "Height (feet)",
       fill = "Density Level") +
  theme_minimal() +
  #Change text sizes
  theme(
    axis.text.x = element_text(size = 12),      # x-axis tick labels
    axis.text.y = element_text(size = 12),      # y-axis tick labels
    axis.ticks.length = unit(0.25, "cm"),       # length of ticks
    axis.ticks = element_line(size = 0.5),      # thickness of ticks
    axis.title.x = element_text(size = 14),     # x-axis title
    axis.title.y = element_text(size = 14),     # y-axis title
    legend.title = element_text(size = 13),     # legend title
    legend.text = element_text(size = 11)       # legend items
  ) +
  #Range of axes
  xlim(0, 6) + 
  ylim(0, 100)
