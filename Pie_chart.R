#Load libraries
library(ggplot2)
library(dplyr)
library(RColorBrewer)

#Summarize total breaks by wool
warp_summary <- warpbreaks %>%
  group_by(wool) %>%
  summarise(TotalBreaks = sum(breaks), .groups = "drop") %>%
  mutate(
    Fraction = TotalBreaks / sum(TotalBreaks),
    Label = paste0(wool, "\n", round(Fraction*100,1), "%")
  )

# Plot pie chart
ggplot(warp_summary, aes(x = "", y = TotalBreaks, fill = wool)) +
  geom_col(color = "white", width = 1) +                                     #bars with white borders
  coord_polar(theta = "y") +                                                 #convert bars to pie chart
  geom_text(aes(label = Label),                                              #add labels
            position = position_stack(vjust = 0.5),                          #center labels
            color = "white", fontface = "bold", size = 5) +                  #bold white labels
  scale_fill_brewer(palette = "Set1") +                                      #color palette
  labs(title = "Pie Chart of Warp Breaks by Wool Type",                 #title
       subtitle = "Data from warpbreaks dataset",                       #subtitle
       caption = "Source: warpbreaks",                                  #caption
       fill = "Wool Type") +                                            #legend
  theme_void() +                                                        #remove axes and background
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5, color = "black"),      #title style
    plot.subtitle = element_text(size = 14, hjust = 0.5, color = "black"),                  #subtitle style
    plot.caption = element_text(size = 10, hjust = 1, color = "black"),                     #caption style
    legend.position = "bottom",                                                             #legend style
    legend.title = element_text(face = "bold", size = 12),                                  #legend title
    legend.text = element_text(size = 11)                                                   #legend text
  )
