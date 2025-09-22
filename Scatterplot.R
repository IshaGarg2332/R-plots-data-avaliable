#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("mtcars")

#Create plot
ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl))) +
  geom_point(size = 3,          #Size of points
             alpha = 0.7) +     #Transparency of points
  #Change colors
  scale_color_manual(values = c("4" = "#3E1F47", 
                                "6" = "#2A3B66", 
                                "8" = "#3A3A3C")) +
  #Change axis titles
  labs(title = "Scatterplot of Horsepower vs MPG",
       subtitle = "Each point represents a car",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)",
       color = "Cylinders") +
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
