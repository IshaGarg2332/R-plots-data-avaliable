#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("pressure")

#Create plot
ggplot(pressure, aes(x = temperature, y = pressure, size = pressure, fill = pressure)) +
  geom_point(alpha = 0.7,            #Transparency
             shape = 21,             #Filled circle
             stroke = 0.5,           #Border thickness
  ) +
  scale_size(range = c(3, 10),     #Point size
             guide = "none"        #Remove legend
  ) +
  #Change colors
  scale_fill_gradient(low = "#2A3B66", 
                       high = "#3E1F47") +
  #Change axis titles
  labs(title = "Pressure vs Temperature Bubble Chart",
       subtitle = "Bubble size and color represent pressure",
       x = "Temperature",
       y = "Pressure",
       size = "Pressure",
       color = "Pressure") +
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
  ) 