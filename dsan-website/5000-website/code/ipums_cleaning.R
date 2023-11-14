library(tidyverse)
library(tidyr)

ipums <- read.csv("../data/ipums_numeric.csv")
colnames(ipums) <- c('year','sample','city_population_00s','age','income')
ipums <- ipums[-(which(ipums$city_population_00s %in% c(0,99999))),]
ipums <- ipums[-(which(ipums$income %in% c(-009995,-000001,0000000,0000001,9999999))),]
head(ipums)
nrow(ipums)
write.csv(ipums, "../data/cleaned_data/ipums_cleaned.csv")
