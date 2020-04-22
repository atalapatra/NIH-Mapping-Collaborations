
setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder")

#### FUNCTIONS

authPubToAdj <- function(df){
  authPub <- cbind.data.frame(df$full_name, df$publication_key)
  authPub <- unique.data.frame(authPub)
  
  names(authPub)[1] <- "full_name"
  names(authPub)[2] <- "publication_key"
  
  # http://stackoverflow.com/questions/39502424/r-weighted-adjacency-matrix-from-two-columns
  
  x <- xtabs(~publication_key+full_name, unique(authPub)); 
  adjMatrix <- crossprod(x,x)
  # adjMatrix[lower.tri(adjMatrix, TRUE)] <- NA
  
  return(adjMatrix)
}

#### OPERATIONS

### Import Data

studyDF <- read.csv("Data/2017-03-22/study_author_pub.csv", header = TRUE)
compDF <- read.csv("Data/2017-03-22/comp_author_pub.csv", header = TRUE)
fullDF <- rbind(studyDF,compDF)



### Networks

library(igraph)

studyAM <- authPubToAdj(studyDF)
studyNet <- graph.adjacency(studyAM,mode="undirected",weighted=TRUE, diag=FALSE)

compAM <- authPubToAdj(compDF)
compNet <- graph.adjacency(compAM,mode="undirected",weighted=TRUE, diag=FALSE)

fullAM <- authPubToAdj(fullDF)
fullNet <- graph.adjacency(fullAM,mode="undirected",weighted=TRUE, diag=FALSE)

# http://kateto.net/network-visualization

### Plots

plot(fullNet, layout=layout.fruchterman.reingold(fullNet), vertex.label = NA, vertex.size = 2, edge.width = .01)



# plot(fullNet, layout=layout_as_tree(fullNet), vertex.label = NA, vertex.size = 2, edge.width = .01)











## Additional Plots
plot(studyNet, 
     layout=layout.fruchterman.reingold(studyNet), 
     vertex.label = NA, 
     vertex.size = 2, 
     edge.width = E(studyNet)$weight/5)

plot(fullNet, 
     layout=layout.fruchterman.reingold(fullNet),
     vertex.label = NA, 
     vertex.size = 2,
     vertex.color=V(fullNet)$color_1,
     edge.width = E(studyNet)$weight/7)

plot(compNet, layout=layout.fruchterman.reingold(compNet), vertex.label = NA, vertex.size = 2, edge.width = .01)

plot(fullNet, layout=layout.fruchterman.reingold(fullNet), vertex.label = NA, vertex.size = 2, edge.width = .01)

plot(studyNet, vertex.label = NA, vertex.size = 3, edge.width = 2)
plot(studyNet, layout=layout_in_circle(studyNet), vertex.label = NA, vertex.size = 2, edge.width = .01)
plot(studyNet, layout=layout.fruchterman.reingold(studyNet), vertex.label = NA, vertex.size = 2, edge.width = .01)


#### MISC

studyEL <- get.edgelist(studyNet)
write.csv(studyEL,"study_edgelist.csv", row.names = FALSE)

compEL <- get.edgelist(compNet)
write.csv(compEL,"comp_edgelist.csv", row.names = FALSE)

fullEL <- get.edgelist(fullNet)
write.csv(fullEL,"full_edgelist.csv", row.names = FALSE)
