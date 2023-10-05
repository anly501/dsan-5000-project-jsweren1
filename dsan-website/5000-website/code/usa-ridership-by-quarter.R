library(tidyverse)
library(tidyr) 

ridership <- read.csv("../data/APTA-Ridership-by-Mode-and-Quarter-1990-Present.csv")
ridership <- ridership[81:133,1:11]
colnames(ridership)[2] <- 'Year - Quarter'
ridership$Total.Ridership..000s. <- as.numeric(gsub(",","", ridership$Total.Ridership..000s.))
typeof(ridership$Total.Ridership..000s.)
ggplot(data=ridership, aes(x=factor(`Year - Quarter`), y=Total.Ridership..000s., group=1, xmin = "2015 - Q1", xmax="2023-Q1")) +
  geom_line()+
  geom_point()+
  labs(x = "Year - Quarter", y = "Total Ridership (000s)", title = "Total Public Transit Ridership in the U.S.")+
  theme(axis.text.x = element_text(angle = 45))