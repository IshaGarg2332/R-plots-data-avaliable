#Load libraries
library(ggplot2)
library(dplyr)
library(ggplot2movies)

#Import dataset
data("movies")

#Count movies per year
year_counts <- movies %>%
  count(year, sort = TRUE)

#Keep top 20 years
top_years <- year_counts %>%
  slice_max(n, n = 20)

#Convert year to factor in descending order of count
top_years$year <- factor(top_years$year, 
                         levels = top_years$year[order(top_years$n, decreasing = TRUE)])

# Plot simple barplot
ggplot(top_years, aes(x = year, y = n)) +
  geom_bar(stat = "identity",                    #Make bar heights equal to values in 'n'
           width = 0.7,                          #Bar width
           fill = "#2A3B66",                     #Bar color
           color = "black",                      #Outline color
           size = 0.3) +                         #Outline thickness
  geom_text(aes(label = n),                      #Add total counts as text labels 
            vjust = -0.3,                        #Move text slightly above bars
            size = 3) +                          #Font size of labels
  labs(x = "Year",                                            #X-axis label
       y = "Number of Movies",                                #Y-axis label
       title = "Top 20 Years with Most Movies") +             #Title label
  theme_minimal() +                                           #Minimal theme 
  theme(axis.text.x = element_text(size = 10, angle = 45, hjust = 1), #X labels
        axis.text.y = element_text(size = 12),                        #Y labels
        axis.title.x = element_text(size = 14),                       #X-axis title 
        axis.title.y = element_text(size = 14),                       #Y-axis title 
        plot.title = element_text(size = 16, face = "bold"))          #Title 
