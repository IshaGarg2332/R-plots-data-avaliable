library(forestplot)
library(grid)

data(mtcars)

#Aggregate MPG by number of cylinders
summary_df <- aggregate(mpg ~ cyl, data = mtcars, mean)

#Create fake confidence intervals (for plotting only)
summary_df$lower <- summary_df$mpg - 2
summary_df$upper <- summary_df$mpg + 2

#Title the columns
tabletext <- cbind(
  c("Cylinders",
    paste(summary_df$cyl, "cyl")),
  c("Mean MPG (95% CI)",
    paste0(
      round(summary_df$mpg, 1),
      " (",
      round(summary_df$lower, 1),
      "–",
      round(summary_df$upper, 1),
      ")"
    ))
)

#Create the forestplot
  forestplot(labeltext = tabletext,
             mean  = c(NA, summary_df$mpg),
             lower = c(NA, summary_df$lower),
             upper = c(NA, summary_df$upper),
             graph.pos = "right",
             boxsize=0.2,
             zero = 1,
             col = (fpColors(lines = "black", zero = "black", vrtcl_lines = "black")),
             shapes_gp = styles,
             plotwidth=unit(15, "cm"),
             colgap = unit(13, "mm"),
             lineheight = "auto",
             xticks=c(0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30),
             cols=c(1:2,3:4,5:6,7:8, 10:12, 14:15),
             xlab = "Miles Per Gallon",
             title = "Forest Plot Using Built-in R Dataset (mtcars)",
             txt_gp=fpTxtGp(label= gpar(cex = 1.6),
                            title = gpar(cex = 1.7), 
                            xlab  = gpar(cex = 1.8),
                            ticks = gpar(cex = 1.5))) 