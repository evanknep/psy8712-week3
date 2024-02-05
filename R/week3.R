#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df = read.csv("../Data/week3.csv")
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- subset(raw_df, grepl("2017-06", raw_df$timeStart) == FALSE)
clean_df <- subset(clean_df, q6==1)

#Analysis
clean_df$timeSpent <- abs(difftime(clean_df$timeStart, clean_df$timeEnd))
hist(as.integer(clean_df$timeSpent), xlab = 'Time Spent', main = 'Frequencies of Time Spent')
frequency_tables_list <- lapply(clean_df[5:14], table)
lapply(frequency_tables_list, barplot)
sum(clean_df$q1 >= clean_df$q2 & clean_df$q2 != clean_df$q3)
for (i in frequency_tables_list){
  barplot(i)}
