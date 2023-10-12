ridership <- read.csv("../data/APTA-Ridership-by-Mode-and-Quarter-1990-Present.csv")
ridership <- ridership[81:133,1:11]
colnames(ridership)[2] <- 'Year - Quarter'
ridership$Total.Ridership..000s. <- as.numeric(gsub(",","", ridership$Total.Ridership..000s.))