#Import libraries
library(tidyverse)
library(ggstream)

#Import data
data("Seatbelts")
df <- as.data.frame(Seatbelts)
df$Month <- 1:nrow(df)

#Transform to long format
df_long <- df %>%
  pivot_longer(cols = -Month,
               names_to = "Category",
               values_to = "Count")

#Create streamgraph (mirror type for wiggles)
ggplot(df_long, aes(x = Month, y = Count, fill = Category)) +
  geom_stream(type = "mirror", bw = 0.7, extra_span = 0.1, alpha = 0.85) +
  scale_fill_brewer(palette = "Set3") +                                       #color palette
  labs(
    title = "UK Car Statistics Streamgraph (1969–1984)",                          #title
    x = "Month",                                                                  #x-axis
    y = "Count",                                                                  #y-axis
    fill = "Category",                                                            #legend title
    caption = "Source: Seatbelts dataset in R"                                    #caption
  ) +
  theme_minimal(base_size = 14) +                                                 #theme minimal
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),             #title style
    axis.title = element_text(face = "bold"),                                     #axis title style
    axis.text = element_text(size = 12),                                          #axis text style
    legend.title = element_text(face = "bold", size = 12),                        #legend title style
    legend.text = element_text(size = 11),                                        #legend text style
    plot.caption = element_text(size = 10, face = "italic", hjust = 1)            #caption style
  )
