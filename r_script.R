getwd()l
library(tidyverse)
fang<-read_tsv("https://raw.githubusercontent.com/EEOB-BioData/BCB546-Spring2022/main/assignments/UNIX_Assignment/fang_et_al_genotypes.txt")
view(fang)
snp<-read_tsv("https://raw.githubusercontent.com/EEOB-BioData/BCB546-Spring2022/main/assignments/UNIX_Assignment/snp_position.txt")
view(snp)
#Now I have both snp and fang files loaded and stored in objects in r
