# Load libraries
library(ggplot2)
library(dplyr)

#Import USArrests dataset
data("USArrests")

#Prepare data
USArrests$State <- rownames(USArrests)

#Sort by Murder rate
USArrests_sorted <- USArrests %>% arrange(Murder)

#Identify top 5 states with highest Murder rate
top5_states <- USArrests_sorted %>% top_n(5, Murder) %>% pull(State)


# Create lollipop chart
ggplot(USArrests_sorted, aes(x = reorder(State, Murder), y = Murder)) +  #Reorder states by Murder
  geom_segment(aes(x = State, xend = State, y = 0, yend = Murder,        #Draw lines from 0 to Murder
                   color = Murder),                                      #Color line by Murder rate
               size = 1.5, alpha = 0.7) +                            #Slight transparency for lines
  geom_point(aes(color = Murder,                                         #Color points by Murder
                 shape = State %in% top5_states),                        #Shape if top 5
             size = 5) +                                             #Increase point size
  scale_color_gradient(low = "skyblue", high = "red") +                  #Gradient from low to high
  scale_shape_manual(values = c(16, 17)) +                               #Regular circle for normal, triangle for top 5
  coord_flip() +                                                         #Flip axes
  labs(
    title = "Enhanced Murder Arrest Rate by US State (1973)",             #Title
    subtitle = "Top 5 states highlighted with triangles",                 #Subtitle
    x = "State",                                                          #Label for x-axis
    y = "Murder Arrests per 100,000",                                     #Label for y-axis
    color = "Murder Rate",                                                #Legend title for color
    shape = "Top 5 States"                                                #Legend title for shape
  ) +
  theme_minimal(base_size = 14) +                                         #Minimal theme with larger font
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),           #Bold and centered title
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "gray40"),     #Subtitle style
    axis.text.y = element_text(size = 10),                                      #Y-axis text size
    axis.text.x = element_text(size = 10),                                      #X-axis text size
    axis.title = element_text(face = "bold"),                                   #Bold axis titles
    legend.position = "right"                                                   #Position the legend
  )
