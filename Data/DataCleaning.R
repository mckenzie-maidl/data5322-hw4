library(tidyverse)
library(readxl)
library(abind)

#Get a list of all the sheet names
sheets <- excel_sheets("001_Main SPEED Dataset 2015.xlsx")

#How many sheets there are total
n <- length(sheets)


#Create the 2000 data frame using the first data sheet
data2010 <- read_excel("001_Main SPEED Dataset 2015.xlsx", sheet = 3, range = cell_cols("AI"))[1:147,]

#Read in the rest of the sheets and add to data frame
for (i in 4:n){
  currentsheet <- read_excel("001_Main SPEED Dataset 2015.xlsx", sheet = i, range = cell_cols("AI"))[1:147,]
  data2010 <- data.frame(data2010, currentsheet)
}

#Rename columns
colnames(data2010) <- sheets[3:n]

#add in country and region  
data2010 <- data.frame(read_excel("001_Main SPEED Dataset 2015.xlsx", sheet = 3, range = cell_cols("A:B"))[1:147,], data2010)

#save the data
save(data2010, file = 'data2010.Rdata')

#Create the 2012 data frame using the first data sheet
data2020 <- read_excel("001_Main SPEED Dataset 2015.xlsx", sheet = 3, range = cell_cols("AK"))[1:147,]

#Read in the rest of the sheets and add to data frame
for (i in 4:n){
  currentsheet <- read_excel("001_Main SPEED Dataset 2015.xlsx", sheet = i, range = cell_cols("AK"))[1:147,]
  data2012 <- data.frame(data2012, currentsheet)
}

#Rename columns
colnames(data2012) <- sheets[3:n]

#add in country and region  
data2012 <- data.frame(read_excel("001_Main SPEED Dataset 2015.xls", sheet = 3, range = cell_cols("A:B"))[1:147,], data2012)

#save the data
save(data2012, file = 'data2012.Rdata')