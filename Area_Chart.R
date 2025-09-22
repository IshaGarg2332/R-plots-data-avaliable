#Import libraries
library(tidyverse)

#Import dataset
data("LakeHuron")
df <- data.frame(
  Year = as.numeric(time(LakeHuron)),
  Level = as.numeric(LakeHuron)
)

#Create area chart
ggplot(df, aes(x = Year, y = Level)) +
  geom_area(fill = "skyblue", alpha = 0.5) +        #fill area under line
  geom_line(color = "steelblue", size = 1.2) +      #add line on top
  geom_point(color = "darkblue", size = 2) +        #add points at each year
  labs(
    title = "Lake Huron Annual Levels",                                          #plot title
    x = "Year",                                                                  #x-axis label
    y = "Level (ft)",                                                            #y-axis label
    caption = "Source: LakeHuron dataset in R"                                   #caption
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),            #title style
    axis.title = element_text(face = "bold"),                                    #axis style
    axis.text = element_text(size = 12),                                         #axis tick style
    plot.caption = element_text(size = 10, face = "italic", hjust = 1)           #caption style
  )
