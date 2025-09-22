#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggbeeswarm)

#Import data
data("PlantGrowth")

#Create plot
ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_beeswarm(
    size = 3,             #Point size
    shape = 21,           #Filled circle
    color = "black",      #Border color
    priority = "density"  #Arrange points to avoid overlap
  ) +
  #Change colors
  scale_fill_manual(values = c("ctrl" = "#3E1F47", 
                               "trt1" = "#2A3B66", 
                               "trt2" = "#3A3A3C")) +
  #Change axis titles
  labs(title = "Beeswarm Plot of Plant Weights by Treatment Group",
       x = "Treatment Group",
       y = "Weight (grams)",
       fill = "Group") +
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
