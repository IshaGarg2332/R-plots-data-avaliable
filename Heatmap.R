#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(reshape2)

#Import data
data("volcano")

# Convert to long format
volcano_df <- melt(volcano)
colnames(volcano_df) <- c("X", "Y", "Height")

#Create plot
ggplot(volcano_df, aes(x = X, y = Y, fill = Height)) +
  geom_tile(color = "white",    #Border color
            size = 0.3,         #Border thickness
            linetype = "solid", #Border style (solid, dashed, dotted)
            alpha = 0.9         #Transparency of tiles
  ) +
  #Change colors
  scale_fill_gradient(low = "black", 
                      high = "white") +  
  #Change axis titles
  labs(title = "Maunga Whau Volcano Elevation Heatmap",
       subtitle = "Each tile represents elevation in meters",
       x = "X Coordinate",
       y = "Y Coordinate",
       fill = "Elevation (m)") +
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
