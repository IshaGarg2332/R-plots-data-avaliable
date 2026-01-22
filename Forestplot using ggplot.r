library(ggplot2)

#Load built-in R dataset
data(mtcars)

#Calculate mean MPG by number of cylinders
summary_df <- aggregate(mpg ~ cyl, data = mtcars, mean)

#Create simple (example) confidence intervals
summary_df$lower <- summary_df$mpg - 2
summary_df$upper <- summary_df$mpg + 2

#Convert cyl to a factor and reverse order so higher values appear at the top
summary_df$cyl <- factor(summary_df$cyl, levels = rev(summary_df$cyl))

#Create forest plot
ggplot(summary_df, aes(x = mpg, y = cyl)) +
  
  #Vertical reference line at overall mean MPG
  geom_vline(
    xintercept = mean(mtcars$mpg),
    linetype = "dashed",
    linewidth = 0.8
  ) +
  
  #Horizontal confidence interval bars
  geom_errorbar(
    aes(xmin = lower, xmax = upper),
    width = 0.25,
    linewidth = 0.8,
    orientation = "y"
  ) +
  
  #Point estimates (boxes)
  geom_point(
    size = 4.5,
    shape = 15
  ) +
  
  #Customize x-axis scale and spacing
  scale_x_continuous(
    limits = c(0, 30),
    breaks = seq(0, 30, by = 2),
    expand = expansion(mult = c(0.02, 0.05))
  ) +
  
  #Axis labels and plot titles
  labs(
    x = "Miles Per Gallon",
    y = "Cylinders",
    title = "Forest Plot Using Built-in R Dataset (mtcars)",
    subtitle = "Mean MPG by cylinder count with 95% CI"
  ) +
  
  #Base theme
  theme_minimal() +
  
  #Text and layout customization
  theme(
    # Axis tick label sizes
    axis.text.y  = element_text(size = 14),
    axis.text.x  = element_text(size = 12),
    
    #X-axis title styling
    axis.title.x = element_text(
      size = 16,
      face = "bold",
      margin = margin(t = 10)
    ),
    
    #Y-axis title styling
    axis.title.y = element_text(
      size = 16,
      face = "bold",
      margin = margin(t = 10)
    ),
    
    #Plot title and subtitle styling
    plot.title = element_text(
      size = 18,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(
      size = 13,
      hjust = 0.5
    ),
    
    #Remove horizontal grid lines for classic forest plot look
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank()
  )
