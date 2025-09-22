#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggridges)

#Import data
data("diamonds")

#Create plot
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges(alpha = 0.7,            #Transparency of the ridges
                      color = "black",        #Border color
                      scale = 1.1) +          #Vertical spacing between ridges
  #Change colors
  scale_fill_manual(values = c("Fair" = "#3E1F47", 
                               "Good" = "#2A3B66", 
                               "Very Good" = "#5E3C6B", 
                               "Premium" = "#3A3A3C", 
                               "Ideal" = "#1F2A3D")) +
  
  #Change axis titles
  labs(
    title = "Distribution of Diamond Prices by Cut",
    subtitle = "Ridgeline plot of sampled 1000 diamonds",
    x = "Price (USD)",
    y = "Cut",
    fill = "Cut") +
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
