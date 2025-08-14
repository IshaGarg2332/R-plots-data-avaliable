#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("iris")

#Plot data
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.1,                #Thickness of bars
                 color = "black",               #Bar border colors
                 alpha = 0.6,                   #Transparency of bars
                 position = "identity") +       #Position of bars to be next together
  #Change colors of the bars manually
  scale_fill_manual(values = c("setosa" = "red", 
                               "versicolor" = "green", 
                               "virginica" = "blue")) +
  #Change axis titles
  labs(
    title = "Distribution of Sepal Length in Iris Species",
    x = "Sepal Length (cm)",
    y = "Density",
    fill = "Species",
    color = "Density by Species"
  ) +
  theme_minimal() +
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
