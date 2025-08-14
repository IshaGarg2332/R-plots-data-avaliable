#Load libraries
library(datasets)
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data
data("AirPassengers")

AirPassengersData <- data.frame(
  month = time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)

#Plot data
ggplot(AirPassengersData, aes(x = month, y = passengers)) +
  geom_line(color = "blue",   #Color of line
            size = 1) +       #Thickness of line
  geom_point() +              #Add all of the points of data
  #Change axis titles
  labs(
    title = "Monthly Airline Passengers (1949–1960)",
    x = "Year",
    y = "Number of Passengers"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 12),      # x-axis tick labels
        axis.text.y = element_text(size = 12),      # y-axis tick labels
        axis.ticks.length = unit(0.25, "cm"),       # length of ticks
        axis.ticks = element_line(size = 0.5),      # thickness of ticks
        axis.title.x = element_text(size = 14),     # x-axis title
        axis.title.y = element_text(size = 14),     # y-axis title
        legend.title = element_text(size = 13),     # legend title
        legend.text = element_text(size = 11),      # legend items
        legend.position = "top"                     # legend position
  )
