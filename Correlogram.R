#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("USArrests")

# Compute correlation matrix
USArrests_df <- cor(USArrests)

# Convert correlation matrix to long format for ggplot
USArrests_df <- melt(USArrests_df)
colnames(USArrests_df) <- c("Var1", "Var2", "Correlation")

#Create plot
ggplot(USArrests_df, aes(x = Var1, y = Var2, fill = Correlation)) +
  geom_tile(color = "white",      #Border color
            size = 0.3,           #Border thickness
            linetype = "solid",   #Border style (solid, dashed, dotted)
            alpha = 0.95          #Transparency of tiles
  ) +
  #Change colors
  scale_fill_gradient2(low = "#2A3B66", 
                       mid = "white", 
                       high = "#3E1F47", 
                       midpoint = 0) +
  #Change axis titles
  labs(title = "Correlogram of USArrests",
       subtitle = "Correlation between different crime and urban population variables",
       x = "",
       y = "",
       fill = "Correlation") +
  theme_minimal() +
  #Change text sizes
  theme(
    axis.text.x = element_text(size = 12),      #x-axis tick labels
    axis.text.y = element_text(size = 12),      #y-axis tick labels
    axis.ticks.length = unit(0.25, "cm"),       #length of ticks
    axis.ticks = element_line(size = 0.5),      #thickness of ticks
    axis.title.x = element_text(size = 14),     #x-axis title
    axis.title.y = element_text(size = 14),     #y-axis title
    legend.title = element_text(size = 13),     #legend title
    legend.text = element_text(size = 11)       #legend items
  ) +
  #Add correlation values in the tiles
  geom_text(aes(label = round(Correlation, 2)), 
            color = "black", 
            size = 4)
  
