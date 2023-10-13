library(tidyverse)
library(tidyr)

wmata_monthly <- read.csv("../data/WMATA_boardings_by_month.csv")
wmata_monthly <- wmata_monthly[c(1,2),]
wmata_years <- c(colnames(wmata_monthly))
wmata <- data.frame(wmata_years, t(wmata_monthly[1,]), t(wmata_monthly[2,]))
wmata <- wmata[-1,]
wmata$date <- paste(1, wmata$X1, substr(wmata$wmata_years, 2, 5))
wmata$date <- as.Date(wmata$date, "%d %B %Y")
wmata <- wmata[c(4, 3)]
colnames(wmata)[2] <- "avg_daily_entries"
head(wmata)
write.csv(wmata, "../data/cleaned_data/wmata_monthly_ridership.csv")