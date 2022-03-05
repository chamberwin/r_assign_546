getwd()l
library(tidyverse)
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
#while snp is 983 rows, 15 colums, and 359.384 KB. 

