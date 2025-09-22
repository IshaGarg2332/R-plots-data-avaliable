# Load libraries
library(ggplot2)
library(dplyr)
library(tibble)

#Import and prepare data
data("islands")
df <- as.data.frame(islands)
df <- rownames_to_column(df, "Island")
colnames(df) <- c("Island", "Area")

#Select top 6 islands and compute proportions
df_top <- df %>%
  arrange(desc(Area)) %>%
  slice_head(n = 6) %>%
  mutate(percent = Area / sum(Area),
         squares = round(percent * 100))

#Expand dataset into waffle grid
waffle_df <- df_top %>%
  uncount(squares) %>%
  mutate(x = rep(1:10, each = 10),
         y = rep(10:1, times = 10))

#Plot waffle chart
ggplot(waffle_df, aes(x = x, y = y, fill = Island)) +
  geom_tile(color = "white", size = 0.3) +                         #draw squares
  scale_fill_brewer(palette = "Set2") +                            #color palette
  coord_equal() +                                                  #keep squares equal
  labs(title = "World's Largest Islands",                                 #title
       subtitle = "Top 6 islands by land area (1000 sq mi)",              #subtitle
       x = NULL,                                                          #x-axis
       y = NULL,                                                          #y-axis
       fill = "Island") +                                                 #legend
  theme_minimal() +
  theme(axis.text = element_blank(),                                                   #remove axis labels
        axis.ticks = element_blank(),                                                  #remove ticks
        panel.grid = element_blank(),                                                  #remove gridlines
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),              #title style
        plot.subtitle = element_text(hjust = 0.5, size = 12, color = "black"),         #subtitle style
        legend.position = "bottom")                                                    #legend location
