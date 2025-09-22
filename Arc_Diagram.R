#Import libraries
library(igraph)
library(ggraph)
library(dplyr)

#Import dataset
data("VADeaths")
df <- as.data.frame(VADeaths)

# Connect each age group to each category
edges <- expand.grid(from = rownames(df), to = colnames(df)) %>%
  mutate(weight = as.vector(as.matrix(df))) %>%
  filter(weight > 0)

# Create igraph object
g <- graph_from_data_frame(edges, directed = FALSE)

# Create arc diagram 
ggraph(g, layout = "linear") +                                                 #linear layout
  geom_edge_arc(aes(width = weight), color = "purple") +                       #arcs weighted by death rate
  geom_node_point(size = 5, color = "magenta") +                               #node points
  geom_node_text(aes(label = name), vjust = -1, size = 4) +                    #node labels
  scale_edge_width(range = c(0.5, 4)) +                                        #control min/max arc width
  theme_void() +                                                               #clean background
  ggtitle("VADeaths Arc Diagram") +                                            #title
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16))      #title style
