library(tidyverse)
library(tidyr)

before <- read.csv("../data/WMATA_boardings_by_hour/boardings_pre-covid.csv")
after <- read.csv("../data/WMATA_boardings_by_hour/boardings_post-covid.csv")
before <- before[c(1,2,4)]
after <- after[c(1,2,4)]
colnames(before) <- c("hour", "avg_daily_entries", "avg_daily_exits")
colnames(after) <- c("hour", "avg_daily_entries", "avg_daily_exits")
before$avg_daily_entries <- as.numeric(gsub(",","", before$avg_daily_entries))
before$avg_daily_exits <- as.numeric(gsub(",","", before$avg_daily_exits))
after$avg_daily_entries <- as.numeric(gsub(",","", after$avg_daily_entries))
after$avg_daily_exits <- as.numeric(gsub(",","", after$avg_daily_exits))
before$hour_numeric <- c(4:23, 0:3)
after$hour_numeric <- c(4:23, 0:3)
before <- before[c(1,4,2,3)]
after <- after[c(1,4,2,3)]
ggplot(data=before, aes(x=factor(hour_numeric, ordered = FALSE), y=avg_daily_entries, group=1)) +
  geom_line()+
  geom_point()+
  labs(x = "Numeric Hour of Day", y = "Average Daily Entries", title = "Average Daily Entries by Hour (Pre-Pandemic)")
ggplot(data=after, aes(x=factor(hour_numeric, ordered = FALSE), y=avg_daily_entries, group=1)) +
  geom_line()+
  geom_point()+
  labs(x = "Numeric Hour of Day", y = "Average Daily Entries", title = "Average Daily Entries by Hour (Post-Pandemic)")
head(before)
head(after)
write.csv(before, "../data/cleaned_data/hourly_average_cleaned_pre-covid.csv")
write.csv(after, "../data/cleaned_data/hourly_average_cleaned_post-covid.csv")