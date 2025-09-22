#Load libraries
library(datasets)
library(fmsb)

#Import data
data("LifeCycleSavings")

# Pick a few countries to compare
LifeCycleSavings_df <- LifeCycleSavings[c("Australia", "Canada", "France"), ]

#Add max and min rows for scaling
LifeCycleSavings_df <- rbind(
  Max = apply(LifeCycleSavings_df, 2, max),   #Max for each variable
  Min = apply(LifeCycleSavings_df, 2, min),   #Min for each variable
  LifeCycleSavings_df
)

#Create plot
radarchart(LifeCycleSavings_df,
           pcol = c("red", "blue", "green"),                                          #Line colors
           pfcol = c(alpha("red",0.3), alpha("blue",0.3), alpha("green",0.3)),        #Fill colors
           plwd = 2,                                                                  #Line width
           plty = c(1,2,3),                                                           #Line types
           cglcol = "grey",                                                           #Grid color
           cglty = 1,                                                                 #Grid type
           cglwd = 0.8,                                                               #Grid width
           axistype = 1,                                                              #Axis type
           vlcex = 0.8,                                                               #Label size
           title = "LifeCycleSavings Indicators for Selected Countries" # Title
)

# Add legend
legend("topright", 
       legend = rownames(LifeCycleSavings_df[-c(1,2),]),   #Countries
       col = c("red","blue","green"),     #Legend colors
       lty = c(1,2,3),                    #Legend line types
       lwd = 2,                           #Legend width
       bty = "n")                         #No box