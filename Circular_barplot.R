#Load in packages
library(ggplot2)
library(dplyr)

# Load CO2 dataset
data("CO2")

# Use the first 50 rows 
CO2_subset <- CO2[1:50, ]  

# Add ID and compute label angle
CO2_subset <- CO2_subset %>%
  mutate(
    id = row_number(),
    angle = 90 - 360 * (id - 0.5)/n 
  )

# Create enhanced circular barplot
ggplot(CO2_subset, aes(x = as.factor(id), y = uptake)) +
  geom_bar(stat = "identity", aes(fill = uptake), width = 1) +                  #Bars with gradient fill
  coord_polar(start = 0) +                                                      #Convert to circular layout
  geom_point(aes(y = uptake + 0.5), size = 2, color = "darkgreen") +            #Small points on top of bars
  geom_text(aes(label = Plant, y = uptake + 2, angle = angle),                  #Add rotated labels
            hjust = 0, size = 3) +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +                 #Gradient for bars
  labs(title = "Enhanced Circular Barplot of CO2 Uptake (subset of plants)",    #Title label
       fill = "Uptake") +                                                       #Legend label
  theme_minimal() +
  theme(
    axis.text = element_blank(),                                      #Remove axis text
    axis.title = element_blank(),                                     #Remove axis titles
    panel.grid = element_blank(),                                     #Remove grid lines
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14)  #Title styling
  )
