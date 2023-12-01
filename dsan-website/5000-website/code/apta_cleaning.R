library(tidyverse)
library(tidyr)
library(readxl)

cities <- read_excel("../data/apta-cities_9-23.xlsx",sheet = 2)
cities <- cities[-c(2,4:6,8:12,16:17,19:20)]
cities <- cities[(cities$Status %in% "Active" & cities$`Most Recent Report Year` %in% 2022),]
unique(cities$Status)
head(cities)
nrows <- length(unique(cities$`UZA Name`))
cities2 <- data.frame(City=character(nrows), Population=numeric(nrows), Area=numeric(nrows),
                      Cost_per_trip=numeric(nrows), Fare_per_trip=numeric(nrows), Miles_per_trip=numeric(nrows),
                      Total_trips=numeric(nrows))
cities2$City <- unique(cities$`UZA Name`)
for (i in 1:nrows) {
  cities2[i,2] <- as.numeric(unique(cities$`UZA Population`[cities$`UZA Name`==cities2[i,1]])[1])
}
for (i in 1:nrows) {
  cities2[i,3] <- round(as.numeric(unique(cities$`UZA SQ Miles`[cities$`UZA Name`==cities2[i,1]])[1]), digits = 2)
}
for (i in 1:nrows) {
  cities2[i,4] <- sum((cities$`Avg Cost Per Trip FY`[cities$`UZA Name`==cities2[i,1]] * cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]])
                      / sum(cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]]))
}
for (i in 1:nrows) {
  cities2[i,5] <- sum((cities$`Avg Fares Per Trip FY`[cities$`UZA Name`==cities2[i,1]] * cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]])
                      / sum(cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]]))
}
for (i in 1:nrows) {
  cities2[i,6] <- sum((cities$`Avg Trip Length FY`[cities$`UZA Name`==cities2[i,1]] * cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]])
                      / sum(cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]]))
}
for (i in 1:nrows) {
  cities2[i,7] <- sum(cities$`Unlinked Passenger Trips FY`[cities$`UZA Name`==cities2[i,1]])
}
cities2$Trips_per_capita <- cities2$Total_trips / cities2$Population
head(cities2)
write.csv(cities2, "../data/cleaned_data/apta_cities_cleaned.csv")
sapply(cities2, class)
