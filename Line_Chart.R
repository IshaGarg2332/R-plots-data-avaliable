#Import libraries
library(tidyverse)

#Import dataset
data("JohnsonJohnson")
df <- data.frame(
  Quarter = as.numeric(time(JohnsonJohnson)),
  Earnings = as.numeric(JohnsonJohnson)
)

#Create line chart
ggplot(df, aes(x = Quarter, y = Earnings)) +
  geom_line(color = "steelblue", size = 1.2) +                                             #line with color and thickness
  geom_point(color = "tomato", size = 2) +                                                 #add points at each quarter
  geom_smooth(method = "loess", se = FALSE, color = "darkgreen", linetype = "dashed") +    #smooth trend line
  labs(
    title = "Quarterly Earnings of Johnson & Johnson (1960–1980)",              #title
    x = "Year",                                                                 #x-axis label
    y = "Earnings ($)",                                                         #y-axis label
    caption = "Source: JohnsonJohnson dataset in R"                             #caption
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),           #title style
    axis.title = element_text(face = "bold"),                                   #axis style
    axis.text = element_text(size = 12),                                        #axis tick style
    plot.caption = element_text(size = 10, face = "italic", hjust = 1)          #caption style
  )
