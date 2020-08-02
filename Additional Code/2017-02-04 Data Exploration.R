
setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder")

## FUNCTIONS

# unzip files from ExPORTER
unzip_files <- function(){
  for (year in 2001:2015){
    zipfile <- sprintf("Data/From Exporter/RePORTER_PRJ_C_FY%s%s", year, ".zip")
    unzip(zipfile, overwrite = TRUE, exdir = "Data/From Exporter")
  }
}

# load all files into data frame
load_all_into_df <- function(){
  setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/From Exporter")
  files <- list.files(pattern = ".csv")
  df <- list(y2001,y2002,y2003,y2004,y2005,y2006,y2007,y2008,y2009,y2010,y2011,y2012,y2013,y2014,y2015)
  # names(df) <- gsub("\\.csv$", "", files)
  print(df[[i]])
}

  # for (year in 2001:2015){
  #   filename <- sprintf("Data/From Exporter/RePORTER_PRJ_C_FY%s%s", year, ".csv")
  #   df[[year]] <- read.csv(filename)
  #   print(year)
  # }
  # return(df)

# Get dimensions of all csv files in folder.
get_dims <- function(){
  setwd("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/From Exporter")
  files <- list.files(pattern = ".csv")
  for (i in 1:length(files)){
    print(dim(read.csv(files[i])))
  } 
}
  
  # myfiles = lapply(files, read.csv)
  # 
  # temp = list.files(pattern="*.csv")
  
  # for (filename in files){
  #   csvData <- read.csv(sprintf("C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/From Exporter/", filename))
  #   print(ncol(csvData))
  # }



load_all_into_df <- function(){
  df <- list()
  files <- list.files(path = "C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/From Exporter", pattern = ".csv")

}


## OPERATIONS
files <- list.files(path = "C:/Users/Amit/OneDrive/1 - GWU MSBA/DNSC 6217 BA Practicum/My Folder/Data/From Exporter", pattern = ".csv")
myfiles = lapply(files, read.csv)








require(RMySQL)
con <- dbConnect(MySQL(), user="username", password="password", host="127.0.0.1", port=3306)
dbSendQuery(con, "CREATE DATABASE nih_data;")

con2 <- dbConnect(MySQL(), user="username", password="password", dbname="nih_data", host="127.0.0.1", port=3306)
dbSendQuery(con2, "CREATE TABLE 2001_2015_data;")
setwd("Data/From Exporter")
filenames <- list.files(getwd(), pattern = ".csv")
for (i in 1:length(filenames)){
  dbSendQuery(con2,paste("load data local infile",paste("'",filenames[i],"'",sep=""),"into table 2001_2015_data character set utf8 fields terminated by",paste("'",",","'",sep=""),"ENCLOSED BY",paste("'",'"',"'",sep=""),"lines terminated by '\r\n' IGNORE 1 lines;",sep=" ")
  );
}

  





## MISC

# load one file into data frame
df2015 <- read.csv("Data/From Exporter/RePORTER_PRJ_C_FY2015.csv")

# Use mySQL



m<-dbDriver("MySQL")
un<-"username"
pw<-"password"
con <- dbConnect(m,user=un,password=pw,dbname="DATABASENAME",host="127.0.0.1",port=3306)
# con <- dbConnect(m,user=un,password=pw,dbname="DATABASENAME",host="127.0.0.1",port=3306)
dbListTables(con)

#Send the load query to the MySQL
setwd("Data/From Exporter")
filenames <- list.files(getwd(), pattern = ".csv")
for (i in 1:length(filenames)){
  dbSendQuery(con,paste("load data local infile",paste("'",filenames[i],"'",sep=""),"into table YOURTABLENAMES character set utf8 fields terminated by",paste("'",",","'",sep=""),"ENCLOSED BY",paste("'",'"',"'",sep=""),"lines terminated by '\r\n' IGNORE 1 lines;",sep=" ")
  );
}