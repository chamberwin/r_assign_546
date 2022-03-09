getwd()
library(janitor)
library(tidyverse)
library(dplyr)
fang<-read_tsv("https://raw.githubusercontent.com/EEOB-BioData/BCB546-Spring2022/main/assignments/UNIX_Assignment/fang_et_al_genotypes.txt")
view(fang)
snp<-read_tsv("https://raw.githubusercontent.com/EEOB-BioData/BCB546-Spring2022/main/assignments/UNIX_Assignment/snp_position.txt")
view(snp)
#Now I have both snp and fang files loaded and stored in objects in r
fang #this tells me that fang is a 2782X986 tibble
snp #and snp is a 983x15 tibble. Considerably smaller
object.size(fang) #23.14 MB, or 23124584 bytes
object.size(snp) #359.384 KB, or 359384 bytes
#so to sum it up, fang is 2782 rows, 986 columns, and 23.14 MB
#while snp is 983 rows, 15 columns, and 359.384 KB. 
fangcols<-colnames(fang)
fangcols #here are the column names for my fang file
snpcols<- colnames(snp)
snpcols #and my column names for snp
#for both files, SNP_ID is the first column
#Additionally, it would be helpful to make my variables separate
#from my code as much as possible. Maybe alter it later?
maize <- filter(fang, `Group` %in% c('ZMMLR','ZMMR','ZMMIL'))
view(maize)
#this has created a subset of just the Maize values
teosinte <- filter(fang, `Group` %in% c('ZMPBA','ZMPIL','ZMPJA'))
view(teosinte)
#Now I also have a subset of teosinte data. 
transteo <- t(teosinte)
view(transteo)
transmaize <- t(maize)
view(transmaize)
#Next I will cut my snp file so that I have the columns
#SNP_ID, Chromosome, Position
snpsnip <- select(snp, c('SNP_ID','Chromosome','Position'))
view(snpsnip)
#looks good. Now I will trim and add a header using the "row_to_names" function
#of the "janitor" package. Very handy!
trimteo <- row_to_names(transteo, 3, remove_row = TRUE, remove_rows_above = TRUE)
trimmaize <- row_to_names(transmaize, 3, remove_row = TRUE, remove_rows_above = TRUE)
summary(trimteo)
summary(snpsnip)
#my two dataframes are equal length and sorted in the same way.I am now ready to join
#by the common column. 
