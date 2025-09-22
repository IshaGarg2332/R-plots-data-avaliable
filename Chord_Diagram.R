#Import libraries
library(circlize)
library(dplyr)

#Import data
data("state.x77")
df <- as.data.frame(state.x77)
df$Region <- state.region

#Summarize population by region
region_pop <- df %>%
  group_by(Region) %>%
  summarise(TotalPop = sum(Population))

#Create flows between regions
links <- region_pop %>%
  mutate(From = Region, 
         To = "USA", 
         Value = TotalPop) %>%
  select(From, To, Value)

#Create chord diagram
chordDiagram(
  x = links, 
  transparency = 0.3,                                            #soften colors for readability
  grid.col = c(
    setNames(rainbow(nrow(region_pop)), region_pop$Region),      #unique colors per region
    "USA" = "black"                                              #central hub color
  ),
  annotationTrack = "grid", 
  preAllocateTracks = 1
)

# ========================
# Add labels
# ========================
circos.trackPlotRegion(
  track.index = 1, 
  panel.fun = function(x, y) {
    sector.name <- get.cell.meta.data("sector.index")
    circos.text(
      x = mean(get.cell.meta.data("xlim")),   # middle of sector
      y = 0.5,                                # distance from circle
      labels = sector.name,                   # sector name
      facing = "bending.inside",              # curve inward
      niceFacing = TRUE, 
      cex = 0.8, col = "black"                # font size & color
    )
  }
)
