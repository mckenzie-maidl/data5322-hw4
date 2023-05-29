library(tidyverse)
library(readxl)
library(abind)

#Get a list of all the sheet names
sheets <- excel_sheets("001_Main SPEED Dataset 2015.xls")

#How many sheets there are total
n <- length(sheets)

#Create the 1980 data frame using the first data sheet
data1980 <- read_excel("001_Main SPEED Dataset 2015.xls", sheet = 3, range = cell_cols("E"))[1:147,]

#Read in the rest of the sheets and add to data frame
for (i in 4:n){
  currentsheet <- read_excel("001_Main SPEED Dataset 2015.xls", sheet = i, range = cell_cols("E"))[1:147,]
  data1980 <- data.frame(data1980, currentsheet)
}

#Rename columns
colnames(data1980) <- sheets[3:n]

#save the data
save(data1980, file = 'data1980.Rdata')

#add in country and region  
data1980 <- data.frame(read_excel("001_Main SPEED Dataset 2015.xls", sheet = 3, range = cell_cols("A:B"))[1:147,], data1980)

#Create the 2012 data frame using the first data sheet
data2012 <- read_excel("001_Main SPEED Dataset 2015.xls", sheet = 3, range = cell_cols("AK"))[1:147,]

#Read in the rest of the sheets and add to data frame
for (i in 4:n){
  currentsheet <- read_excel("001_Main SPEED Dataset 2015.xls", sheet = i, range = cell_cols("AK"))[1:147,]
  data2012 <- data.frame(data2012, currentsheet)
}

#Rename columns
colnames(data2012) <- sheets[3:n]

#add in country and region  
data2012 <- data.frame(read_excel("001_Main SPEED Dataset 2015.xls", sheet = 3, range = cell_cols("A:B"))[1:147,], data2012)

#save the data
save(data2012, file = 'data2012.Rdata')