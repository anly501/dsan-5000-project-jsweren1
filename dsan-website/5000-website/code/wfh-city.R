library(tidyverse)
library(tidyr)

city <- read.csv("../data/WFH_monthly/WFH_monthly_city.csv")
city <- city[c(1, 5:13)]
city$date <- as.Date(city$date, format = "%m/%d/%y")
city <- city[order(city$date),]
colnames(city)[c(2:10)] <- c("Atlanta", "Bay Area", "Chicago", "DC", "Dallas", "Houston", "Los Angeles", "Miami", "New York")
city <- na.omit(city)
head(city)
write.csv(city, "../data/cleaned_data/WFH_city_cleaned.csv")
