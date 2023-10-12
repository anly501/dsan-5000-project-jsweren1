library(readxl)
library(httr)
url1<-'https://www.apta.com/wp-content/uploads/APTA-Ridership-by-Mode-and-Quarter-1990-Present.xlsx'
GET(url1, write_disk(tf <- tempfile(pattern = "APTA-Ridership-by-Mode-and-Quarter-1990-Present", fileext = ".xlsx", tmpdir = "../data")))
df <- read_excel(tf, 2L)
str(df)