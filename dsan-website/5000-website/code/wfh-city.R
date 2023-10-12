library(tidyverse)
library(tidyr)

city <- read.csv("../data/WFH_monthly/WFH_monthly_city.csv")
city <- city[c(1,6,8)]
city$date <- as.Date(city$date, format = "%m/%d/%y")
city <- city[order(city$date),]
colnames(city)[c(2,3)] <- c("wfh_BayArea", "wfh_WashingtonDC")
city <- na.omit(city)
typeof(city$wfh_BayArea)
head(city)
write.csv(city, "../data/cleaned_data/WFH_city_cleaned.csv")
