#Import libraries
library(networkD3)
library(dplyr)

#Create nodes
nodes <- data.frame(name = c("Source A", "Source B", "Target X", "Target Y"))

# Create links
links <- data.frame(
  source = c(0, 0, 1, 1),
  target = c(2, 3, 2, 3),
  value  = c(10, 5, 7, 3)
)

# Create Sankey diagram
sankeyNetwork(
  Links = links,              #links data
  Nodes = nodes,              #nodes data
  Source = "source",          #source column
  Target = "target",          #target column
  Value = "value",            #value column
  NodeID = "name",            #node labels
  fontSize = 14,              #font size for labels
  nodeWidth = 30,             #width of nodes
  nodePadding = 15            #space between nodes
)
