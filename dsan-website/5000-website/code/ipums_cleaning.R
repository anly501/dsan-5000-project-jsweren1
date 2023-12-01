library(tidyverse)
library(tidyr)

ipums <- read.csv("../data/ipums_numeric.csv")
colnames(ipums) <- c('city_population_00s','age','income','commute_method','commute_time')
ipums <- ipums[-(which(ipums$city_population_00s %in% c(0,99999))),]
ipums <- ipums[-(which(ipums$income %in% c(-009995,-000001,0000000,0000001,9999999))),]
ipums <- ipums[-(which(ipums$commute_method %in% c(0))),]
head(ipums)
nrow(ipums)
ipums$commute_method <- replace(ipums$commute_method, ipums$commute_method %in% c(10:15,20), "Private Vehicle")
ipums$commute_method <- replace(ipums$commute_method, ipums$commute_method %in% c(31:39), "Public Transit")
ipums$commute_method <- replace(ipums$commute_method, ipums$commute_method %in% c(50), "Bicycle")
ipums$commute_method <- replace(ipums$commute_method, ipums$commute_method %in% c(60), "Walked")
ipums$commute_method <- replace(ipums$commute_method, ipums$commute_method %in% c(70), "Other")
ipums$commute_method <- replace(ipums$commute_method, ipums$commute_method %in% c(80), "Worked From Home")
write.csv(ipums, "../data/cleaned_data/ipums_cleaned.csv")
