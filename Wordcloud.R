#Load libraries
library(datasets)
library(wordcloud)

#Data from state.name and state.x77
df <- data.frame(word = state.name,
                 freq = state.x77[,"Population"])

wordcloud(words = df$word,                       #Words to plot
          freq = df$freq,                        #Corresponding frequencies
          colors = brewer.pal(8, "Set1"),        #Color palette for words
          random.order = FALSE)                  #Place frequent words at center
