library(tidyverse)
library(tidyr)

employer <- read.csv("../data/WFH_monthly/WFH_monthly_employer.csv")
worker <- read.csv("../data/WFH_monthly/WFH_monthly_worker.csv")
employer <- employer[c(1:3)]
worker <- worker[c(1:3)]
plans <- merge(employer, worker, by = "date")
plans$date <- as.Date(plans$date, format = "%m/%d/%y")
plans <- plans[order(plans$date),]
colnames(plans)[c(2:5)] <- c("employer_desires_all", "employer_desires_able", "worker_desires_all", "worker_desires_able")
typeof(plans$employer_desires_all)
plans <- plans[!(is.na(plans$employer_desires_all) & is.na(plans$employer_desires_able)),]
head(plans)
write.csv(plans, "../data/cleaned_data/WFH_surveys_cleaned.csv")
