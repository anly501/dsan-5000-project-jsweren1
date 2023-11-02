#install.packages("readxl")
library("readxl")
library(tidyverse)
library(tidyr)

years <- c('2018','2019','2020','2021','2022','2023')
months <- c('01','02','03','04','05','06','07','08','09','10','11','12')
bart.output <- data.frame(c(), c())
count <- 1
for (i in years) {
  for (j in months) {
    if (i=='2023' & (j=='10' | j=='11' | j=='12')) {
      break
    }
    bart.output[count,1] <- as.Date(paste(1, j, i), "%d %m %Y")
    bart.monthly <- read_excel(paste("../data/BART_monthly_ridership/ridership_", i, "/Ridership_", i, j, ".xlsx", sep = ""))
    bart.output[count,2] <- as.integer(bart.monthly[nrow(bart.monthly), ncol(bart.monthly)])
    count <- count + 1
  }
}
colnames(bart.output) <- c("date", "daily_entries")
head(bart.output)
write.csv(bart.output, "../data/cleaned_data/bart_monthly_ridership.csv")
