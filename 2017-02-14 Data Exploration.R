
setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder")

## OPERATIONS

# Get NIGMS project data and NIH publications data.

setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/Projects/")
nigmsProjData <- read.csv(file = "nigms_project_data.csv")

setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/Publications/")
nihPubData <- read.csv(file = "nih_publication_data.csv")

piData <- data.frame(nigmsProjData$PI_IDS, nigmsProjData$PI_NAMEs)

setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data")
write.csv(piData, file = "NIGMS_PI_Data.csv", row.names = FALSE)

