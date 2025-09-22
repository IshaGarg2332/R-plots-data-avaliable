#Import libraries
library(ggplot2)
library(dplyr)

#Import data
data("cars")

#Create hexbin map
ggplot(cars, aes(x = speed, y = dist)) +
  geom_hex(bins = 10, aes(fill = ..count..)) +                    #hexagonal bins with count
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +   #color gradient
  labs(
    title = "Hexbin Map of Car Speeds vs Stopping Distances",             #title
    x = "Speed (mph)",                                                    #x-axis
    y = "Stopping Distance (ft)",                                         #y-axis
    fill = "Count"                                                        #legend
  ) +
  theme_minimal() +                                                       #minimal theme
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),     #title style
    axis.title = element_text(face = "bold"),                             #axis title style
    axis.text = element_text(size = 12),                                  #axis text style
    legend.title = element_text(face = "bold", size = 12),                #legend title style
    legend.text = element_text(size = 11)                                 #legend text style
  )

