library(tidyverse)
library(tidyr)
library(stringr)

demographics <- read.csv("../data/ridership_by_demographic_2021.csv")
colnames(demographics)[c(2,4,6,8)] <- c("total", "drive_alone", "carpool", "public_transit")
age <- demographics[c(3:8), c(1,2,4,6,8)]
colnames(age)[1] <- "age_group"
age$age_group <- str_trim(age$age_group, "left")
age$total <- as.numeric(substr(age$total, 1, nchar(age$total)-1))
age$drive_alone <- as.numeric(substr(age$drive_alone, 1, nchar(age$drive_alone)-1))
age$carpool <- as.numeric(substr(age$carpool, 1, nchar(age$carpool)-1))
age$public_transit <- as.numeric(substr(age$public_transit, 1, nchar(age$public_transit)-1))
head(age)
write.csv(age, "../data/cleaned_data/ridership_age.csv")

sex <- demographics[c(11:12), c(1,2,4,6,8)]
colnames(sex)[1] <- "sex"
sex$sex <- str_trim(sex$sex, "left")
sex$total <- as.numeric(substr(sex$total, 1, nchar(sex$total)-1))
sex$drive_alone <- as.numeric(substr(sex$drive_alone, 1, nchar(sex$drive_alone)-1))
sex$carpool <- as.numeric(substr(sex$carpool, 1, nchar(sex$carpool)-1))
sex$public_transit <- as.numeric(substr(sex$public_transit, 1, nchar(sex$public_transit)-1))
head(sex)
write.csv(sex, "../data/cleaned_data/ridership_sex.csv")

citizenship <- demographics[c(25:28), c(1,2,4,6,8)]
colnames(citizenship)[1] <- "status"
citizenship$status <- str_trim(citizenship$status, "left")
citizenship$total <- as.numeric(substr(citizenship$total, 1, nchar(citizenship$total)-1))
citizenship$drive_alone <- as.numeric(substr(citizenship$drive_alone, 1, nchar(citizenship$drive_alone)-1))
citizenship$carpool <- as.numeric(substr(citizenship$carpool, 1, nchar(citizenship$carpool)-1))
citizenship$public_transit <- as.numeric(substr(citizenship$public_transit, 1, nchar(citizenship$public_transit)-1))
head(citizenship)
write.csv(citizenship, "../data/cleaned_data/ridership_citizenship.csv")

earnings <- demographics[c(35:42), c(1,2,4,6,8)]
colnames(earnings)[1] <- "range"
earnings$range <- str_trim(earnings$range, "left")
earnings$total <- as.numeric(substr(earnings$total, 1, nchar(earnings$total)-1))
earnings$drive_alone <- as.numeric(substr(earnings$drive_alone, 1, nchar(earnings$drive_alone)-1))
earnings$carpool <- as.numeric(substr(earnings$carpool, 1, nchar(earnings$carpool)-1))
earnings$public_transit <- as.numeric(substr(earnings$public_transit, 1, nchar(earnings$public_transit)-1))
head(earnings)
write.csv(earnings, "../data/cleaned_data/ridership_earnings.csv")




