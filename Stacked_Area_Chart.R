#Import libraries
library(tidyverse)

#Import data
data("EuStockMarkets")
df <- as.data.frame(EuStockMarkets)
df$Day <- as.numeric(1:nrow(df))

#Transform data for stacked area chart
df_long <- df %>%
  pivot_longer(cols = c(DAX, SMI, CAC, FTSE),
               names_to = "Index",
               values_to = "Price")

#Create stacked area chart
ggplot(df_long, aes(x = Day, y = Price, fill = Index)) +
  geom_area(alpha = 0.8) +                                   #stacked area with transparency
  scale_fill_manual(values = c("DAX" = "#1b9e77",            #custom colors
                               "SMI" = "#d95f02",
                               "CAC" = "#7570b3",
                               "FTSE"= "#e7298a")) +
  labs(
    title = "European Stock Indices (1991–1998)",                           #title
    x = "Day",                                                              #x-axis label
    y = "Closing Price",                                                    #y-axis label
    fill = "Index",                                                         #legend
    caption = "Source: EuStockMarkets dataset in R"                         #caption
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),       #title style
    axis.title = element_text(face = "bold"),                               #axis style
    axis.text = element_text(size = 12),                                    #axis tick style
    legend.title = element_text(face = "bold", size = 12),                  #legend style
    legend.text = element_text(size = 11),                                  #legend text style
    plot.caption = element_text(size = 10, face = "italic", hjust = 1)      #caption style
  )
