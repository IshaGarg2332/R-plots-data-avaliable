#Load libraries
library(ggplot2)
library(dplyr)
library(RColorBrewer)

#Load dataset
spray_df <- InsectSprays

#Summarize total insects killed by spray
spray_summary <- spray_df %>%
  group_by(spray) %>%
  summarise(Total = sum(count), .groups = "drop") %>%
  mutate(
    fraction = Total/sum(Total),
    ymax = cumsum(fraction),
    ymin = c(0, head(ymax, -1)),
    labelPos = (ymax + ymin)/2,
    label = paste0(spray, "\n", round(fraction*100,1), "%")
  )

# Plot doughnut chart
ggplot(spray_summary, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = spray)) +
  geom_rect(color = "white", size = 0.5) +                                                   #draw slices with white borders
  coord_polar(theta = "y") +                                                                 #polar coordinates
  xlim(c(2,4)) +                                                                             #inner radius for doughnut hole
  geom_text(aes(x = 3.5, y = labelPos, label = label), 
            color = "white", fontface = "bold", size = 4) +                                  #labels inside slices
  scale_fill_brewer(palette = "Set1") +                                                      # color palette
  labs(title = "Doughnut Chart of Insects Killed by Spray",             #title
       subtitle = "Data from InsectSprays dataset",                     #subtitle
       caption = "Source: InsectSprays (R built-in)",                   #caption
       fill = "Spray Type") +                                           #fill by
  theme_void() +                                                        #remove axes and background
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5, color = "black"),          #title style
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "black"),                      #subtitle style
    plot.caption = element_text(size = 10, hjust = 1, color = "black"),                         #caption style
    legend.position = "bottom",                                                                 #legend style
    legend.title = element_text(face = "bold", size = 12),                                      #legend title
    legend.text = element_text(size = 11)                                                       #legend text
  )
