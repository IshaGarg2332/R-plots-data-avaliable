#Load libraries
library(datasets)
library(ggplot2)
library(GGally)

#Import data
data("Orange")

#Remove NAs
Orange$age <- as.numeric(Orange$age)
Orange$circumference <- as.numeric(Orange$circumference)

ggparcoord(
  data = Orange, 
  columns = c("age", "circumference"), #Variables to plot in parallel
  groupColumn = "Tree",                #Color lines by tree ID
  scale = "uniminmax",                 #Rescale variables to 0–1 range
  alphaLines = 0.7,                    #Transparency of lines
  order = c(1, 2)                      #Order of the axes
) +
  scale_color_brewer(palette = "Set1") +    #Color palette for categorical tree groups
  theme_minimal(base_size = 14) +           #Clean, minimal theme with bigger text
  theme(
    legend.position = "right",                             #Place legend on the right side
    panel.grid.major = element_line(color = "grey80"),     #Light grid lines
    axis.title.x = element_blank()                         #Remove default x-axis title
  ) +
  labs(
    title = "Parallel Coordinates of Orange Tree Growth",   #Main plot title
    subtitle = "Scaled Age and Circumference by Tree",      #Subtitle
    y = "Scaled Values (0–1)",                              #Label for y-axis
    color = "Tree ID"                                       #Legend title
  ) 
  