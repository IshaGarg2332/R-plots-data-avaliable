#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("airquality")

#Make month a factor
airquality$Month <- as.factor(airquality$Month)

#Plot data
ggplot(airquality, aes(x = Temp, fill = Month)) +
  geom_density(color = "black",        #Border color
               alpha = 0.5,            #Transparency of curves
               size = 1,               #Border thickness
               adjust = 1.5,           #Smoother curve
               position = "identity"   #Allow for overlap
  ) +
  #Change colors
  scale_fill_manual(values = c("5" = "#3E1F47", 
                               "6" = "#2A3B66", 
                               "7" = "#3A3A3C",
                               "8" = "#5E3C6B",
                               "9" = "#1F2A3D")) +
  #Change axis titles
  labs(
    title = "Temperature Distribution by Month (New York, 1973)",
    x = "Temperature (°F)",
    y = "Density",
    fill = "Month"
  ) +
  theme_minimal() +
  #Change text sizes
  theme(axis.text.x = element_text(size = 12),      # x-axis tick labels
        axis.text.y = element_text(size = 12),      # y-axis tick labels
        axis.ticks.length = unit(0.25, "cm"),       # length of ticks
        axis.ticks = element_line(size = 0.5),      # thickness of ticks
        axis.title.x = element_text(size = 14),     # x-axis title
        axis.title.y = element_text(size = 14),     # y-axis title
        legend.title = element_text(size = 13),     # legend title
        legend.text = element_text(size = 11)       # legend items
  )
