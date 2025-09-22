#Import libraries
library(igraph)
library(dplyr)

#Import data
data("WorldPhones")
df <- as.data.frame(WorldPhones)
df$Year <- rownames(df)

#Average phones per region
region_avg <- colMeans(df[,1:7]) %>%
  enframe(name = "Region", value = "AvgPhones")

#Shorten region names
region_avg <- region_avg %>%
  mutate(Label = c("N.Am", "Europe", "Asia", "S.Am", "Oceania", "Africa", "Mid.East"))

#Create edges by similarity
edges <- expand.grid(from = region_avg$Region, to = region_avg$Region) %>%
  filter(from != to) %>%
  left_join(region_avg %>% select(Region, AvgPhones), by = c("from"="Region")) %>%
  rename(ValueFrom = AvgPhones) %>%
  left_join(region_avg %>% select(Region, AvgPhones), by = c("to"="Region")) %>%
  rename(ValueTo = AvgPhones) %>%
  mutate(weight = 10 - abs(ValueFrom - ValueTo)/1000) %>%
  filter(weight > 0) %>%
  select(from, to, weight)

#Create igraph object
net <- graph_from_data_frame(edges, directed = FALSE, vertices = region_avg)

#Create network
plot(net,
     layout = layout_in_circle(net),                     #circular layout
     vertex.size = 50,                                   #larger nodes
     vertex.color = "skyblue",                           #node color
     vertex.label = V(net)$Label,                        #use short labels
     vertex.label.color = "black",                       #label color
     vertex.label.cex = 1,                               #font size
     edge.width = E(net)$weight,                         #edge thickness
     edge.color = "grey50",                              #edge color
     main = "WorldPhones Region Similarity Network")     #title
