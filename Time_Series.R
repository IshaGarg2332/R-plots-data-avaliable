#Import libraries
library(ggplot2)
library(tidyverse)

#Import data
data("BJsales")
df <- data.frame(
  Month = 1:length(BJsales),
  Sales = as.numeric(BJsales)
)

#Create time series
ggplot(df, aes(x = Month, y = Sales)) +
  geom_line(color = "steelblue", size = 1.2) +   #create smooth line
  geom_point(color = "tomato", size = 2) +       #add points
  labs(
    title = "BJ's Monthly Sales",                                           #title
    x = "Month",                                                            #x-axis
    y = "Sales",                                                            #y-axis
    caption = "Source: BJsales dataset in R"                                #caption
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),       #title style
    axis.title = element_text(face = "bold"),                               #axis title style
    axis.text = element_text(size = 12),                                    #axis text style
    plot.caption = element_text(size = 10, face = "italic", hjust = 1)      #caption style
  )
