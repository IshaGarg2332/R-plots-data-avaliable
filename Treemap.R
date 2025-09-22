#Load libraries
library(ggplot2)
library(dplyr)
library(treemapify)

#Load dataset
data("HairEyeColor")
hec_df <- as.data.frame(HairEyeColor)

#Summarize counts
hec_summary <- hec_df %>%
  group_by(Hair, Eye) %>%
  summarise(Freq = sum(Freq), .groups = "drop")

#Create treemap
ggplot(hec_summary, aes(
  area = Freq,                                           #size of each rectangle by frequency
  fill = Eye,                                            #fill color by eye color
  label = paste(Hair, "\n", Eye, "\n", Freq)             #labels inside rectangles
)) +
  geom_treemap(color = "black", size = 0.5) +            #draw black border
  geom_treemap_text(
    aes(label = paste(Hair, "\n", Eye, "\n", Freq)),     #add labels
    place = "centre",                                    #place label in center 
    grow = TRUE,                                         #allow text to scale 
    reflow = TRUE,                                       #wrap text
    color = "white",                                     #text color
    fontface = "bold",                                   #bold labels
    min.size = 3                                         # minimum text size
  ) +
  scale_fill_brewer(palette = "Set2") +                  #color palette for eye color
  labs(
    title = "Treemap of Hair and Eye Color Counts",               #title
    subtitle = "Built from the HairEyeColor Dataset",             #subtitle
    caption = "Data source: HairEyeColor (R built-in)",           #caption
    fill = "Eye Color"                                            #legend
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5, color = "black"),      #title style
    plot.subtitle = element_text(size = 14, hjust = 0.5, color = "black"),                  #subtitle style
    plot.caption = element_text(size = 10, hjust = 1, color = "black"),                     #caption style
    legend.title = element_text(size = 12, face = "bold"),                                  #legend style
    legend.text = element_text(size = 11)                                                   #legend labels
  )
