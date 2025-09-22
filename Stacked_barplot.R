#Load libraries
library(ggplot2)     
library(dplyr)       

#Load dataset
data("Titanic")                      
titanic_df <- as.data.frame(Titanic)

#Summarize counts
titanic_summary <- titanic_df %>%
  group_by(Class, Sex) %>%
  summarise(Freq = sum(Freq), .groups = "drop")

#Make the barplot
ggplot(titanic_summary, aes(x = Class, y = Freq, fill = Sex)) +
  geom_bar(stat = "identity", 
           color = "black",       #border color
           size = 0.4,            #border thickness
           width = 0.7) +         #bar width
  #Add text labels inside the bars
  geom_text(aes(label = Freq), 
            position = position_stack(vjust = 0.5), 
            color = "white", 
            fontface = "bold", 
            size = 4) +
  # Customize colors
  scale_fill_manual(values = c("Male" = "#2A3B66", "Female" = "#E64B35")) +
  labs(
    title = "Titanic Passenger Distribution",                      #title label
    subtitle = "Stacked by Sex across Passenger Classes",          #subtitle label
    x = "Passenger Class",                                         #x-axis label
    y = "Number of Passengers",                                    #y-axis label
    fill = "Sex",                                                  #legend label
    caption = "Titanic dataset (R built-in)"                       #caption label
  ) +
  theme_minimal(base_size = 14) +                                  #minimal theme
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5, color = "#2A3B66"),       #title style
    plot.subtitle = element_text(size = 13, hjust = 0.5, color = "gray30"),                    #subtitle style
    plot.caption = element_text(size = 10, hjust = 1, color = "gray50"),                       #caption style
    axis.text.x = element_text(size = 12, face = "bold", color = "#333333"),                   #x-axis text
    axis.text.y = element_text(size = 12, color = "#333333"),                                  #y-axis text
    axis.title.x = element_text(size = 14, face = "bold", margin = margin(t = 10)),            #x-axis title
    axis.title.y = element_text(size = 14, face = "bold", margin = margin(r = 10)),            #y-axis title
    legend.title = element_text(size = 13, face = "bold"),                                     #legend title
    legend.text = element_text(size = 12),                                                     #legend labels
    panel.grid.major.x = element_blank(),                                                      #remove vertical grids
    panel.grid.minor = element_blank()                                                         #remove minor grids
  )
