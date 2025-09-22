#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("ToothGrowth")

#Plot data
ggplot(ToothGrowth, aes(x = factor(dose), y = len, fill = supp)) +
  geom_violin(trim = FALSE,            #The violin extends to cover the full range of data
              alpha = 0.6,             #Plot transparency
              color = "black") +       #Color of the border
  geom_jitter(width = 0.15,            #Spreads the points slightly horizontally
              size = 2,                #Size of the points
              alpha = 0.8) +           #Transparency of the points
  #Change axis titles
  labs(
    title = "Tooth Length by Dose and Supplement Type",
    x = "Dose (mg)",
    y = "Tooth Length",
    fill = "Supplement"
  ) +
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
