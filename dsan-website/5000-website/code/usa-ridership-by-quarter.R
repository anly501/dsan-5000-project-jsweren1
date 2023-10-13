library(tidyverse)
library(tidyr) 

ridership <- read.csv("../data/APTA-Ridership-by-Mode-and-Quarter-1990-Present.csv")
ridership <- ridership[81:133,1:11]
colnames(ridership)[2] <- 'Year - Quarter'
colnames(ridership)[4:11] <- c("total_ridership", "heavy_rail", "light_rail", "commuter_rail", "trolleybus", "bus", "demand_response", "other")
ridership$total_ridership <- as.numeric(gsub(",","", ridership$total_ridership))
ridership$heavy_rail <- as.numeric(gsub(",","", ridership$heavy_rail))
ridership$light_rail <- as.numeric(gsub(",","", ridership$light_rail))
ridership$commuter_rail <- as.numeric(gsub(",","", ridership$commuter_rail))
ridership$trolleybus <- as.numeric(gsub(",","", ridership$trolleybus))
ridership$bus <- as.numeric(gsub(",","", ridership$bus))
ridership$demand_response <- as.numeric(gsub(",","", ridership$demand_response))
ridership$other <- as.numeric(gsub(",","", ridership$other))
ggplot(data=ridership, aes(x=factor(`Year - Quarter`), y=total_ridership, group=1, xmin = "2015 - Q1", xmax="2023-Q1")) +
  geom_line()+
  geom_point()+
  labs(x = "Year - Quarter", y = "Total Ridership (000s)", title = "Total Public Transit Ridership in the U.S.")+
  theme(axis.text.x = element_text(angle = 45))
ridership <- ridership[c(2, 4:11)]
head(ridership)
write.csv(ridership, "../data/cleaned_data/ridership_by_quarter_cleaned.csv")
