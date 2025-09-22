#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("ChickWeight")

#Plot data
ChickWeight %>%
  ggplot(aes(x = Diet, y = weight, fill = Diet)) +
  geom_boxplot(width = 0.7, 
               color = "black",   #Border color
               size = 0.5,        #Outline thickness
               alpha = 0.7) +     #Plot transparency
  # Add individual data points
  geom_jitter(width = 0.15,          #Data point width
              size = 2,              #Data point size
              alpha = 0.6,           #Data point transparency
              color = "black") +     #Data point color
  #Change colors
  scale_fill_manual(values = c("1" = "#3E1F47", 
                               "2" = "#2A3B66", 
                               "3" = "#3A3A3C", 
                               "4" = "#5E3C6B")) +
  #Change axis titles
  labs(x = "Diet Type", 
       y = "Weight (grams)", 
       title = "Chick Weights by Diet",
       fill = "Diet") +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 12),      # x-axis tick labels
        axis.text.y = element_text(size = 12),      # y-axis tick labels
        axis.ticks.length = unit(0.25, "cm"),       # length of ticks
        axis.ticks = element_line(size = 0.5),      # thickness of ticks
        axis.title.x = element_text(size = 14),     # x-axis title
        axis.title.y = element_text(size = 14),     # y-axis title
        legend.title = element_text(size = 13),     # legend title
        legend.text = element_text(size = 11)       # legend items
  ) +
  #Add the counts for each boxplot above the boxplot
  stat_summary(fun = median, 
               geom = "text", 
               aes(label = round(..y..,1)), 
               vjust = -0.5, 
               color = "black", 
               size = 3.5)
