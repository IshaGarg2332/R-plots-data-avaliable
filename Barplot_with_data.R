#Load libraries
library(palmerpenguins)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("penguins", package = "palmerpenguins")

#Make year a character
penguins$year <- as.character(penguins$year)

#Plot data
penguins %>%
  ggplot(aes(x = year, fill = species)) +
  geom_bar(position = position_dodge(preserve = "single"), 
           width = 0.7,      #Change the width
           color = "black",  #Add a black outline around each bar
           size = 0.3        #Change the thickness of the outline for each bar
           ) +
  #Change bar colors
  scale_fill_manual(values = c("Adelie" = "#3E1F47", 
                               "Chinstrap" = "#2A3B66", 
                               "Gentoo" = "#3A3A3C")) +
  #Change axis titles
  labs(x = "Year", 
       y = "Number of each species", 
       title = "Year vs Number of Each Species", 
       fill = "Species") +
  #Change text sizes
  theme(axis.text.x = element_text(size = 12),      # x-axis tick labels
        axis.text.y = element_text(size = 12),      # y-axis tick labels
        axis.ticks.length = unit(0.25, "cm"),       # length of ticks
        axis.ticks = element_line(size = 0.5),      # thickness of ticks
        axis.title.x = element_text(size = 14),     # x-axis title
        axis.title.y = element_text(size = 14),     # y-axis title
        legend.title = element_text(size = 13),     # legend title
        legend.text = element_text(size = 11)       # legend items
        ) +
  #Add the counts for each bar above the bar
  geom_text(stat = "count", 
            aes(label = after_stat(count)), 
            position = position_dodge(width = 0.7), 
            vjust = -0.5)
