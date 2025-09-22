# Load libraries
library(ggplot2)
library(dplyr)
library(treemapify)

#Load dataset
data("ChickWeight")
chick_df <- ChickWeight

#Summarize total weight
chick_summary <- chick_df %>%
  group_by(Diet, Time) %>%
  summarise(TotalWeight = sum(weight), .groups = "drop")

#Create treemap
ggplot(chick_summary, aes(
  area = TotalWeight,
  fill = Diet,
  label = paste("Diet", Diet, "\nTime:", Time, "\nWeight:", TotalWeight)
)) +
  geom_treemap(color = "black", size = 0.4) +                                          #create rectangles with border
  geom_treemap_text(
    aes(label = paste("Diet", Diet, "\nTime:", Time, "\nWeight:", TotalWeight)),       #text label
    place = "centre",                                                                  #center labels
    grow = TRUE,                                                                       #allow text to scale
    reflow = TRUE,                                                                     #wrap text
    color = "white",                                                                   #text color
    fontface = "bold",                                                                 #bold text
    min.size = 3                                                                       #minimum size
  ) +
  scale_fill_brewer(palette = "Set3") +                                                #color palette
  labs(
    title = "Treemap of Chick Total Weight by Diet and Time",       #title
    subtitle = "Data from ChickWeight dataset",                     #subtitle
    caption = "Source: ChickWeight (R built-in)",                   #caption
    fill = "Diet"                                                   #legend 
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5, color = "#2A3B66"),   #title style
    plot.subtitle = element_text(size = 14, hjust = 0.5, color = "gray30"),                #subtitle style
    plot.caption = element_text(size = 10, hjust = 1, color = "gray50"),                   #caption style
    legend.title = element_text(size = 12, face = "bold"),                                 #legend style
    legend.text = element_text(size = 11)                                                  #legend labels
  )
